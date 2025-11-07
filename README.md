# 🔥 Based AF - The On-Chain Clout Battleground

> **Where memes become immortal and losers get caged**

## 🎯 Project Overview

Based AF is a revolutionary live, on-chain meme war platform built on Base where users battle for social dominance. It's Twitter meets Twitch meets crypto - pure digital chaos on the blockchain.

**Built for the Base Buildathon** - A project showcasing the power of Base's fast, low-cost infrastructure for next-generation social applications.

## 🎮 How It Works

### The Concept
1. **Create Your "Base"** - Each player gets a profile as an NFT on Base
2. **Mint Absolute Fire** - Create spicy memes as on-chain NFTs
3. **Declare War** - Challenge someone to a "clout battle"
4. **The Arena** - Live feed where people vote with $CLOUT tokens
5. **Winner Takes All** - Winning meme gets immortalized on-chain, loser's profile gets temporarily tarnished

### 🔥 Key Features

#### The Stunt Button
- One-click mint your meme directly to Base
- Gasless transactions via Base Paymaster
- Every battle permanently recorded on-chain

#### Clout Cannons (Power-Ups)
- **Viral Boost** - 2x votes for 30 seconds (100 $CLOUT)
- **Ratio Shield** - Immune to downvotes (100 $CLOUT)
- **Based Beam** - Auto-mint to 10 random wallets (100 $CLOUT)

#### The Cringe Cage
- Losers trapped for 1 hour with giant L
- Profile displays cringe status
- Escape by paying $CLOUT bail

## 🛠 Tech Stack

- **Frontend**: Next.js 15 + OnchainKit + Tailwind CSS
- **Smart Contracts**: Solidity + Foundry
  - `CloutToken.sol` - ERC-20 voting token with faucet
  - `ProfileNFT.sol` - Dynamic SVG profile NFTs
  - `MemeNFT.sol` - Battle meme NFTs with airdrop
  - `BattleArena.sol` - Complete battle system
- **Deployment**: Vercel (frontend) + Base Sepolia (contracts)
- **Wallet**: Coinbase Wallet / MetaMask
- **Network**: Base Sepolia (testnet) → Base Mainnet (production)

## 📂 Project Structure

```
hackathon/
├── README.md              # Project overview (you are here)
├── SETUP.md              # Detailed setup guide
├── my-onchainkit-app/    # Main application
│   ├── README.md         # App-specific documentation
│   ├── DEPLOYMENT.md     # Deployment guide
│   ├── NEXT-STEPS.md     # Development roadmap
│   ├── QUICK-REF.md      # Quick reference for common tasks
│   ├── app/              # Next.js frontend
│   ├── contracts/        # Solidity smart contracts
│   │   ├── src/          # Contract source files
│   │   ├── test/         # Contract tests
│   │   └── script/       # Deployment scripts
│   └── public/           # Static assets
└── baseAF/               # Additional resources
```

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- Coinbase Wallet or MetaMask
- Base Sepolia testnet ETH (from [faucet](https://portal.cdp.coinbase.com/products/faucet))
- Coinbase Developer Platform API Key

### Installation

```bash
# Clone the repository
git clone https://github.com/ThisIsPhila/hackathon.git
cd hackathon/my-onchainkit-app

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env.local
# Add your CDP_API_KEY and contract addresses

# Run development server
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000) to see the app!

For detailed setup instructions, see [SETUP.md](./SETUP.md).

## 🎬 Demo Flow

Perfect for presenting the project:

1. **👤 Create Profile** - Mint your profile NFT on Base
2. **💰 Get CLOUT** - Use faucet for 1000 $CLOUT tokens
3. **⚔️ Declare War** - Challenge another player
4. **🎨 Submit Memes** - Both players create their best meme
5. **🗳️ Community Votes** - 2-minute voting period with $CLOUT
6. **🏆 Winner Announced** - Winning meme minted on-chain, loser sent to Cringe Cage
7. **🚀 Based Beam** - Airdrop winning meme to 10 wallets
8. **🔍 Verify On-Chain** - View on [Base Sepolia Explorer](https://sepolia-explorer.base.org)

## 💎 Why Base?

Base is the perfect platform for Based AF because it provides:
- **⚡ Lightning Fast** - Sub-second block times for real-time battles
- **💵 Dirt Cheap** - Sub-cent transaction fees make voting affordable
- **🔗 Full EVM Compatibility** - Use standard Solidity tools
- **🌐 Coinbase Integration** - Built-in distribution to millions of users
- **🛡️ Secure** - Built on Ethereum's security model

## 🌐 Network Information

### Base Sepolia (Testnet)
- **RPC**: https://sepolia.base.org
- **Chain ID**: 84532
- **Explorer**: https://sepolia-explorer.base.org
- **Faucet**: https://portal.cdp.coinbase.com/products/faucet

### Base Mainnet (Production)
- **RPC**: https://mainnet.base.org
- **Chain ID**: 8453
- **Explorer**: https://base.blockscout.com/

## 📚 Documentation

- **[SETUP.md](./SETUP.md)** - Complete setup guide with prerequisites
- **[my-onchainkit-app/README.md](./my-onchainkit-app/README.md)** - Application-specific documentation
- **[my-onchainkit-app/DEPLOYMENT.md](./my-onchainkit-app/DEPLOYMENT.md)** - Smart contract deployment guide
- **[my-onchainkit-app/NEXT-STEPS.md](./my-onchainkit-app/NEXT-STEPS.md)** - Development roadmap
- **[my-onchainkit-app/QUICK-REF.md](./my-onchainkit-app/QUICK-REF.md)** - Quick reference for commands

## 🎓 Resources

- [Base Documentation](https://docs.base.org/)
- [OnchainKit Documentation](https://docs.base.org/onchainkit)
- [Foundry Book](https://book.getfoundry.sh/)
- [Base GitHub](https://github.com/base)
- [Base Faucets](https://docs.base.org/base-chain/tools/network-faucets)

## 🏗️ Development Status

- ✅ Smart contracts designed and implemented
- ✅ Foundry setup and configuration
- ✅ Deployment scripts ready
- ✅ OnchainKit integration
- ⏳ Frontend UI components (in progress)
- ⏳ Testing and optimization
- ⏳ Production deployment

## 🤝 Contributing

This is a Base Buildathon project. Contributions, issues, and feature requests are welcome!

## 📄 License

MIT

---

**Built with ❤️ on Base** | [Base Buildathon 2024](https://base.org/buildathon)
