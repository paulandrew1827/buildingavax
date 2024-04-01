# DegenToken

## Overview
DegenToken is a solidity smart contract that implements an ERC20 token with additional functionalities such as buying drinks using tokens and managing user inventories.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Prerequisites
This project is developed using Solidity version ^0.8.9. Make sure you have the appropriate compiler version installed.

## Dependencies
This project relies on OpenZeppelin library for ERC20 token implementation. The following dependencies are used:
- "@openzeppelin/contracts@4.9/token/ERC20/ERC20.sol"
- "@openzeppelin/contracts@4.9/access/Ownable.sol"
- "@openzeppelin/contracts@4.9/token/ERC20/extensions/ERC20Burnable.sol"

## Functionality
- ERC20 token functionality: This contract extends ERC20 token, providing basic token functionalities like transfer, balance inquiry, and allowance management.
- Drink Purchase: Users can buy drinks using Degen tokens. Each drink has a name and price associated with it. Drink information is stored in the contract and can be added by the owner.
- User Inventory Management: The contract maintains an inventory for each user, tracking the quantity of each drink they have purchased.
