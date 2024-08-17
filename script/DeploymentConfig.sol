// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

contract DeploymentConfig is Script {
    struct NetworkConfig {
        uint256 deployerPrivateKey;
        address tokenReceiver;
        uint256 initialSupply;
    }

    NetworkConfig public activeNetworkConfig;

    constructor() {
        if (block.chainid == 1) {
            activeNetworkConfig = getEthereumMainnetConfig();
        } else if (block.chainid == 11155111) {
            activeNetworkConfig = getEthereumSepoliaConfig();
        } else if (block.chainid == 137) {
            activeNetworkConfig = getMaticMainnetConfig();
        } else if (block.chainid == 1101) {
            activeNetworkConfig = getMaticZkEVMMainnetConfig();
        } else if (block.chainid == 1442) {
            activeNetworkConfig = getMaticZkEVMTestnetConfig();
        } else if (block.chainid == 56) {
            activeNetworkConfig = getBNBSmartChainMainnetConfig();
        } else if (block.chainid == 97) {
            activeNetworkConfig = getBNBSmartChainSepoliaConfig();
        } else if (block.chainid == 43114) {
            activeNetworkConfig = getAvalancheCChainConfig();
        } else if (block.chainid == 43113) {
            activeNetworkConfig = getAvalancheSepoliaConfig();
        } else if (block.chainid == 42161) {
            activeNetworkConfig = getArbitrumMainnetConfig();
        } else if (block.chainid == 421614) {
            activeNetworkConfig = getArbitrumSepoliaConfig();
        } else if (block.chainid == 8453) {
            activeNetworkConfig = getBaseMainnetConfig();
        } else if (block.chainid == 84532) {
            activeNetworkConfig = getBaseSepoliaConfig();
        } else if (block.chainid == 324) {
            activeNetworkConfig = getZkSyncMainnetConfig();
        } else if (block.chainid == 300) {
            activeNetworkConfig = getZkSyncSepoliaConfig();
        } else {
            revert("Unsupported network");
        }
    }

    function getEthereumMainnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("ETHEREUM_MAINNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("ETHEREUM_MAINNET_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getEthereumSepoliaConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("ETHEREUM_SEPOLIA_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("ETHEREUM_SEPOLIA_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getMaticMainnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("MATIC_MAINNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("MATIC_MAINNET_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getMaticZkEVMMainnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("MATIC_ZKEVM_MAINNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("MATIC_ZKEVM_MAINNET_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getMaticZkEVMTestnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("MATIC_ZKEVM_SEPOLIA_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("MATIC_ZKEVM_SEPOLIA_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getBNBSmartChainMainnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("BNB_MAINNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("BNB_MAINNET_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getBNBSmartChainSepoliaConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("BNB_SEPOLIA_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("BNB_SEPOLIA_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getAvalancheCChainConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("AVAX_MAINNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("AVAX_MAINNET_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getAvalancheSepoliaConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("AVAX_SEPOLIA_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("AVAX_SEPOLIA_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getArbitrumMainnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("ARBITRUM_MAINNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("ARBITRUM_MAINNET_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getArbitrumSepoliaConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("ARBITRUM_SEPOLIA_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("ARBITRUM_SEPOLIA_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getBaseMainnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("BASE_MAINNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("BASE_MAINNET_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getBaseSepoliaConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("BASE_SEPOLIA_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("BASE_SEPOLIA_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getZkSyncMainnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("ZKSYNC_MAINNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("ZKSYNC_MAINNET_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }

    function getZkSyncSepoliaConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("ZKSYNC_SEPOLIA_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("ZKSYNC_SEPOLIA_TOKEN_RECEIVER"),
            initialSupply: 1000000 ether
        });
    }
}