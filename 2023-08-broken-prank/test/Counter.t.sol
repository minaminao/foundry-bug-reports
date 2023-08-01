// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, Vm} from "forge-std/Test.sol";

contract ContractTest is Test {
    function test() public {
        address player = makeAddr("player");
        SenderLogger senderLogger = new SenderLogger();

        senderLogger.log(); // Log(ContractTest, DefaultSender)
        vm.startPrank(player, player);
        senderLogger.log(); // Log(player, player)
        new Contract().f();
        senderLogger.log(); // Log(ContractTest, player) <- ?!
        vm.stopPrank(); // FAIL. Reason: No prank in progress to stop
    }
}

contract Contract {
    Vm public constant vm = Vm(address(bytes20(uint160(uint256(keccak256("hevm cheat code"))))));

    function f() public {
        vm.prank(msg.sender);
    }
}

contract SenderLogger {
    event Log(address, address);

    function log() public {
        emit Log(msg.sender, tx.origin);
    }
}
