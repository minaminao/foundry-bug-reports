// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Contract.sol";

contract ContractTest is Test {
    function setUp() public {
        vm.createSelectFork("https://rpc.ankr.com/eth_goerli", 7329883);
    }

    function test() public {
        new Contract();
    }
}
