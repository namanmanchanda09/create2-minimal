// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

interface IPair {
    function token0() external view returns (address);
    function token1() external view returns (address);
}
