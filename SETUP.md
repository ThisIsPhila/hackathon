# 🚀 Based AF - Setup Guide

Complete setup guide for developers and hackathon judges.

## ✅ Prerequisites Checklist

### Required Accounts & Keys
- [ ] **GitHub account**: https://github.com/
- [ ] **Coinbase Wallet** (Base): https://wallet.coinbase.com/
- [ ] **Coinbase Developer Platform API Key**: https://portal.cdp.coinbase.com/projects/api-keys/client-key

### Optional (for deployment)
- [ ] **Vercel account**: https://vercel.com/

### Development Tools
- [x] **Node.js 18+** (Current: v24.10.0) ✓
- [ ] **VS Code** (Recommended): https://code.visualstudio.com/
- [ ] **Git**: Installed and configured
- [ ] **Build Tools** (Windows only): https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022

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

## 🚀 Quick Start (Recommended Path)

### Step 1: Clone the Repository
```bash
git clone https://github.com/ThisIsPhila/hackathon.git
cd hackathon/my-onchainkit-app
```

### Step 2: Install Dependencies
```bash
npm install
```

### Step 3: Get Base Sepolia ETH
Visit the **Coinbase Developer Platform Faucet**: https://portal.cdp.coinbase.com/products/faucet
- Connect your wallet
- Request Base Sepolia ETH
- Wait for confirmation (~30 seconds)

### Step 4: Configure Environment
Create `.env.local` file in `my-onchainkit-app/`:
```env
NEXT_PUBLIC_CDP_API_KEY=your_api_key_here
NEXT_PUBLIC_CLOUT_TOKEN_ADDRESS=0x...
NEXT_PUBLIC_PROFILE_NFT_ADDRESS=0x...
NEXT_PUBLIC_MEME_NFT_ADDRESS=0x...
NEXT_PUBLIC_BATTLE_ARENA_ADDRESS=0x...
```

### Step 5: Run Development Server
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser!

## 🔧 Smart Contract Deployment

### Step 1: Install Foundry
```bash
# Install Foundry (if not already installed)
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Step 2: Navigate to Contracts
```bash
cd contracts
```

### Step 3: Build Contracts
```bash
forge build
```

### Step 4: Secure Your Private Key
```bash
# Import private key to Foundry keystore (SECURE METHOD)
cast wallet import deployer --interactive

# Enter your private key and password when prompted
# Key stored in ~/.foundry/keystores (not tracked by git)
```

### Step 5: Deploy to Base Sepolia
```bash
# Using the secure keystore method
forge script script/Deploy.s.sol:DeployBasedAF \
  --rpc-url https://sepolia.base.org \
  --account deployer \
  --sender YOUR_ADDRESS \
  --broadcast
```

### Step 6: Save Contract Addresses
After deployment, save the contract addresses to your `.env.local` file:
```env
NEXT_PUBLIC_CLOUT_TOKEN_ADDRESS=0x...
NEXT_PUBLIC_PROFILE_NFT_ADDRESS=0x...
NEXT_PUBLIC_MEME_NFT_ADDRESS=0x...
NEXT_PUBLIC_BATTLE_ARENA_ADDRESS=0x...
```

### Step 7: Verify Deployment
Visit the [Base Sepolia Explorer](https://sepolia-explorer.base.org) and search for your contract addresses!

## 🔧 Wallet Setup

### Coinbase Wallet (Recommended for Base)
1. **Install** the browser extension from https://wallet.coinbase.com/
2. **Create or import** your wallet
3. **Switch network** to Base Sepolia:
   - Click network dropdown
   - Select "Testnets"
   - Choose "Base Sepolia"

### MetaMask
1. **Open** MetaMask extension
2. **Click** network dropdown at the top
3. **Select** "Add network" → "Add network manually"
4. **Enter Base Sepolia details**:
   - Network Name: `Base Sepolia`
   - RPC URL: `https://sepolia.base.org`
   - Chain ID: `84532`
   - Currency Symbol: `ETH`
   - Block Explorer: `https://sepolia-explorer.base.org`
5. **Save** and switch to Base Sepolia

## 📚 Key Resources

### Base Platform
- **Base Documentation**: https://docs.base.org/
- **OnchainKit Docs**: https://docs.base.org/onchainkit
- **Build App Tutorial**: https://docs.base.org/get-started/build-app
- **Network Faucets**: https://docs.base.org/base-chain/tools/network-faucets
- **Base GitHub**: https://github.com/base

### Development Tools
- **Foundry Book**: https://book.getfoundry.sh/
- **Solidity Docs**: https://docs.soliditylang.org/
- **Next.js Docs**: https://nextjs.org/docs

### Base Sepolia Testnet
- **Faucet**: https://portal.cdp.coinbase.com/products/faucet
- **Explorer**: https://sepolia-explorer.base.org
- **RPC URL**: https://sepolia.base.org
- **Chain ID**: 84532

## 🎯 Next Steps After Setup

1. ✅ **Verify your environment** - Run `npm run dev` and check localhost:3000
2. 🔑 **Get your API keys** - Coinbase Developer Platform
3. 💰 **Get testnet ETH** - Use Base Sepolia faucet
4. 🚀 **Deploy contracts** - Follow the deployment guide
5. 🎨 **Build the UI** - See [NEXT-STEPS.md](./my-onchainkit-app/NEXT-STEPS.md)
6. 🧪 **Test thoroughly** - Create profiles, battle, vote
7. 🎬 **Practice demo** - Perfect your presentation!

## 💡 Pro Tips for Hackathon Success

- ⚡ **Deploy early** - Test contracts on Base Sepolia ASAP
- 🎨 **Use OnchainKit components** - Pre-built, tested, and optimized
- 🎯 **Keep it simple** - Focus on core battle flow first, add features later
- 🧪 **Test with 2 wallets** - Use different browsers or incognito mode
- 📹 **Record your demo** - Have a backup video in case of technical issues
- 🎤 **Practice presenting** - Know your talking points and flow
- 📊 **Show on-chain proof** - Always verify on Base Explorer during demo

## 🚨 Security & Best Practices

- ⚠️ **Never commit private keys** - They're already in `.gitignore`
- 🔒 **Use Foundry keystore** - Secure key management for deployment
- 🧪 **Test on Sepolia first** - Never deploy untested code to mainnet
- 🔑 **Protect your API keys** - Keep `.env` files local only
- ✅ **Verify contracts** - Always check on Base Explorer after deployment
- 💰 **Start with testnet** - Use Base Sepolia ETH (it's free!)

## 🆘 Troubleshooting

### Common Issues

| Problem | Solution |
|---------|----------|
| **No testnet ETH** | Use the [Coinbase CDP Faucet](https://portal.cdp.coinbase.com/products/faucet) |
| **Deployment fails** | Check your private key and ETH balance on Base Sepolia |
| **Contracts not found** | Verify addresses are correct in `.env.local` |
| **Wallet won't connect** | Make sure you're on Base Sepolia network |
| **Build errors** | Run `npm install` and check Node.js version (18+) |
| **Foundry not found** | Re-run `foundryup` to update Foundry |

### Getting Help

- 📖 Check the [Base Documentation](https://docs.base.org/)
- 💬 Join the [Base Discord](https://discord.gg/buildonbase)
- 🐛 Review [GitHub Issues](https://github.com/ThisIsPhila/hackathon/issues)
- 📚 Read [OnchainKit Docs](https://docs.base.org/onchainkit)

---

**Ready to build? Let's go! 🚀**
