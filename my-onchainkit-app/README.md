# 🔥 Based AF - The On-Chain Clout Battleground

> **Where memes become immortal and losers get caged**

Based AF is a live, on-chain meme war platform built on Base where users battle for social dominance. It's Twitter meets Twitch meets crypto - pure digital chaos on the blockchain.

## 🎯 The Concept

- **Create Your "Base"** - Each player gets a profile as an NFT on Base
- **Mint Absolute Fire** - Create spicy memes as on-chain NFTs
- **Declare War** - Challenge someone to a "clout battle"
- **The Arena** - Live feed where people vote with $CLOUT tokens
- **Winner Takes All** - Winning meme gets immortalized on-chain, loser's profile gets temporarily tarnished

## 🔥 Features

### The Stunt Button
- One-click mint your meme directly to Base
- Gasless transactions via Base Paymaster
- Every battle permanently recorded on-chain

### Clout Cannons (Power-Ups)
- **Viral Boost** - 2x votes for 30 seconds
- **Ratio Shield** - Immune to downvotes  
- **Based Beam** - Auto-mint to 10 random wallets

### The Cringe Cage
- Losers trapped for 1 hour with giant L
- Profile displays cringe status
- Escape by paying $CLOUT bail

## 🛠 Tech Stack

- **Smart Contracts**: Solidity (CloutToken, ProfileNFT, MemeNFT, BattleArena)
- **Frontend**: Next.js 15 + OnchainKit + Tailwind
- **Network**: Base Sepolia (testnet) / Base Mainnet
- **Tools**: Foundry, Wagmi, Vercel

## 🚀 Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Deploy Contracts

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed instructions.

```bash
cd contracts
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url base_sepolia \
  --broadcast
```

### 3. Configure Environment

Create `.env.local`:
```env
NEXT_PUBLIC_CDP_API_KEY=your_api_key_here
NEXT_PUBLIC_CLOUT_TOKEN_ADDRESS=0x...
NEXT_PUBLIC_PROFILE_NFT_ADDRESS=0x...
NEXT_PUBLIC_MEME_NFT_ADDRESS=0x...
NEXT_PUBLIC_BATTLE_ARENA_ADDRESS=0x...
```

### 4. Run Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

## 🎮 How to Play

1. **Create Profile** - Mint your profile NFT
2. **Get CLOUT** - Use faucet for 1000 $CLOUT
3. **Declare War** - Challenge a player
4. **Submit Memes** - Both create best meme
5. **Vote** - Community votes (2 min)
6. **Winner** - Meme minted, loser to Cringe Cage

## 🌐 Network Info

### Base Sepolia (Testnet)
- RPC: https://sepolia.base.org
- Chain ID: 84532
- Faucet: https://portal.cdp.coinbase.com/products/faucet

## 📚 Resources

- [Deployment Guide](./DEPLOYMENT.md)
- [Base Docs](https://docs.base.org/)
- [OnchainKit](https://docs.base.org/onchainkit)

## 🔥 Built for Base Buildathon

*"We're not building another boring app. We're creating digital chaos on Base."*
