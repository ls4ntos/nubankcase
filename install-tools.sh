#!/bin/bash
# Installation script for Netlify CLI deployment tools

set -e

echo "🔧 Installing Developer Tools for Netlify Deployment..."
echo ""

# Step 1: Check/Install Xcode Command Line Tools
echo "📦 Step 1: Checking Xcode Command Line Tools..."
if xcode-select -p &>/dev/null; then
    echo "✅ Xcode Command Line Tools already installed"
else
    echo "⚠️  Xcode Command Line Tools not found"
    echo "   Please complete the installation dialog that appeared"
    echo "   Or run: xcode-select --install"
    read -p "Press Enter once Xcode Command Line Tools installation is complete..."
fi

# Step 2: Install Node.js via nvm
echo ""
echo "📦 Step 2: Installing Node.js via nvm..."

# Install nvm if not already installed
if [ ! -d "$HOME/.nvm" ]; then
    echo "   Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
    echo "✅ nvm already installed"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install Node.js
echo "   Installing Node.js v20..."
nvm install 20
nvm use 20
nvm alias default 20

# Verify Node.js installation
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "✅ Node.js installed: $NODE_VERSION"
else
    echo "❌ Node.js installation failed"
    exit 1
fi

# Step 3: Install Netlify CLI
echo ""
echo "📦 Step 3: Installing Netlify CLI..."
npm install -g netlify-cli

# Verify Netlify CLI installation
if command -v netlify &> /dev/null; then
    NETLIFY_VERSION=$(netlify --version)
    echo "✅ Netlify CLI installed: $NETLIFY_VERSION"
else
    echo "❌ Netlify CLI installation failed"
    exit 1
fi

echo ""
echo "✨ All tools installed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Run: netlify login"
echo "2. Then: netlify deploy --prod --dir=."
echo ""

