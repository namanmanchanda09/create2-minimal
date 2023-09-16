// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract PairFactory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint256);

    mapping(address => mapping(address => address)) public getPair;

    function createPair(address tokenA, address tokenB, bytes memory creationcode) external returns (address pair) {
        require(tokenA != tokenB, "IDENTICAL_ADDRESSES");
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(getPair[token0][token1] == address(0), "PAIR_EXISTS");

        require(token0 != address(0), "ZERO_ADDRESS");

        bytes memory bytecode = abi.encodePacked(creationcode, abi.encode(tokenA, tokenB));


        // Solution
        assembly {
            pair := create2(0, add(bytecode, 0x20), mload(bytecode), 42)
            if iszero(extcodesize(pair)) { revert(0, 0) }
        }

        getPair[token0][token1] = pair;
        getPair[token1][token0] = pair;
    }
}
