// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AsphaltMoto is ERC20, Ownable {
// itemsId to its cost
    mapping(uint256 => uint256) public itemCosts; 
    // user add to the mapping of the items that use holds
    // 1 => 2 quantity of itemId 3 
    // 1-> ( 3 ->2 ) 
    mapping(address => mapping(uint256 => uint256)) public userItems; 

    constructor() Ownable(msg.sender) ERC20("DegenToken", "dtc") {
        _mint(msg.sender, 10 * 10**3); 
    }

    event TokensMinted(address to, uint256 amount);
    event TokensTransferred(address from, address to, uint256 amount);
    event TokensRedeemed(address from, uint256 itemId, uint256 amount);
    event TokensBurned(address from, uint256 amount);

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

    function redeemTokens(uint256 itemId) external validAmount(itemCosts[itemId]) {
        uint256 cost = itemCosts[itemId];
        _burn(msg.sender, cost);
        userItems[msg.sender][itemId]++;
        emit TokensRedeemed(msg.sender, itemId, cost);
    }

    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    function burnTokens(uint256 amount) external validAmount(amount) {
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    function setRedeemableItemCost(uint256 itemId, uint256 cost) external onlyOwner {
        itemCosts[itemId] = cost;
    }
}
