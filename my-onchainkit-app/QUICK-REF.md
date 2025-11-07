# 🔥 Based AF - Quick Reference

## 🚀 Get Base Sepolia ETH (Choose One)

| Faucet | URL | Amount | Cooldown |
|--------|-----|--------|----------|
| **Coinbase CDP** | https://portal.cdp.coinbase.com/products/faucet | Varies | 24h |
| **Alchemy** | https://basefaucet.com/ | 0.1 ETH | 24h |
| **QuickNode** | https://faucet.quicknode.com/drip | 0.1 ETH | 12h |
| **Ethereum Ecosystem** | https://www.ethereum-ecosystem.com/faucets/base-sepolia | 0.5 ETH | 24h |
| **Ponzifun** | https://testnet.ponzi.fun/faucet | 1 ETH | 48h |

**All faucets**: https://docs.base.org/base-chain/tools/network-faucets

## ⚡ Quick Deploy

```bash
cd /Users/phila/Desktop/coding/hackathon/my-onchainkit-app
./setup.sh
```

## 🌐 Base Sepolia Network Info

```
Network Name: Base Sepolia
RPC URL: https://sepolia.base.org
Chain ID: 84532
Currency: ETH
Explorer: https://sepolia-explorer.base.org
```

## 📝 Environment Variables Template

Create `.env.local`:
```env
NEXT_PUBLIC_CDP_API_KEY=Ytbu5bChKmUuuiFipUEVbWghxpPKA0ugv
NEXT_PUBLIC_CLOUT_TOKEN_ADDRESS=0x...
NEXT_PUBLIC_PROFILE_NFT_ADDRESS=0x...
NEXT_PUBLIC_MEME_NFT_ADDRESS=0x...
NEXT_PUBLIC_BATTLE_ARENA_ADDRESS=0x...
```

## 🎯 Smart Contracts

1. **CloutToken** - ERC-20 voting token
2. **ProfileNFT** - User profiles with Cringe Cage
3. **MemeNFT** - Battle memes
4. **BattleArena** - Game logic

## 🔧 Useful Commands

```bash
# Compile contracts
cd contracts && forge build

# Test contracts
cd contracts && forge test

# Deploy contracts
./setup.sh

# Run frontend
npm run dev

# Check contract on explorer
open https://sepolia-explorer.base.org/address/YOUR_CONTRACT_ADDRESS
```

## 📱 Wallet Setup

**Add Base Sepolia to MetaMask:**
1. Open MetaMask
2. Networks → Add Network → Add Manually
3. Enter Base Sepolia details above
4. Save

**Coinbase Wallet:**
- Base Sepolia is built-in!
- Network dropdown → More → Testnets → Base Sepolia

## 🎮 Game Flow

1. Create Profile → Mint NFT
2. Get CLOUT → Faucet (1000 CLOUT)
3. Declare War → Challenge player
4. Submit Memes → Both create meme
5. Vote → 2 minute voting
6. Winner → Meme minted, loser caged

## 🔥 Power-Ups

- **Viral Boost**: 100 CLOUT - 2x votes
- **Ratio Shield**: 100 CLOUT - Block downvotes
- **Based Beam**: 100 CLOUT - Airdrop to 10 wallets

## 📚 Documentation Files

- `README.md` - Project overview
- `DEPLOYMENT.md` - Deploy guide
- `NEXT-STEPS.md` - What to do next
- `QUICK-REF.md` - This file

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| No testnet ETH | Use faucets above |
| Can't deploy | Check private key & ETH balance |
| Wallet won't connect | Switch to Base Sepolia network |
| Contract not found | Verify address in `.env.local` |

## ⏱️ Time Left

- ✅ Setup: DONE
- ✅ Contracts: DONE
- ⏱️ Deploy: 15 min
- ⏱️ Frontend: 2-3 hours
- ⏱️ Testing: 30 min
- ⏱️ Polish: 1 hour

**Total: ~4 hours to demo!**
