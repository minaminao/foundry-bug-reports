// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new Contract().f();
    }
}

contract Contract {
    event Log(uint256);

    function f() public {
        emit Log(0);
    }
}
