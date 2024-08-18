// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../script/DeploymentConfig.sol";

contract DeploymentConfigTest is Test {
    DeploymentConfig public config;

    function setUp() public {
        config = new DeploymentConfig();
    }

    function testEthereumMainnetConfig() public {
        vm.chainId(1);
        vm.setEnv("ETHEREUM_MAINNET_PRIVATE_KEY", "1234");
        vm.setEnv("ETHEREUM_MAINNET_TOKEN_RECEIVER", "0x1234567890123456789012345678901234567890");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 1234);
        assertEq(networkConfig.tokenReceiver, 0x1234567890123456789012345678901234567890);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testEthereumSepoliaConfig() public {
        vm.chainId(11155111);
        vm.setEnv("ETHEREUM_SEPOLIA_PRIVATE_KEY", "5678");
        vm.setEnv("ETHEREUM_SEPOLIA_TOKEN_RECEIVER", "0x0987654321098765432109876543210987654321");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 5678);
        assertEq(networkConfig.tokenReceiver, 0x0987654321098765432109876543210987654321);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testMaticMainnetConfig() public {
        vm.chainId(137);
        vm.setEnv("MATIC_MAINNET_PRIVATE_KEY", "9876");
        vm.setEnv("MATIC_MAINNET_TOKEN_RECEIVER", "0x6789012345678901234567890123456789012345");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 9876);
        assertEq(networkConfig.tokenReceiver, 0x6789012345678901234567890123456789012345);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testMaticZkEVMMainnetConfig() public {
        vm.chainId(1101);
        vm.setEnv("MATIC_ZKEVM_MAINNET_PRIVATE_KEY", "5432");
        vm.setEnv("MATIC_ZKEVM_MAINNET_TOKEN_RECEIVER", "0x3456789012345678901234567890123456789012");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 5432);
        assertEq(networkConfig.tokenReceiver, 0x3456789012345678901234567890123456789012);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testMaticZkEVMTestnetConfig() public {
        vm.chainId(1442);
        vm.setEnv("MATIC_ZKEVM_TESTNET_PRIVATE_KEY", "4321");
        vm.setEnv("MATIC_ZKEVM_TESTNET_TOKEN_RECEIVER", "0x2345678901234567890123456789012345678901");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 4321);
        assertEq(networkConfig.tokenReceiver, 0x2345678901234567890123456789012345678901);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testBNBSmartChainMainnetConfig() public {
        vm.chainId(56);
        vm.setEnv("BNB_MAINNET_PRIVATE_KEY", "8765");
        vm.setEnv("BNB_MAINNET_TOKEN_RECEIVER", "0x4567890123456789012345678901234567890123");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 8765);
        assertEq(networkConfig.tokenReceiver, 0x4567890123456789012345678901234567890123);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testBNBSmartChainTestnetConfig() public {
        vm.chainId(97);
        vm.setEnv("BNB_TESTNET_PRIVATE_KEY", "7654");
        vm.setEnv("BNB_TESTNET_TOKEN_RECEIVER", "0x5678901234567890123456789012345678901234");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 7654);
        assertEq(networkConfig.tokenReceiver, 0x5678901234567890123456789012345678901234);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testAvalancheCChainConfig() public {
        vm.chainId(43114);
        vm.setEnv("AVAX_MAINNET_PRIVATE_KEY", "6543");
        vm.setEnv("AVAX_MAINNET_TOKEN_RECEIVER", "0x6789012345678901234567890123456789012345");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 6543);
        assertEq(networkConfig.tokenReceiver, 0x6789012345678901234567890123456789012345);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testAvalancheFujiConfig() public {
        vm.chainId(43113);
        vm.setEnv("AVAX_FUJI_PRIVATE_KEY", "7654");
        vm.setEnv("AVAX_FUJI_TOKEN_RECEIVER", "0x7890123456789012345678901234567890123456");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 7654);
        assertEq(networkConfig.tokenReceiver, 0x7890123456789012345678901234567890123456);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testArbitrumMainnetConfig() public {
    vm.chainId(42161);
    vm.setEnv("ARBITRUM_MAINNET_PRIVATE_KEY", "8765");
    vm.setEnv("ARBITRUM_MAINNET_TOKEN_RECEIVER", "0x4567890123456789012345678901234567890123");

    DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

    assertEq(networkConfig.deployerPrivateKey, 8765);
    assertEq(networkConfig.tokenReceiver, 0x4567890123456789012345678901234567890123);
    assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testArbitrumSepoliaConfig() public {
        vm.chainId(421614);
        vm.setEnv("ARBITRUM_SEPOLIA_PRIVATE_KEY", "7654");
        vm.setEnv("ARBITRUM_SEPOLIA_TOKEN_RECEIVER", "0x5678901234567890123456789012345678901234");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 7654);
        assertEq(networkConfig.tokenReceiver, 0x5678901234567890123456789012345678901234);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testBaseMainnetConfig() public {
        vm.chainId(8453);
        vm.setEnv("BASE_MAINNET_PRIVATE_KEY", "5432");
        vm.setEnv("BASE_MAINNET_TOKEN_RECEIVER", "0x3456789012345678901234567890123456789012");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 5432);
        assertEq(networkConfig.tokenReceiver, 0x3456789012345678901234567890123456789012);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testBaseSepoliaConfig() public {
        vm.chainId(84532);
        vm.setEnv("BASE_SEPOLIA_PRIVATE_KEY", "4321");
        vm.setEnv("BASE_SEPOLIA_TOKEN_RECEIVER", "0x2345678901234567890123456789012345678901");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 4321);
        assertEq(networkConfig.tokenReceiver, 0x2345678901234567890123456789012345678901);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testZkSyncMainnetConfig() public {
        vm.chainId(324);
        vm.setEnv("ZKSYNC_MAINNET_PRIVATE_KEY", "8765");
        vm.setEnv("ZKSYNC_MAINNET_TOKEN_RECEIVER", "0x4567890123456789012345678901234567890123");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 8765);
        assertEq(networkConfig.tokenReceiver, 0x4567890123456789012345678901234567890123);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }

    function testZkSyncSepoliaConfig() public {
        vm.chainId(300);
        vm.setEnv("ZKSYNC_SEPOLIA_PRIVATE_KEY", "7654");
        vm.setEnv("ZKSYNC_SEPOLIA_TOKEN_RECEIVER", "0x5678901234567890123456789012345678901234");

        DeploymentConfig.NetworkConfig memory networkConfig = config.getNetworkConfig();

        assertEq(networkConfig.deployerPrivateKey, 7654);
        assertEq(networkConfig.tokenReceiver, 0x5678901234567890123456789012345678901234);
        assertEq(networkConfig.initialSupply, 1000000 ether);
    }


    function testUnsupportedNetwork() public {
        vm.chainId(999);
        vm.expectRevert("Unsupported network");
        config.getNetworkConfig();
    }
}