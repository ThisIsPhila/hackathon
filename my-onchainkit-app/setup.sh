#!/bin/bash

# Based AF - Quick Setup Script
# This script helps you deploy contracts and set up the frontend

echo "🔥 Based AF - Setup Script"
echo "=========================="
echo ""

# Check if in correct directory
if [ ! -d "contracts" ]; then
    echo "❌ Error: contracts directory not found"
    echo "Please run this script from my-onchainkit-app directory"
    exit 1
fi

# Check for Foundry
if ! command -v forge &> /dev/null; then
    echo "❌ Error: Foundry not installed"
    echo "Run: curl -L https://foundry.paradigm.xyz | bash && foundryup"
    exit 1
fi

echo "✅ Foundry found"
echo ""

# Ask for private key or use keystore
echo "How do you want to deploy?"
echo "1) Use private key from environment"
echo "2) Use Foundry keystore"
read -p "Choose (1 or 2): " choice

if [ "$choice" == "1" ]; then
    read -p "Enter your private key: " private_key
    export PRIVATE_KEY=$private_key
    DEPLOY_CMD="forge script script/Deploy.s.sol:DeployBasedAF --rpc-url base_sepolia --broadcast"
elif [ "$choice" == "2" ]; then
    read -p "Enter your keystore account name (e.g., deployer): " account_name
    read -p "Enter your wallet address: " wallet_address
    DEPLOY_CMD="forge script script/Deploy.s.sol:DeployBasedAF --rpc-url base_sepolia --account $account_name --sender $wallet_address --broadcast"
else
    echo "❌ Invalid choice"
    exit 1
fi

echo ""
echo "🚀 Deploying contracts to Base Sepolia..."
echo ""

cd contracts

# Deploy
eval $DEPLOY_CMD

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Deployment successful!"
    echo ""
    echo "📝 Next steps:"
    echo "1. Copy the contract addresses from above"
    echo "2. Create .env.local in the root directory"
    echo "3. Add contract addresses to .env.local"
    echo "4. Run: npm run dev"
    echo ""
    echo "See DEPLOYMENT.md for more details"
else
    echo ""
    echo "❌ Deployment failed"
    echo "Check that you have Base Sepolia ETH in your wallet"
    echo "Get testnet ETH: https://portal.cdp.coinbase.com/products/faucet"
    echo "Or try: https://basefaucet.com/"
fi
