# AsphaltMoto ERC20 Token Contract

This Solidity smart contract implements the AsphaltMoto ERC20 token, named "DegenToken" with the symbol "dtc". It is designed to be owned by an address that can control minting and set redeemable item costs. The contract also includes functionalities for transferring tokens, redeeming items, checking balances, and burning tokens.

## Features

- Minting tokens by the owner.
- Transferring tokens between addresses.
- Redeeming items using tokens.
- Burning tokens.
- Setting redeemable item costs.

## Contract Details

- **Token Name:** DegenToken
- **Token Symbol:** dtc
- **Decimals:** 18
- **Initial Supply:** 10,000 tokens


## Contract Features

- Minting: The owner can mint new tokens and assign them to a specified address.
- Transferring: Token holders can transfer tokens to other addresses.
- Redeeming: Token holders can burn (redeem) their own tokens.
- Burning: Token holders can burn their own tokens.
- Ownership: The contract inherits from Ownable, ensuring that only the owner can perform certain operations.
