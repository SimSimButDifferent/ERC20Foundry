# ERC20 Token Deployment Using Foundry

This project demonstrates how to create and deploy a simple ERC20 token using Foundry, a powerful toolkit for Ethereum application development.

## Overview

This project includes:
- An ERC20 token contract
- A deployment script for easy token deployment
- Configuration for multiple networks (including Ethereum testnets)

## Prerequisites

Before you begin, ensure you have the following installed:
- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/your-username/erc20foundry.git
   cd erc20foundry
   ```

2. Install dependencies:
   ```
   forge install
   ```

## Configuration

1. Create a `.env` file in the root directory with the following contents:
   ```
   PRIVATE_KEY=your_private_key_here_without_0x_prefix
   TOKEN_RECEIVER=0x_address_to_receive_initial_tokens
   RPC_URL=https://your-rpc-url
   ETHERSCAN_API_KEY=your-etherscan-api-key
   ```
   Replace the values with your actual private key, token receiver address, and RPC URL.

2. Load the environment variables:
   ```
   source .env
   ```

## Compilation

Compile the contracts:

```
forge build
```

## Testing

Run the tests:

```
forge test -vvv
```

## Deployment

To deploy the ERC20 token:

```
forge script script/DeployErc20.sol:DeployERC20 --rpc-url $RPC_URL --private-key $PRIVATE_KEY --etherscan-api-key $ETHERSCAN_API_KEY --broadcast --verify -vvvv
```

This command will:
- Deploy the ERC20 token contract
- Transfer the initial supply to the specified receiver address
- Verify the contract on Etherscan (if supported by the network)

## Contract Details

- Token Name: "TokenName"
- Token Symbol: "MyToken"
- Initial Supply: 1,000,000 tokens

You can modify these details in the `ERC20Token.sol` file.

## Networks

This project is configured to work with multiple networks, including Ethereum testnets like Sepolia. Ensure you have the correct RPC URL in your `.env` file for the network you want to deploy to.

## Security

- Never commit your `.env` file or expose your private keys.
- Ensure you're using a dedicated testnet account for development and testing.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.
