# 🚀 Based AF - Smart Contract Deployment Guide

Complete guide for deploying Based AF smart contracts to Base Sepolia testnet.

## 📋 Contract Overview

All four smart contracts are production-ready and tested:

### 1. CloutToken.sol
**ERC-20 voting token with built-in faucet**
- Standard ERC-20 implementation
- Faucet: 1000 $CLOUT per claim (24hr cooldown)
- Airdrop functionality for viral distribution
- Used for voting and purchasing power-ups

### 2. ProfileNFT.sol
**Dynamic user profile NFTs**
- On-chain SVG metadata generation
- Tracks wins, losses, and battle history
- Cringe Cage status management
- Fully on-chain, no IPFS dependency

### 3. MemeNFT.sol
**Battle meme NFTs with viral mechanics**
- On-chain SVG storage for memes
- Battle reference linking
- Based Beam airdrop to 10 wallets
- Permanent on-chain records

### 4. BattleArena.sol
**Core game logic and state management**
- War declaration system
- $CLOUT-based voting mechanism
- Automatic battle resolution
- Power-up system (Viral Boost, Ratio Shield, Based Beam)
- Event emission for frontend tracking

## 🔧 Pre-Deployment Setup

### Step 1: Get Base Sepolia ETH

You need testnet ETH to pay for deployment gas fees. Choose any faucet:

**Recommended Faucets:**
- **Coinbase Developer Platform** (Primary): https://portal.cdp.coinbase.com/products/faucet
- **Alchemy**: https://basefaucet.com/
- **QuickNode**: https://faucet.quicknode.com/drip
- **Ethereum Ecosystem**: https://www.ethereum-ecosystem.com/faucets/base-sepolia

**How to use:**
1. Visit the faucet URL
2. Connect your wallet
3. Request Base Sepolia ETH
4. Wait ~30 seconds for confirmation
5. Verify in your wallet

**Amount needed:** 0.01 ETH is plenty for deployment

### Step 2: Install Foundry

```bash
# Install Foundry (if not already installed)
curl -L https://foundry.paradigm.xyz | bash

# Run foundryup to install latest version
foundryup
```

Verify installation:
```bash
forge --version
cast --version
```

### Step 3: Build Contracts

```bash
cd contracts

# Compile all contracts
forge build

# Run tests (optional but recommended)
forge test

# Check gas estimates
forge test --gas-report
```

## 🔐 Secure Key Management

### Option A: Foundry Keystore (RECOMMENDED - Most Secure)

This is the safest method - your key is encrypted and never exposed.

```bash
cd contracts

# Import your private key into encrypted keystore
cast wallet import deployer --interactive

# You'll be prompted to:
# 1. Enter your private key
# 2. Create a password to encrypt it

# Your key is now stored in ~/.foundry/keystores/deployer
```

### Option B: Environment Variable (Quick Setup)

Less secure but faster for testing:

```bash
cd contracts

# Set private key for current session only
export PRIVATE_KEY=your_private_key_here

# Verify it's set
echo $PRIVATE_KEY
```

⚠️ **Never commit private keys to git!** They're already in `.gitignore`.

## 🚀 Deploy to Base Sepolia

### Using Keystore (Recommended)

```bash
# Make sure you're in the contracts directory
cd contracts

# Deploy all contracts in one transaction
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url https://sepolia.base.org \
  --account deployer \
  --sender YOUR_WALLET_ADDRESS \
  --broadcast \
  --verify

# You'll be prompted for your keystore password
```

### Using Environment Variable

```bash
cd contracts

# Deploy with private key
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url https://sepolia.base.org \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verify
```

### What Happens During Deployment

The deployment script will:
1. ✅ Deploy CloutToken contract
2. ✅ Deploy ProfileNFT contract (linked to CloutToken)
3. ✅ Deploy MemeNFT contract
4. ✅ Deploy BattleArena contract (linked to all others)
5. ✅ Verify contracts on Base Sepolia Explorer
6. ✅ Output all contract addresses

**Expected Gas Cost:** ~0.005-0.01 ETH total

## 📝 Post-Deployment Steps

### Step 1: Save Contract Addresses

After deployment, you'll see output like:

```
== Logs ==
Deploying Based AF contracts...
CloutToken deployed at: 0x1234...
ProfileNFT deployed at: 0x5678...
MemeNFT deployed at: 0x9abc...
BattleArena deployed at: 0xdef0...
Deployment complete!
```

**IMPORTANT:** Save these addresses immediately!

### Step 2: Create Contract Address File

Create `contracts/deployed-addresses.json`:

```json
{
  "network": "base-sepolia",
  "chainId": 84532,
  "deployedAt": "2025-11-07",
  "contracts": {
    "CloutToken": "0x...",
    "ProfileNFT": "0x...",
    "MemeNFT": "0x...",
    "BattleArena": "0x..."
  }
}
```

### Step 3: Configure Frontend

Update `.env.local` in the root directory:

```env
# Coinbase Developer Platform API Key
NEXT_PUBLIC_CDP_API_KEY=your_api_key_here

# Deployed Contract Addresses
NEXT_PUBLIC_CLOUT_TOKEN_ADDRESS=0x...
NEXT_PUBLIC_PROFILE_NFT_ADDRESS=0x...
NEXT_PUBLIC_MEME_NFT_ADDRESS=0x...
NEXT_PUBLIC_BATTLE_ARENA_ADDRESS=0x...
```

## ✅ Verify Deployment

### Step 1: Check on Base Sepolia Explorer

Visit https://sepolia-explorer.base.org and search for each contract address.

You should see:
- ✅ Contract creation transaction
- ✅ Contract verified (green checkmark)
- ✅ Contract source code visible
- ✅ Read/Write functions available

### Step 2: Test Contract Functions

```bash
# Test CloutToken - Get token name
cast call YOUR_CLOUT_TOKEN_ADDRESS \
  "name()(string)" \
  --rpc-url https://sepolia.base.org

# Should return: "Clout Token"

# Test faucet - Claim 1000 CLOUT
cast send YOUR_CLOUT_TOKEN_ADDRESS \
  "faucet()" \
  --rpc-url https://sepolia.base.org \
  --private-key $PRIVATE_KEY

# Check your balance
cast call YOUR_CLOUT_TOKEN_ADDRESS \
  "balanceOf(address)(uint256)" \
  YOUR_WALLET_ADDRESS \
  --rpc-url https://sepolia.base.org

# Test ProfileNFT - Create a profile
cast send YOUR_PROFILE_NFT_ADDRESS \
  "createProfile(string)(uint256)" \
  "TestUser" \
  --rpc-url https://sepolia.base.org \
  --private-key $PRIVATE_KEY
```

### Step 3: Verify Contract Interactions

All contracts should be linked correctly:
- BattleArena should reference all other contracts
- ProfileNFT should know about CloutToken
- All contracts should be on Base Sepolia (chain ID 84532)

## 🎯 Next Steps

### 1. Start Frontend Development
```bash
cd ..  # Back to project root
npm run dev
```

### 2. Connect to Deployed Contracts
- Frontend will automatically use addresses from `.env.local`
- OnchainKit handles wallet connection
- Contracts are ready for interaction

### 3. Test Full User Flow
- Create profiles
- Claim $CLOUT tokens
- Declare wars
- Submit memes
- Vote on battles
- Verify on Base Explorer

### 4. Prepare for Demo
See [README.md](./README.md) for complete demo guide and presentation tips.

## 📊 Deployment Checklist

Before presenting:

- [ ] All 4 contracts deployed successfully
- [ ] Contract addresses saved in `.env.local`
- [ ] Contracts verified on Base Sepolia Explorer
- [ ] Test faucet claim works
- [ ] Test profile creation works
- [ ] Frontend connected to contracts
- [ ] Have 2 test wallets with Base Sepolia ETH
- [ ] Browser and demo environment ready


## 🚨 Troubleshooting

### Common Deployment Issues

**Problem: Insufficient funds for gas**
```
Solution: Get more Base Sepolia ETH from faucet
Visit: https://portal.cdp.coinbase.com/products/faucet
```

**Problem: RPC connection timeout**
```
Solution: Try alternative RPC or wait and retry
Alternative: https://base-sepolia.blockpi.network/v1/rpc/public
```

**Problem: Contract verification failed**
```
Solution: Manually verify on Base Explorer
1. Go to contract on sepolia-explorer.base.org
2. Click "Verify & Publish"
3. Upload source code from contracts/src/
```

**Problem: Nonce too low error**
```bash
Solution: Reset transaction nonce
cast nonce YOUR_WALLET_ADDRESS --rpc-url https://sepolia.base.org
```

**Problem: Private key not found (keystore)**
```bash
Solution: List imported keys
cast wallet list

# Re-import if needed
cast wallet import deployer --interactive
```

### Getting Help

- 📖 [Base Documentation](https://docs.base.org/)
- 🛠️ [Foundry Troubleshooting](https://book.getfoundry.sh/reference/forge/forge-script#troubleshooting)
- 💬 [Base Discord](https://discord.gg/buildonbase)
- 🔍 [Base Sepolia Explorer](https://sepolia-explorer.base.org)

## ⚠️ Security Best Practices

- ✅ **Use Foundry keystore** - Most secure method
- ✅ **Never commit private keys** - Already in `.gitignore`
- ✅ **Test on Sepolia first** - Always test before mainnet
- ✅ **Verify all contracts** - Use Block Explorer verification
- ✅ **Keep backups** - Save deployment addresses safely
- ✅ **Audit before mainnet** - Get contracts reviewed

---

**Ready to deploy? Let's build on Base! 🔥**
