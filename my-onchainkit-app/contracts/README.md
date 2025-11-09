# Based AF - Smart Contracts

Smart contracts for the Based AF on-chain meme battle platform, built with Foundry.

## 📋 Contracts Overview

### CloutToken.sol
**ERC-20 voting token**
- Standard ERC-20 implementation
- Built-in faucet (1000 $CLOUT per 24 hours)
- Airdrop functionality
- Used for voting and power-ups

### ProfileNFT.sol
**Dynamic user profile NFTs**
- On-chain SVG metadata generation
- Win/loss tracking
- Cringe Cage status management
- Battle history recording

### MemeNFT.sol
**Battle meme NFTs**
- On-chain SVG storage
- Battle reference linking
- Based Beam airdrop (10 wallets)
- Permanent on-chain records

### BattleArena.sol
**Core game logic**
- War declaration system
- $CLOUT-based voting
- Automatic battle resolution
- Power-up implementation
- Event emission for frontend

## 🛠 Development with Foundry

Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.

### Quick Start

```bash
# Build contracts
forge build

# Run tests
forge test

# Run tests with gas report
forge test --gas-report

# Format code
forge fmt

# Deploy to Base Sepolia
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url https://sepolia.base.org \
  --account deployer \
  --broadcast \
  --verify
```

## 📚 Foundry Tools

- **Forge**: Ethereum testing framework (like Truffle, Hardhat)
- **Cast**: Swiss army knife for interacting with EVM smart contracts
- **Anvil**: Local Ethereum node (like Ganache, Hardhat Network)
- **Chisel**: Fast Solidity REPL

## 🔧 Common Commands

### Building
```bash
# Compile all contracts
forge build

# Clean build artifacts
forge clean
```

### Testing
```bash
# Run all tests
forge test

# Run specific test
forge test --match-test testFunctionName

# Run with verbosity
forge test -vvv

# Generate gas report
forge test --gas-report
```

### Contract Interaction
```bash
# Call a read-only function
cast call CONTRACT_ADDRESS "functionName()(returnType)" --rpc-url RPC_URL

# Send a transaction
cast send CONTRACT_ADDRESS "functionName()" --rpc-url RPC_URL --private-key KEY

# Get contract ABI
cast abi CONTRACT_ADDRESS --rpc-url RPC_URL
```

### Deployment
```bash
# Deploy with script
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url https://sepolia.base.org \
  --broadcast

# Verify on Base Explorer
forge verify-contract CONTRACT_ADDRESS CONTRACT_NAME \
  --chain-id 84532 \
  --etherscan-api-key API_KEY
```

## 🌐 Base Network Configuration

### Base Sepolia (Testnet)
```bash
# RPC URL
https://sepolia.base.org

# Chain ID
84532

# Explorer
https://sepolia-explorer.base.org
```

Add to `foundry.toml`:
```toml
[rpc_endpoints]
base_sepolia = "https://sepolia.base.org"

[etherscan]
base_sepolia = { key = "${BASESCAN_API_KEY}", url = "https://api-sepolia.basescan.org/api" }
```

## 📖 Documentation

- **Foundry Book**: https://book.getfoundry.sh/
- **Base Docs**: https://docs.base.org/
- **Solidity Docs**: https://docs.soliditylang.org/

## 🚀 Deployment Guide

For detailed deployment instructions, see [DEPLOYMENT.md](../DEPLOYMENT.md)

Quick deploy:
```bash
# Import key to Foundry keystore
cast wallet import deployer --interactive

# Deploy all contracts
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url https://sepolia.base.org \
  --account deployer \
  --broadcast \
  --verify
```

## ⚠️ Security

- Never commit private keys
- Use Foundry keystore for secure key management
- Test thoroughly on Base Sepolia before mainnet
- Audit contracts before production deployment
- Keep dependencies updated

## 🤝 Contributing

Built for the Base Buildathon. Contributions welcome!

---

**Built with Foundry on Base** 🔥
