#!/bin/bash
# Complete Developer Tools Installation Script (Requires Sudo)

set -e

echo "🔧 Installing Developer Tools with Sudo Access"
echo "================================================"
echo ""

# Check if running as admin or can use sudo
if ! sudo -n true 2>/dev/null; then
    echo "📝 This script requires sudo/administrator access"
    echo "   You'll be prompted for your password"
    echo ""
    read -p "Press Enter to continue (you'll enter your password when prompted)..."
fi

# Step 1: Install Xcode Command Line Tools
echo ""
echo "📦 Step 1: Installing Xcode Command Line Tools..."
if xcode-select -p &>/dev/null; then
    echo "✅ Xcode Command Line Tools already installed"
else
    echo "   Installing Xcode Command Line Tools (this may take a few minutes)..."
    sudo xcode-select --install 2>/dev/null || {
        echo "   Installation dialog should appear. Please complete it."
        read -p "Press Enter once Xcode Command Line Tools installation is complete..."
    }
fi

# Step 2: Install Homebrew
echo ""
echo "📦 Step 2: Installing Homebrew..."
if command -v brew &>/dev/null; then
    echo "✅ Homebrew already installed"
    brew --version
else
    echo "   Installing Homebrew (this requires your password)..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ -f /opt/homebrew/bin/brew ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    # Add Homebrew to PATH for Intel Macs
    elif [[ -f /usr/local/bin/brew ]]; then
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    echo "✅ Homebrew installed"
fi

# Step 3: Install Node.js via Homebrew
echo ""
echo "📦 Step 3: Installing Node.js..."
if command -v node &>/dev/null; then
    NODE_VERSION=$(node --version)
    echo "✅ Node.js already installed: $NODE_VERSION"
else
    echo "   Installing Node.js via Homebrew..."
    brew install node
    echo "✅ Node.js installed"
fi

# Verify Node.js and npm
NODE_VERSION=$(node --version)
NPM_VERSION=$(npm --version)
echo "   Node.js: $NODE_VERSION"
echo "   npm: $NPM_VERSION"

# Step 4: Install Netlify CLI
echo ""
echo "📦 Step 4: Installing Netlify CLI..."
if command -v netlify &>/dev/null; then
    NETLIFY_VERSION=$(netlify --version)
    echo "✅ Netlify CLI already installed: $NETLIFY_VERSION"
else
    echo "   Installing Netlify CLI globally..."
    npm install -g netlify-cli
    echo "✅ Netlify CLI installed"
fi

NETLIFY_VERSION=$(netlify --version)
echo "   Netlify CLI: $NETLIFY_VERSION"

# Step 5: Install Git (if not already installed)
echo ""
echo "📦 Step 5: Checking Git..."
if command -v git &>/dev/null; then
    GIT_VERSION=$(git --version)
    echo "✅ Git already installed: $GIT_VERSION"
else
    echo "   Installing Git via Homebrew..."
    brew install git
    echo "✅ Git installed"
fi

echo ""
echo "✨ All Developer Tools Installed Successfully!"
echo "================================================"
echo ""
echo "📋 Installed Tools:"
echo "   ✅ Xcode Command Line Tools"
echo "   ✅ Homebrew"
echo "   ✅ Node.js ($NODE_VERSION)"
echo "   ✅ npm ($NPM_VERSION)"
echo "   ✅ Netlify CLI ($NETLIFY_VERSION)"
echo "   ✅ Git"
echo ""
echo "🚀 You can now deploy using:"
echo "   cd /Users/lavisantos/Desktop/Design_Nubank_v1.1"
echo "   netlify deploy --prod --dir=."
echo ""

