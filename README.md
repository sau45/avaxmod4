# AsphaltMotoToken

AsphaltMotoToken is an ERC-20 token implemented on the Ethereum blockchain. It is designed to be used in the context of a decentralized application (dApp) for managing and transferring tokens.

## Introduction

This Ethereum smart contract, AsphaltMotoToken, is an ERC-20 token that extends the functionality of the OpenZeppelin ERC20 and Ownable contracts. It provides basic token operations such as minting, transferring, redeeming, and burning, while also ensuring ownership control.

## Token Information

- **Name**: AsphaltMotoToken
- **Symbol**: AMOTO
- **Decimals**: 18
- **Total Supply**: 10,000 AMOTO

## Contract Features

- Minting: The owner can mint new tokens and assign them to a specified address.
- Transferring: Token holders can transfer tokens to other addresses.
- Redeeming: Token holders can burn (redeem) their own tokens.
- Burning: Token holders can burn their own tokens.
- Ownership: The contract inherits from Ownable, ensuring that only the owner can perform certain operations.
