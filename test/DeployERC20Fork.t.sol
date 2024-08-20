// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../script/DeployErc20.sol";
import "../src/ERC20Token.sol";

contract DeployERC20ForkTest is Test {
    DeployERC20 public deployer;
    ERC20Token public token;
    address public tokenReceiver;

    function setUp() public {
        // Fork Ethereum mainnet
        vm.createSelectFork(vm.envString("RPC_URL"));
        
        // Set up the deployer
        deployer = new DeployERC20();
        
        // Set a mock address for the token receiver
        tokenReceiver = makeAddr("tokenReceiver");

        // Set environment variables for the test
        vm.setEnv("PRIVATE_KEY", "1234"); // Use a dummy private key for testing
        vm.setEnv("TOKEN_RECEIVER", vm.toString(tokenReceiver));
    }

    function testDeployOnFork() public {
        // Deploy the token
        token = deployer.run();
        
        // Check if the token was deployed successfully
        assertTrue(address(token) != address(0), "Token was not deployed");
        
        // Check if the initial supply was minted and transferred to the receiver
        assertEq(token.balanceOf(tokenReceiver), 1000000 ether, "Incorrect token balance for receiver");
        
        // Check token details
        assertEq(token.name(), "TokenName", "Incorrect token name");
        assertEq(token.symbol(), "MyToken", "Incorrect token symbol");
        assertEq(token.totalSupply(), 1000000 ether, "Incorrect total supply");
        
        // Check that the chain ID is correct for Ethereum mainnet
        assertEq(block.chainid, 11155111, "Not forked to Sepolia testnet");
    }
}