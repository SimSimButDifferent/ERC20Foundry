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

    function getNetworkConfig() public view returns (NetworkConfig memory) {
        if (block.chainid == 1) {
            return getEthereumMainnetConfig();
        } else if (block.chainid == 11155111) {
            return getEthereumSepoliaConfig();
        } else if (block.chainid == 137) {
            return getMaticMainnetConfig();
        } else if (block.chainid == 1101) {
            return getMaticZkEVMMainnetConfig();
        } else if (block.chainid == 1442) {
            return getMaticZkEVMTestnetConfig();
        } else if (block.chainid == 56) {
            return getBNBSmartChainMainnetConfig();
        } else if (block.chainid == 97) {
            return getBNBSmartChainTestnetConfig();
        } else if (block.chainid == 43114) {
            return getAvalancheCChainConfig();
        } else if (block.chainid == 43113) {
            return getAvalancheFujiConfig();
        } else if (block.chainid == 42161) {
            return getArbitrumMainnetConfig();
        } else if (block.chainid == 421614) {
            return getArbitrumSepoliaConfig();
        } else if (block.chainid == 8453) {
            return getBaseMainnetConfig();
        } else if (block.chainid == 84532) {
            return getBaseSepoliaConfig();
        } else if (block.chainid == 324) {
            return getZkSyncMainnetConfig();
        } else if (block.chainid == 300) {
            return getZkSyncSepoliaConfig();
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
            deployerPrivateKey: vm.envUint("MATIC_ZKEVM_TESTNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("MATIC_ZKEVM_TESTNET_TOKEN_RECEIVER"),
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

    function getBNBSmartChainTestnetConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("BNB_TESTNET_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("BNB_TESTNET_TOKEN_RECEIVER"),
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

    function getAvalancheFujiConfig() internal view returns (NetworkConfig memory) {
        return NetworkConfig({
            deployerPrivateKey: vm.envUint("AVAX_FUJI_PRIVATE_KEY"),
            tokenReceiver: vm.envAddress("AVAX_FUJI_TOKEN_RECEIVER"),
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