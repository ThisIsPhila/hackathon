# Based AF - Deployment Guide

## 🚀 Smart Contracts Compiled Successfully!

All contracts are ready to deploy to Base Sepolia testnet.

## 📋 Contract Overview

1. **CloutToken.sol** - ERC-20 token for voting
   - Faucet function (1000 CLOUT every 24 hours)
   - Airdrop functionality
   
2. **ProfileNFT.sol** - User profile NFTs
   - Dynamic SVG metadata
   - Tracks wins/losses
   - Cringe Cage status
   
3. **MemeNFT.sol** - Battle meme NFTs
   - On-chain SVG generation
   - Based Beam airdrop function
   
4. **BattleArena.sol** - Main game logic
   - War declarations
   - Voting mechanism
   - Battle resolution
   - Power-ups

## 🔧 Deployment Steps

### 1. Get Base Sepolia ETH

Visit one of these working faucets:
- **Coinbase Developer Platform**: https://portal.cdp.coinbase.com/products/faucet
- **Alchemy**: https://basefaucet.com/
- **QuickNode**: https://faucet.quicknode.com/drip
- **Ethereum Ecosystem**: https://www.ethereum-ecosystem.com/faucets/base-sepolia
- **More options**: https://docs.base.org/base-chain/tools/network-faucets

### 2. Set Up Private Key

**Option A: Environment Variable (Quick)**
```bash
cd contracts
export PRIVATE_KEY=your_private_key_here
```

**Option B: Foundry Keystore (Secure)**
```bash
cd contracts
cast wallet import deployer --interactive
# Enter your private key when prompted
```

### 3. Deploy Contracts

**Using Environment Variable:**
```bash
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url base_sepolia \
  --broadcast \
  --verify
```

**Using Keystore:**
```bash
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url base_sepolia \
  --account deployer \
  --sender YOUR_ADDRESS \
  --broadcast \
  --verify
```

### 4. Save Contract Addresses

After deployment, you'll see output like:
```
CloutToken deployed at: 0x...
ProfileNFT deployed at: 0x...
MemeNFT deployed at: 0x...
BattleArena deployed at: 0x...
```

**Save these addresses!** Create a file:

`contracts/deployed-addresses.json`
```json
{
  "network": "base-sepolia",
  "chainId": 84532,
  "contracts": {
    "CloutToken": "0x...",
    "ProfileNFT": "0x...",
    "MemeNFT": "0x...",
    "BattleArena": "0x..."
  },
  "deployedAt": "2025-11-07"
}
```

## 🎮 Quick Test

After deployment, test the contracts:

```bash
# Check CloutToken
cast call YOUR_CLOUT_TOKEN_ADDRESS \
  "name()(string)" \
  --rpc-url base_sepolia

# Get CLOUT from faucet
cast send YOUR_CLOUT_TOKEN_ADDRESS \
  "faucet()" \
  --rpc-url base_sepolia \
  --private-key YOUR_PRIVATE_KEY

# Create a profile
cast send YOUR_PROFILE_NFT_ADDRESS \
  "createProfile(string)(uint256)" \
  "YourUsername" \
  --rpc-url base_sepolia \
  --private-key YOUR_PRIVATE_KEY
```

## 🌐 View on Block Explorer

Visit https://sepolia-explorer.base.org and search for your contract addresses to verify deployment!

## ⚠️ Important Notes

- **Never commit private keys** - They're in .gitignore
- **Base Sepolia is testnet** - No real money involved
- **Save contract addresses** - You'll need them for frontend integration
- **Test thoroughly** - Use the testnet before mainnet

## 🔥 Next Steps

1. Deploy contracts to Base Sepolia
2. Test all functions with cast commands
3. Integrate contract addresses into frontend
4. Build the UI components
5. Test full battle flow
6. Practice your DEMO! 🎤
