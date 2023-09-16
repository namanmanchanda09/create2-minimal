// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Pair} from "../src/Pair.sol";
import {WETH} from "../src/tokens/WETH.sol";
import {USDC} from "../src/tokens/USDC.sol";
import {console, Test} from "forge-std/Test.sol";
import {IPair} from "../src/interfaces/IPair.sol";
import {PairFactory} from "../src/PairFactory.sol";

contract PairFactoryTest is Test {
    PairFactory public factory;
    WETH public token0;
    USDC public token1;

    function setUp() public {
        factory = new PairFactory();
        token0 = new WETH();
        token1 = new USDC();
    }

    function testCreateAndGetPair() public returns (address pairAddress) {

        // get the creation code from Pair contract
        bytes memory _creationCode = type(Pair).creationCode;

        //  call the PairFactory contract(createPair)
        pairAddress = factory.createPair(address(token0), address(token1), _creationCode);
        console.log("PairAddress", pairAddress);
        assert(pairAddress != address(0));

        // call the PairFactory contract(getPair)
        address getPairAddress = factory.getPair(address(token0), address(token1));
        assertEq(getPairAddress, pairAddress);

        IPair pairContract = IPair(pairAddress);
        assertEq(address(token0), pairContract.token0());
        assertEq(address(token1), pairContract.token1());
    }
}

