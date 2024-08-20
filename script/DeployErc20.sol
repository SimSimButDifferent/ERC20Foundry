// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {ERC20Token} from "../src/ERC20Token.sol";

contract DeployERC20 is Script {

    uint256 public constant initialSupply = 1000000 ether;

    function run() public returns (ERC20Token) {

        vm.startBroadcast();

        address tokenReceiver = vm.envAddress("TOKEN_RECEIVER");

        ERC20Token erc20 = new ERC20Token(initialSupply);
        erc20.transfer(tokenReceiver, initialSupply);
 
        vm.stopBroadcast();

        console2.log("Deploying ERC20Token with initial supply:", initialSupply);
        console2.log("ERC20Token deployed at:", address(erc20));
        console2.log("Tokens transferred to:", tokenReceiver);
        console2.log("Network Chain ID:", block.chainid);

        return erc20;
    }
}
