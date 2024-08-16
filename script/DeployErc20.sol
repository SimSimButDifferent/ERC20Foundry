// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ERC20Token} from "../src/ERC20Token.sol";

contract DeployERC20 is Script {

    ERC20Token public token;
    uint256 public constant INITIAL_SUPPLY = 1000000 ether; // 1 million tokens

    function run() public returns (ERC20Token) {
        vm.startBroadcast();

        token = new ERC20Token(INITIAL_SUPPLY);

        vm.stopBroadcast();

        return token;
    }
}
