// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AsphaltMotoToken is ERC20, Ownable {

   constructor() Ownable(msg.sender) ERC20("AsphaltMotoToken", "AMOTO") {
    _mint(msg.sender, 10000 * 10**18); 
    }

    event TokensMinted(address indexed to, uint256 amount);
    event TokensTransferred(address indexed from, address indexed to, uint256 amount);
    event TokensRedeemed(address indexed from, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);


    modifier validAmount(uint256 amount) {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _;
    }

    function mint(address to, uint256 amount) external onlyOwner validAmount(amount) {
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function transferTokens(address to, uint256 amount) external validAmount(amount) {
        _transfer(msg.sender, to, amount);
        emit TokensTransferred(msg.sender, to, amount);
    }

    function redeemTokens(uint256 amount) external validAmount(amount) {
        _burn(msg.sender, amount);
        emit TokensRedeemed(msg.sender, amount);
    }

    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    function burnTokens(uint256 amount) external validAmount(amount) {
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }
}
