// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ERC20Token} from "../src/ERC20Token.sol";
import {DeploymentConfig} from "./DeploymentConfig.sol";

contract DeployERC20 is Script {
    function run() public returns (ERC20Token) {
        DeploymentConfig config = new DeploymentConfig();
        DeploymentConfig.NetworkConfig memory networkConfig = config.activeNetworkConfig();

        vm.startBroadcast(networkConfig.deployerPrivateKey);

        ERC20Token erc20 = new ERC20Token(networkConfig.initialSupply);
        erc20.transfer(networkConfig.tokenReceiver, networkConfig.initialSupply);

        vm.stopBroadcast();

        console.log("ERC20Token deployed at:", address(erc20));
        console.log("Tokens transferred to:", networkConfig.tokenReceiver);
        console.log("Network Chain ID:", block.chainid);

        return erc20;
    }
}
