# Project Title

The Degen Token is a program is a shows the application of redeeming, transferring, burning, and checking of balance or tokens of users.

## Description

The Degen Token (DGN) is an ERC20 token created for enabling users to to mint, transfer, redeem, and manage their currency and rewards.

Features:

1. Minting New Tokens
2. Transferring Tokens
3. Redeeming Tokens
4. Checking Token Balance
5. Burning Tokens

## Getting Started

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

To run this program, you can use Remix, an online Solidity IDE.

Go to the Remix website at https://remix.ethereum.org/ then create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension. Before compiling, copy and paste this code:

```javascript
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the Compile "DegenToken.sol" button.

Before deploying, make sure that your environment is set to Injected Provider-Metamask. 

There are also a few configurations that you must make before you proceed.

Use these settings on the website: https://core.app/en/tools/testnet-faucet/?subnet=c
Select network: Fuji (C-Chain)
Select token: AVAX
Address: (The address of your metamask account)
Coupon Code: avaxstrong (optional)

Once the code is compiled, click "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ERC20 Token.sol" contract from the dropdown menu, type in the name that you want for the contract and then click on the "Deploy" button.

Upon deployment you will be asked to confirm connection by metamask, just click confirm. 

Proceed to the dropdown of the contract you have created, click the functions to run them. You will see if they worked in the terminal, another way of verifying is by going to https://testnet.snowtrace.io/.

To check your transactions, copy the address of your contract and paste it on the search bar of https://testnet.snowtrace.io/. There you will see creation of the contract and the methods used. 

## Authors

Elijah Raphael A. Gaylan
