# 🎯 BASED AF - NEXT STEPS

## ✅ What's Done

1. ✅ **OnchainKit Project** - Initialized with Coinbase API key
2. ✅ **Foundry Setup** - Installed and configured
3. ✅ **Smart Contracts** - All 4 contracts written and compiled:
   - `CloutToken.sol` - ERC-20 voting token with faucet
   - `ProfileNFT.sol` - Dynamic SVG profile NFTs
   - `MemeNFT.sol` - Battle meme NFTs with airdrop
   - `BattleArena.sol` - Complete battle system
4. ✅ **Deployment Script** - Ready to deploy to Base Sepolia
5. ✅ **Documentation** - README, DEPLOYMENT guide, setup script

## 🚀 What You Need to Do Next

### Step 1: Get Base Sepolia ETH (5 minutes)

**You need testnet ETH to deploy contracts!**

Choose any of these faucets:
1. **Coinbase Developer Platform**: https://portal.cdp.coinbase.com/products/faucet (recommended)
2. **Alchemy Faucet**: https://basefaucet.com/
3. **QuickNode**: https://faucet.quicknode.com/drip
4. **Ethereum Ecosystem**: https://www.ethereum-ecosystem.com/faucets/base-sepolia

Connect your wallet and request Base Sepolia ETH (wait for confirmation)

### Step 2: Deploy Smart Contracts (10 minutes)

**Option A: Quick Deploy (Recommended)**
```bash
cd /Users/phila/Desktop/coding/hackathon/my-onchainkit-app
./setup.sh
```

**Option B: Manual Deploy**
```bash
cd contracts

# Set your private key
export PRIVATE_KEY=your_private_key_here

# Deploy
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url base_sepolia \
  --broadcast
```

**Save the contract addresses** that are printed!

### Step 3: Configure Frontend (5 minutes)

Create `.env.local` in the project root:

```env
NEXT_PUBLIC_CDP_API_KEY=Ytbu5bChKmUuuiFipUEVbWghxpPKA0ugv
NEXT_PUBLIC_CLOUT_TOKEN_ADDRESS=0x... # From deployment
NEXT_PUBLIC_PROFILE_NFT_ADDRESS=0x... # From deployment
NEXT_PUBLIC_MEME_NFT_ADDRESS=0x... # From deployment
NEXT_PUBLIC_BATTLE_ARENA_ADDRESS=0x... # From deployment
```

### Step 4: Build Frontend Components (2-3 hours)

The contracts are ready! Now you need to build the UI:

**Priority Components:**
1. **Profile Creation Page** (`app/profile/page.tsx`)
   - Connect wallet
   - Create profile NFT
   - Get CLOUT from faucet

2. **Meme Creator** (`app/components/MemeCreator.tsx`)
   - Text input for meme
   - Simple templates
   - Preview

3. **Battle Arena** (`app/battle/page.tsx`)
   - Declare war button
   - Live voting interface
   - Timer (2 minutes)
   - Vote counter

4. **Cringe Cage Overlay** (`app/components/CringeCage.tsx`)
   - Red overlay with giant L
   - Shows when profile is in cage

**I can help you build these components! Just ask:**
- "Build the profile creation page"
- "Create the meme editor component"
- "Build the battle arena interface"

### Step 5: Test Full Flow (30 minutes)

1. Create 2 profiles
2. Get CLOUT from faucet
3. Declare war
4. Submit memes
5. Vote
6. Finish battle
7. Check winner/loser status

### Step 6: Add Power-Ups (1 hour)

Implement:
- Viral Boost UI
- Ratio Shield
- Based Beam modal

### Step 7: Polish & Practice Demo (1 hour)

- Add animations
- Improve styling
- **Practice your demo presentation!**

## 📋 Quick Commands Reference

```bash
# Start dev server (frontend)
npm run dev

# Build contracts
cd contracts && forge build

# Test contracts
cd contracts && forge test

# Deploy contracts
./setup.sh

# Check contract on explorer
# Visit: https://sepolia-explorer.base.org
```

## 🔥 Time Estimate

- ✅ **Setup & Contracts**: DONE!
- ⏱️ **Deploy**: 15 minutes
- ⏱️ **Frontend**: 2-3 hours
- ⏱️ **Testing**: 30 minutes  
- ⏱️ **Polish**: 1 hour

**Total remaining: ~4 hours** - Perfect for a hackathon sprint!

## 💡 Pro Tips

1. **Deploy early** - Test contracts on Base Sepolia ASAP
2. **Use OnchainKit components** - Already set up in the template
3. **Keep it simple** - Focus on core battle flow first
4. **Test with 2 wallets** - Use different browsers/incognito
5. **Record your demo** - Have a backup video

## 🆘 Need Help?

**Common Issues:**
- No testnet ETH? → Use the faucet
- Deployment fails? → Check private key and ETH balance
- Contracts not found? → Verify addresses in .env.local
- Wallet not connecting? → Make sure you're on Base Sepolia network

**Just ask me:**
- "Deploy the contracts for me"
- "Build the profile creation page"
- "Help me test the battle flow"
- "Create the meme editor component"

## 🎤 Your Winning Demo

1. Show profiles as NFTs
2. Declare war live
3. Create memes
4. Let audience vote
5. **BOOM** - Winner minted, loser caged
6. Use Based Beam to airdrop
7. Show on Base Explorer

**You've got this! Let's make it Based AF! 🔥**
