# Base Buildathon Project

> Building on Base - Ethereum Layer 2 for the next billion users onchain

## Project Overview

This repository is set up for the Base Buildathon, focusing on creating onchain applications with real user impact.

## What is Base?

Base is a fast, low-cost, builder-friendly Ethereum L2 built to bring the next billion users onchain. It's incubated by Coinbase and provides:
- Sub-cent transaction fees
- Fast block times
- Full EVM compatibility
- Built-in distribution through Coinbase ecosystem

## Tech Stack

- **Frontend**: Next.js + OnchainKit
- **Smart Contracts**: Solidity + Foundry
- **Deployment**: Vercel (frontend) + Base (contracts)
- **Wallet**: Coinbase Wallet / MetaMask
- **Network**: Base Sepolia (testnet) → Base Mainnet (production)

## Getting Started

See [SETUP.md](./SETUP.md) for detailed setup instructions.

### Quick Start

```bash
# Initialize OnchainKit project
npm create onchain@latest

# Or clone this repo and install
npm install
npm run dev
```

## Project Structure

```
hackathon/
├── README.md           # This file
├── SETUP.md           # Detailed setup guide
├── .gitignore         # Git ignore patterns
├── contracts/         # Smart contracts (Foundry)
│   ├── src/
│   ├── test/
│   └── script/
└── app/               # Next.js frontend (if using OnchainKit)
    ├── components/
    ├── app/
    └── public/
```

## Development Workflow

1. **Design & Prototype**: Use Lovable for rapid UI prototyping
2. **Smart Contracts**: Write and test contracts with Foundry
3. **Deploy to Testnet**: Deploy to Base Sepolia for testing
4. **Build Frontend**: Create React app with OnchainKit components
5. **Integrate**: Connect frontend to deployed contracts
6. **Test**: Thoroughly test on Base Sepolia
7. **Deploy**: Ship to Base Mainnet and Vercel

## Key Features to Consider

- 🔐 Wallet authentication with Coinbase/MetaMask
- 💸 Gasless transactions with Paymaster
- 🆔 Coinbase Verified identity integration
- 🎮 Low-cost onchain gaming/creator tools
- 📱 Mini Apps for Coinbase social feed
- 💰 Payment intents and commerce features

## Resources

- [Base Docs](https://docs.base.org/)
- [OnchainKit Docs](https://docs.base.org/onchainkit)
- [Foundry Book](https://book.getfoundry.sh/)
- [Base GitHub](https://github.com/base)

## Network Information

### Base Sepolia (Testnet)
- RPC: https://sepolia.base.org
- Chain ID: 84532
- Explorer: https://sepolia-explorer.base.org

### Base Mainnet
- RPC: https://mainnet.base.org
- Chain ID: 8453
- Explorer: https://base.blockscout.com/

## License

MIT
