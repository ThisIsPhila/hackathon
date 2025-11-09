# 🔥 Based AF - Quick Reference

Your go-to guide for common commands and presentation tips.

## 🚀 Essential Faucets

Get free Base Sepolia ETH for testing:

| Faucet | URL | Amount | Cooldown |
|--------|-----|--------|----------|
| **Coinbase CDP** ⭐ | https://portal.cdp.coinbase.com/products/faucet | Varies | 24h |
| **Alchemy** | https://basefaucet.com/ | 0.1 ETH | 24h |
| **QuickNode** | https://faucet.quicknode.com/drip | 0.1 ETH | 12h |
| **Ethereum Ecosystem** | https://www.ethereum-ecosystem.com/faucets/base-sepolia | 0.5 ETH | 24h |

**All faucets**: https://docs.base.org/base-chain/tools/network-faucets

---

## 🌐 Base Sepolia Network

Add to your wallet (MetaMask/Coinbase):

```
Network Name: Base Sepolia
RPC URL: https://sepolia.base.org
Chain ID: 84532
Currency Symbol: ETH
Block Explorer: https://sepolia-explorer.base.org
```

**Quick add**: Visit https://sepolia-explorer.base.org and click "Add Network"

---

## ⚡ Quick Commands

### Project Setup
```bash
# Install dependencies
npm install

# Start dev server
npm run dev

# Build for production
npm run build
```

### Contract Development
```bash
# Navigate to contracts
cd contracts

# Compile contracts
forge build

# Run tests
forge test

# Run tests with gas report
forge test --gas-report

# Deploy to Base Sepolia
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url https://sepolia.base.org \
  --account deployer \
  --broadcast
```

### Contract Interaction
```bash
# Check CloutToken name
cast call CLOUT_TOKEN_ADDRESS \
  "name()(string)" \
  --rpc-url https://sepolia.base.org

# Claim from faucet
cast send CLOUT_TOKEN_ADDRESS \
  "faucet()" \
  --rpc-url https://sepolia.base.org \
  --private-key $PRIVATE_KEY

# Check balance
cast call CLOUT_TOKEN_ADDRESS \
  "balanceOf(address)(uint256)" \
  YOUR_ADDRESS \
  --rpc-url https://sepolia.base.org

# Create profile
cast send PROFILE_NFT_ADDRESS \
  "createProfile(string)" \
  "YourUsername" \
  --rpc-url https://sepolia.base.org \
  --private-key $PRIVATE_KEY
```

---

## 📝 Environment Variables

Template for `.env.local`:

```env
# Coinbase Developer Platform API Key
NEXT_PUBLIC_CDP_API_KEY=your_api_key_here

# Deployed Contract Addresses
NEXT_PUBLIC_CLOUT_TOKEN_ADDRESS=0x...
NEXT_PUBLIC_PROFILE_NFT_ADDRESS=0x...
NEXT_PUBLIC_MEME_NFT_ADDRESS=0x...
NEXT_PUBLIC_BATTLE_ARENA_ADDRESS=0x...
```

---

## 🎯 Smart Contracts Overview

| Contract | Purpose | Key Functions |
|----------|---------|---------------|
| **CloutToken** | ERC-20 voting token | `faucet()`, `transfer()`, `approve()` |
| **ProfileNFT** | User profiles | `createProfile()`, `getProfile()`, `tokenURI()` |
| **MemeNFT** | Battle memes | `mint()`, `basedBeam()`, `tokenURI()` |
| **BattleArena** | Game logic | `declareWar()`, `vote()`, `resolveBattle()` |

---

## 🎮 Game Flow

Perfect sequence for testing and demos:

```
1. Create Profile    → Mint NFT with username
2. Get CLOUT         → Faucet gives 1000 $CLOUT (24hr cooldown)
3. Declare War       → Challenge another player
4. Submit Memes      → Both players create memes
5. Vote             → 2-minute voting period
6. Battle Resolves   → Winner minted, loser caged
7. Based Beam       → Optional: Airdrop to 10 wallets
```

---

## 🔥 Power-Ups

| Power-Up | Cost | Effect | Duration |
|----------|------|--------|----------|
| **Viral Boost** | 100 $CLOUT | 2x vote weight | 30 seconds |
| **Ratio Shield** | 100 $CLOUT | Block opponent votes | 30 seconds |
| **Based Beam** | 100 $CLOUT | Airdrop to 10 wallets | Instant |

---

## 🎬 Demo Script (5-7 minutes)

### Setup (Before Demo)
- [ ] 2 wallets with Base Sepolia ETH
- [ ] Both have profiles created
- [ ] Both have $CLOUT tokens
- [ ] Browser windows ready
- [ ] Base Explorer tab open

### Act 1: Introduction (1 min)
**Show:** Homepage/Landing
**Say:** "Based AF is an on-chain meme war platform built on Base. Everything is permanent, verifiable, and governed by the community."

### Act 2: Profiles (1 min)
**Show:** Profile creation
**Do:**
- Connect wallet
- Create profile → Mint NFT
- Claim $CLOUT from faucet
**Say:** "Profiles are dynamic SVG NFTs that track your wins and losses on-chain."

### Act 3: The Battle (2-3 min)
**Show:** Battle arena
**Do:**
- Player 1 declares war on Player 2
- Both submit memes
- Show live voting interface
- Cast votes with $CLOUT
**Say:** "Community votes with $CLOUT tokens. It's transparent and fair—no algorithm manipulation."

### Act 4: Victory (1 min)
**Show:** Battle results
**Do:**
- Battle resolves automatically
- Winner's meme minted as NFT
- Loser sent to Cringe Cage
- Use Based Beam → Airdrop to 10 wallets
**Say:** "Winner immortalized on-chain. Loser faces the consequences. That's the game!"

### Act 5: Proof (1 min)
**Show:** Base Sepolia Explorer
**Do:**
- Show contract addresses
- View NFT metadata (SVG on-chain)
- Display transaction history
- Highlight transaction costs
**Say:** "Everything we just did is permanently on Base. Sub-cent fees make this affordable for everyone."

---

## 🎤 Key Talking Points

### Why Based AF?
- 🔥 **Permanent Culture** - Meme battles immortalized on-chain
- 💰 **Economic Stakes** - $CLOUT creates real consequences
- 🗳️ **Transparent Voting** - No algorithm, just community consensus
- 🎨 **True Ownership** - Profiles and memes as NFTs you actually own
- 🚀 **Viral Mechanics** - Based Beam spreads winning content

### Why Base?
- ⚡ **Fast** - Sub-second blocks for real-time battles
- 💵 **Cheap** - Sub-cent fees make voting affordable
- 🔗 **Compatible** - Full EVM, use Solidity/Foundry
- 🌐 **Distribution** - Coinbase ecosystem reach
- 🛡️ **Secure** - Built on Ethereum's security

### Technical Highlights
- 📝 **On-chain SVG** - No IPFS, fully decentralized
- 🔄 **Dynamic NFTs** - Metadata updates with stats
- 🎯 **Fair Distribution** - Faucet for equal access
- 🏗️ **Modular Design** - Clean contract separation
- ✅ **Verified Contracts** - All code on Base Explorer

---

## 📚 Documentation Quick Links

- **Main README**: [../README.md](../README.md)
- **Setup Guide**: [../SETUP.md](../SETUP.md)
- **App README**: [README.md](./README.md)
- **Deployment Guide**: [DEPLOYMENT.md](./DEPLOYMENT.md)
- **Next Steps**: [NEXT-STEPS.md](./NEXT-STEPS.md)

---

## 🔧 Troubleshooting

### Common Issues

| Problem | Solution |
|---------|----------|
| No testnet ETH | Use [Coinbase CDP Faucet](https://portal.cdp.coinbase.com/products/faucet) |
| Can't deploy | Check private key and ETH balance |
| Wallet won't connect | Switch to Base Sepolia network |
| Contract not found | Verify `.env.local` addresses |
| Build errors | Run `npm install`, check Node 18+ |
| Foundry issues | Run `foundryup` to update |

### Debug Commands
```bash
# Check wallet balance
cast balance YOUR_ADDRESS --rpc-url https://sepolia.base.org

# Check transaction status
cast tx TRANSACTION_HASH --rpc-url https://sepolia.base.org

# Check contract code
cast code CONTRACT_ADDRESS --rpc-url https://sepolia.base.org

# Get latest block
cast block latest --rpc-url https://sepolia.base.org
```

---

## ⏱️ Time Estimates

Quick reference for planning:

| Task | Time |
|------|------|
| ✅ Setup & Install | Done |
| ✅ Contract Development | Done |
| Deploy Contracts | 15-20 min |
| Build Profile UI | 30-45 min |
| Build Battle Arena | 45-60 min |
| Build Meme Creator | 30 min |
| Add Power-Ups | 1-2 hours |
| Testing | 30 min |
| Polish & Animations | 1 hour |
| **Demo Practice** | **1 hour** ⚠️ |

**Minimum Viable Demo**: 2-3 hours (Deploy + Basic UI + Practice)
**Full Implementation**: 4-6 hours

---

## 🎯 Pre-Demo Checklist

### Technical Setup
- [ ] All contracts deployed to Base Sepolia
- [ ] Contract addresses in `.env.local`
- [ ] Contracts verified on Base Explorer
- [ ] Frontend running (`npm run dev`)
- [ ] 2 wallets with ETH and profiles ready
- [ ] Base Explorer tabs open

### Presentation
- [ ] Demo script memorized (5-7 min)
- [ ] Talking points ready
- [ ] Backup video recorded
- [ ] Screenshots taken
- [ ] Questions anticipated
- [ ] Laptop/screen tested

### Confidence Builders
- [ ] Ran full demo 3+ times
- [ ] Tested with live audience
- [ ] Timed presentation
- [ ] Prepared for tech failures
- [ ] Know contract addresses
- [ ] Comfortable with Base Explorer

---

## 💡 Pro Tips for Hackathons

### Before Presenting
1. **Deploy Early** - Test everything on Base Sepolia
2. **Record Backup** - Have a video ready
3. **Know Your Data** - Memorize contract addresses
4. **Practice Timing** - Aim for 5-7 minutes
5. **Test Equipment** - Check screen/audio before

### During Demo
1. **Start Strong** - Hook them in 30 seconds
2. **Show Don't Tell** - Live interactions beat slides
3. **Prove It's Real** - Always show Base Explorer
4. **Handle Failures** - Have backup content ready
5. **End with Impact** - Summarize why it matters

### Common Pitfalls to Avoid
- ❌ Don't rush through the demo
- ❌ Don't skip Base Explorer proof
- ❌ Don't assume wallet will connect
- ❌ Don't forget to explain Base benefits
- ❌ Don't run out of testnet ETH mid-demo

---

## 🚀 Final Checklist

Right before you present:

- [ ] Contracts deployed ✓
- [ ] Frontend working ✓
- [ ] 2 wallets ready ✓
- [ ] Demo practiced ✓
- [ ] Backup plan ready ✓
- [ ] Base Explorer open ✓
- [ ] Talking points memorized ✓
- [ ] Deep breath taken ✓

---

**You've got this! Go show them what Based AF can do! 🔥**

---

## 📞 Getting Help

- 📖 [Base Docs](https://docs.base.org/)
- 🛠️ [Foundry Book](https://book.getfoundry.sh/)
- 💬 [Base Discord](https://discord.gg/buildonbase)
- 🔍 [Stack Overflow](https://stackoverflow.com/questions/tagged/base)
