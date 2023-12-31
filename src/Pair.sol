// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Pair {
    address public immutable token0;
    address public immutable token1;

    constructor(address _token0, address _token1) {
        token0 = _token0;
        token1 = _token1;
    }
}