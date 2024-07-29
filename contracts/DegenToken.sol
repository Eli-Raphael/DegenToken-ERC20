// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    constructor(string memory name, string memory symbol) ERC20(name, symbol) Ownable(msg.sender){
        _mint(msg.sender, 1000 * 10**decimals());  
    }

    uint256 public constant REDEMPTION_RATE = 100; 

    mapping(address => uint256) public itemsRedeemed;

    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }

    function redeemTokens(uint256 quantity) public {
        uint256 cost = REDEMPTION_RATE * quantity;
        require(balanceOf(msg.sender) >= cost, "Not enough tokens to redeem");
        _burn(msg.sender, cost);
        itemsRedeemed[msg.sender] += quantity;
    }

    function checkItemsRedeemed(address user) public view returns (uint256) {
        return itemsRedeemed[user];
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}
