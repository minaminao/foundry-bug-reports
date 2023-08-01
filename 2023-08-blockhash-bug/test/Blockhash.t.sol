// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";

contract ContractTest is Test {
    event Log(bytes32 blockhash);

    function setUp() public {}

    function test() public {
        uint256 startBlockNumber = block.number - 4;
        for (uint256 i = 1; i < 10; i++) {
            vm.roll(startBlockNumber + i);
            emit Log(blockhash(block.number - 1));
            require(blockhash(block.number - 2) != blockhash(block.number - 1), "blockhash collision");
        }
    }
}
