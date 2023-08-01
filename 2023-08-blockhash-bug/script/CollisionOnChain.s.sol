// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Vm} from "forge-std/Vm.sol";

// forge script CollisionOnChainScript -vvvvv --broadcast --private-key $PRIVATE_KEY --slow

contract CollisionOnChainScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        Contract c = new Contract();
        for (uint256 i = 1; i < 10; i++) {
            c.f();
        }
    }
}

contract Contract {
    // do not add view
    function f() public {
        require(blockhash(block.number - 2) != blockhash(block.number - 1), "blockhash collision");
    }
}
