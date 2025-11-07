# Base Buildathon Setup Guide

## ✅ Prerequisites Checklist

### 1. Accounts & API Keys
- [ ] GitHub account: https://github.com/
- [ ] Vercel account: https://vercel.com/
- [ ] Coinbase Wallet (Base): https://wallet.coinbase.com/
- [ ] Coinbase Developer Platform API Key: https://portal.cdp.coinbase.com/projects/api-keys/client-key

### 2. Development Tools
- [x] Node.js 18+ (Current: v24.10.0) ✓
- [ ] VS Code: https://code.visualstudio.com/
- [ ] Build Tools (Windows only): https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022

### 3. Prototyping Tools
- [ ] Lovable account: https://lovable.dev/

## 🌐 Base Network Information

### Base Mainnet
- **Network Name**: Base Mainnet
- **RPC URL**: https://mainnet.base.org
- **Chain ID**: 8453
- **Currency**: ETH
- **Block Explorer**: https://base.blockscout.com/

### Base Sepolia Testnet (For Development)
- **Network Name**: Base Sepolia
- **RPC URL**: https://sepolia.base.org
- **Chain ID**: 84532
- **Currency**: ETH
- **Block Explorer**: https://sepolia-explorer.base.org

## 🚀 Quick Start Options

### Option 1: OnchainKit Template (Recommended)
```bash
# Create a new OnchainKit project
npm create onchain@latest

# Follow prompts:
# - Project name
# - CDP API Key (from Coinbase Developer Platform)

# Navigate to project and run
cd my-onchainkit-app
npm install
npm run dev
```

### Option 2: Manual Setup with Foundry

#### Step 1: Install Foundry
```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

#### Step 2: Create Project Structure
```bash
# Create contracts directory
mkdir contracts && cd contracts

# Initialize Foundry (without git since it's a subfolder)
forge init --no-git
```

#### Step 3: Configure Environment
Create `.env` file in contracts directory:
```env
BASE_RPC_URL="https://mainnet.base.org"
BASE_SEPOLIA_RPC_URL="https://sepolia.base.org"
```

#### Step 4: Secure Private Key
```bash
# Import private key to Foundry keystore
cast wallet import deployer --interactive

# Enter your private key and password when prompted
# Key stored in ~/.foundry/keystores (not tracked by git)
```

#### Step 5: Get Testnet ETH
Get free Base Sepolia ETH from faucets:
- https://docs.base.org/base-chain/tools/network-faucets

#### Step 6: Deploy Contract
```bash
# Load environment variables
source .env

# Compile and deploy
forge create ./src/Counter.sol:Counter \
  --rpc-url $BASE_SEPOLIA_RPC_URL \
  --account deployer

# Save contract address to .env
echo 'COUNTER_CONTRACT_ADDRESS="0x..."' >> .env
source .env
```

#### Step 7: Verify Deployment
```bash
# Check contract state
cast call $COUNTER_CONTRACT_ADDRESS \
  "number()(uint256)" \
  --rpc-url $BASE_SEPOLIA_RPC_URL
```

## 📦 Recommended Tech Stack

### Frontend
- **Framework**: Next.js 14+
- **Wallet Kit**: OnchainKit (by Coinbase)
- **Components**: Ready-to-use React components
- **Styling**: Tailwind CSS

### Smart Contracts
- **Framework**: Foundry
- **Language**: Solidity
- **Testing**: Forge

### Deployment
- **Frontend**: Vercel
- **Contracts**: Base Sepolia (testnet) → Base Mainnet (production)

## 🔧 Wallet Setup

### Coinbase Wallet (Recommended)
1. Install browser extension
2. Connect to app
3. Switch network to Base/Base Sepolia

### MetaMask
1. Open network dropdown
2. Add network manually
3. Enter Base network details (see above)

## 📚 Key Resources

- **Base Documentation**: https://docs.base.org/
- **OnchainKit Docs**: https://docs.base.org/onchainkit
- **Build App Tutorial**: https://docs.base.org/get-started/build-app
- **Network Faucets**: https://docs.base.org/base-chain/tools/network-faucets
- **Base GitHub**: https://github.com/base

## 🎯 Next Steps

1. Choose your project idea
2. Set up accounts and get API keys
3. Initialize project with OnchainKit
4. Deploy sample contract to Base Sepolia
5. Build frontend with wallet integration
6. Test thoroughly on testnet
7. Deploy to mainnet when ready
8. Submit to Base Ecosystem Page

## 💡 Pro Tips

- **Use Base Sepolia** for all development and testing
- **Paymaster Integration**: Make transactions gasless for better UX
- **OnchainKit Components**: Use pre-built components for faster development
- **Identity**: Integrate Coinbase Verified profiles
- **Mini Apps**: Consider building for Coinbase social feed integration

## 🚨 Security Reminders

- ⚠️ Never commit private keys or `.env` files
- ⚠️ Use Foundry keystore for secure key management
- ⚠️ Test thoroughly on Sepolia before mainnet deployment
- ⚠️ Get API keys from official sources only
