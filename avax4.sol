// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9/access/Ownable.sol";
import "@openzeppelin/contracts@4.9/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    struct Drink {
        string name;
        uint256 price;
    }

    mapping(uint256 => Drink) public drinks;
    uint256 public nextDrinkId;

    mapping(address => mapping(uint256 => uint256)) public userInventory; // User's inventory

    event DrinkPurchased(address indexed buyer, uint256 drinkId, string name, uint256 price);

    constructor() ERC20("Degen", "DGN") Ownable() {

        addDrink("Beer", 20);
        addDrink("Apple Juice", 10);
        addDrink("Vodka", 50);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public override {
        super.burn(amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }

    function addDrink(string memory _name, uint256 _price) public onlyOwner {
        drinks[nextDrinkId] = Drink(_name, _price);
        nextDrinkId++;
    }

    function buyDrink(uint256 _drinkId) external {
        require(_drinkId < nextDrinkId, "Invalid drink ID");
        Drink storage drink = drinks[_drinkId];
        require(balanceOf(msg.sender) >= drink.price, "Not enough Degen Tokens");

        _burn(msg.sender, drink.price);
        userInventory[msg.sender][_drinkId]++;

        emit DrinkPurchased(msg.sender, _drinkId, drink.name, drink.price);
        burn(drink.price);
    }
}
