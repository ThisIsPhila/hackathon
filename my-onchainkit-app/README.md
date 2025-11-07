# 🔥 Based AF - The On-Chain Clout Battleground

> **Where memes become immortal and losers get caged**

Based AF is a live, on-chain meme war platform built on Base where users battle for social dominance. It's the intersection of social media, gaming, and blockchain - creating permanent, verifiable digital culture.

## 🎯 The Vision

We're solving the ephemeral nature of social media battles by putting them on-chain:
- **Permanent Records** - Every battle, every vote, every victory is immortalized on Base
- **True Ownership** - Your profile, your memes, your clout - all as NFTs you truly own
- **Economic Incentives** - $CLOUT tokens create real stakes in social battles
- **Transparent Voting** - No algorithm manipulation, just pure community consensus
- **Viral Mechanics** - Power-ups and airdrops spread content organically

## 🎮 How It Works

### The Battle Flow
1. **👤 Create Your Base** - Mint a profile NFT with dynamic stats (wins/losses)
2. **💰 Get Armed** - Claim 1000 $CLOUT tokens from the faucet (24hr cooldown)
3. **⚔️ Declare War** - Challenge any player to a clout battle
4. **🎨 Create Fire** - Both players submit their best meme (2 min deadline)
5. **🗳️ The Arena** - Community votes with $CLOUT for 2 minutes
6. **🏆 Victory** - Winner's meme minted as NFT, loser goes to Cringe Cage
7. **🚀 Go Viral** - Use Based Beam to airdrop winner to 10 random wallets

### 🔥 Core Features

#### Dynamic Profile NFTs
- SVG-based, fully on-chain
- Live win/loss stats
- Cringe Cage status display
- Upgradeable and tradeable

#### $CLOUT Token Economy
- ERC-20 voting token
- Fair faucet distribution
- Used for voting and power-ups
- Creates economic stakes

#### Battle Arena
- Real-time voting mechanism
- Transparent vote counting
- Automatic resolution
- On-chain battle history

#### Power-Ups (Clout Cannons)

**Viral Boost** - 100 $CLOUT
- Double vote weight for 30 seconds
- Perfect for comeback moments
- Limited to one use per battle

**Ratio Shield** - 100 $CLOUT
- Immune to opponent's votes
- Defensive strategy play
- 30 second duration

**Based Beam** - 100 $CLOUT
- Airdrop your meme to 10 random wallets
- Instant viral distribution
- Great for winners to spread dominance

#### The Cringe Cage

Losers face consequences:
- 1 hour lockout from new battles
- Profile displays giant "L" badge
- Cringe status visible to all
- Can pay $CLOUT bail to escape early
- Builds reputation system

## 🛠 Tech Stack

### Smart Contracts (Solidity + Foundry)

**CloutToken.sol** - ERC-20 Voting Token
- 1000 $CLOUT faucet claim (24hr cooldown)
- Transfer and approval functions
- Airdrop capabilities
- Used for voting and power-ups

**ProfileNFT.sol** - Dynamic User Profiles
- On-chain SVG generation
- Win/loss tracking
- Cringe Cage status
- Upgradeable metadata

**MemeNFT.sol** - Battle Meme NFTs
- SVG-based meme storage
- Battle reference tracking
- Airdrop via Based Beam
- Permanent on-chain records

**BattleArena.sol** - Core Game Logic
- War declaration system
- Voting mechanism with $CLOUT
- Automatic battle resolution
- Power-up implementation
- Event emission for frontend

### Frontend (Next.js + OnchainKit)

- **Framework**: Next.js 15 with App Router
- **Web3**: OnchainKit by Coinbase
- **Styling**: Tailwind CSS
- **Wallet**: Coinbase Wallet / MetaMask integration
- **Network**: Base Sepolia (testnet)

### Deployment

- **Contracts**: Base Sepolia via Foundry
- **Frontend**: Vercel (ready for deployment)
- **Tools**: Wagmi, Viem for Web3 interaction

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ installed
- Coinbase Wallet or MetaMask
- Base Sepolia testnet ETH ([get free ETH](https://portal.cdp.coinbase.com/products/faucet))
- Coinbase Developer Platform API Key

### 1. Install Dependencies

```bash
cd my-onchainkit-app
npm install
```

### 2. Configure Environment

Create `.env.local`:
```env
NEXT_PUBLIC_CDP_API_KEY=your_api_key_here
NEXT_PUBLIC_CLOUT_TOKEN_ADDRESS=0x...
NEXT_PUBLIC_PROFILE_NFT_ADDRESS=0x...
NEXT_PUBLIC_MEME_NFT_ADDRESS=0x...
NEXT_PUBLIC_BATTLE_ARENA_ADDRESS=0x...
```

### 3. Deploy Smart Contracts

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed deployment instructions.

```bash
cd contracts

# Build contracts
forge build

# Deploy to Base Sepolia
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url base_sepolia \
  --broadcast
```

### 4. Run Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to see the app!

## 🎬 Demo Guide

Perfect flow for presentations and live demos:

### Setup (Before Demo)
1. ✅ Have 2 wallets ready with Base Sepolia ETH
2. ✅ Contracts deployed and verified
3. ✅ Frontend running on localhost or deployed
4. ✅ Browser windows set up side-by-side

### Live Demo Flow (5-7 minutes)

**Act 1: Profiles (1 min)**
1. Connect Wallet 1 → Create profile "Alpha"
2. Connect Wallet 2 → Create profile "Beta"
3. Both claim 1000 $CLOUT from faucet
4. Show profile NFTs on Base Explorer

**Act 2: The Battle (2-3 min)**
5. Alpha declares war on Beta
6. Both submit memes (have prepared)
7. Show live voting interface
8. Get audience to vote (or use pre-planned votes)
9. Display real-time vote counter

**Act 3: Victory (1-2 min)**
10. Battle ends → Winner announced
11. Show winning meme minted as NFT
12. Loser profile shows Cringe Cage status
13. Winner uses Based Beam → Airdrops to 10 wallets
14. Show all transactions on Base Sepolia Explorer

**Finale: The Proof (1 min)**
15. Open Base Sepolia Explorer
16. Show contract addresses
17. Show NFT metadata (on-chain SVG)
18. Display battle event logs
19. Highlight low transaction costs

### Key Talking Points
- 🔥 "Everything is on-chain and permanent"
- ⚡ "Powered by Base's speed and low costs"
- 🎨 "NFTs with dynamic, on-chain SVG metadata"
- 💰 "Fair token distribution via faucet"
- 🚀 "Viral mechanics with Based Beam airdrops"

## 🌐 Network Info

### Base Sepolia (Current Testnet)
- **RPC URL**: https://sepolia.base.org
- **Chain ID**: 84532
- **Explorer**: https://sepolia-explorer.base.org
- **Faucet**: https://portal.cdp.coinbase.com/products/faucet
- **Currency**: ETH (free testnet ETH)

### Base Mainnet (Production Ready)
- **RPC URL**: https://mainnet.base.org
- **Chain ID**: 8453
- **Explorer**: https://base.blockscout.com/
- **Currency**: ETH

## 📚 Documentation

- **[DEPLOYMENT.md](./DEPLOYMENT.md)** - Smart contract deployment guide
- **[NEXT-STEPS.md](./NEXT-STEPS.md)** - Development roadmap and tasks
- **[QUICK-REF.md](./QUICK-REF.md)** - Quick reference commands
- **[Root README](../README.md)** - Overall project documentation
- **[SETUP.md](../SETUP.md)** - Complete setup guide

## 🎓 Resources

### Base Platform
- [Base Documentation](https://docs.base.org/)
- [OnchainKit Documentation](https://docs.base.org/onchainkit)
- [Base GitHub](https://github.com/base)
- [Base Faucets](https://docs.base.org/base-chain/tools/network-faucets)

### Development Tools
- [Foundry Book](https://book.getfoundry.sh/)
- [Solidity Documentation](https://docs.soliditylang.org/)
- [Next.js Documentation](https://nextjs.org/docs)

## 🏗️ Project Status

### ✅ Completed
- Smart contract architecture and implementation
- Foundry development environment setup
- Deployment scripts for Base Sepolia
- OnchainKit frontend integration
- Documentation and guides

### 🚧 In Progress
- Frontend UI components
- Wallet connection flow
- Battle interface
- Profile management

### 📋 Planned
- Power-up UI implementation
- Cringe Cage animations
- Based Beam airdrop interface
- Production deployment to Base Mainnet

## 💡 Why Base?

Based AF leverages Base's unique advantages:

1. **⚡ Speed** - Sub-second block times enable real-time battles
2. **💰 Cost** - Sub-cent fees make voting affordable for all
3. **🔗 EVM Compatible** - Use battle-tested Solidity tools
4. **🌐 Distribution** - Coinbase ecosystem reaches millions
5. **🛡️ Security** - Built on Ethereum's proven security model
6. **👥 Community** - Vibrant builder community and support

## 🔥 Built for Base Buildathon

*"We're not building another boring app. We're creating digital culture on Base."*

Based AF showcases:
- Novel on-chain social mechanics
- Dynamic NFT metadata
- Token-based voting systems
- Viral distribution mechanisms
- Real user engagement and fun!

