// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, Vm} from "forge-std/Test.sol";

contract ContractTest is Test {
    function test() public {
        address player = makeAddr("player");
        SenderLogger senderLogger = new SenderLogger();
        Contract c = new Contract();

        senderLogger.log(); // Log(ContractTest, DefaultSender)
        vm.startPrank(player, player);
        senderLogger.log(); // Log(player, player)
        c.f(); // vm.startPrank(player)
        senderLogger.log(); // Log(ContractTest, player) <- ContractTest should be player
        vm.stopPrank();
    }
}

contract Contract {
    Vm public constant vm = Vm(address(bytes20(uint160(uint256(keccak256("hevm cheat code"))))));

    function f() public {
        vm.startPrank(msg.sender);
    }
}

contract SenderLogger {
    event Log(address, address);

    function log() public {
        emit Log(msg.sender, tx.origin);
    }
}
