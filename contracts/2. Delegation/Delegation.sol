// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Delegate {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    function pwn() public {
        owner = msg.sender;
    }
}
/*
When a function is executed with delegatecall these values do not change:
address(this)
msg.sender
msg.value

Reads and writes to state variables happen to the contract that loads and executes functions with delegatecall. Reads and writes never happen to the contract that holds functions that are retrieved.

So if ContractA uses delegatecall to execute a function from ContractB then the following two points are true:

The state variables in ContractA can be read and written.
The state variables in ContractB are never read or written.
*/

contract Delegation {
    address public owner;
    Delegate public delegate;

    constructor(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender;
    }

    fallback() external {
        (bool result, ) = address(delegate).delegatecall(msg.data);
        if (result == true) {
            this;
        }
    }
}
