#!/bin/bash
# Complete Redeployment Script

# Set up environment
export PATH="$HOME/.local/node/bin:$PATH"

# Navigate to project
cd "$(dirname "$0")"

echo "🚀 Netlify Deployment Tool"
echo "=========================="
echo ""

# Check if Netlify CLI is available
if ! command -v netlify &> /dev/null; then
    echo "❌ Netlify CLI not found. Please run: export PATH=\"\$HOME/.local/node/bin:\$PATH\""
    exit 1
fi

# Check login status
echo "📋 Checking Netlify login status..."
if netlify status &>/dev/null; then
    echo "✅ Already logged in to Netlify"
else
    echo "🔐 You need to log in to Netlify"
    echo "   This will open a browser window for authentication"
    echo ""
    read -p "Press Enter to continue with login..."
    netlify login
fi

# Deploy
echo ""
echo "📤 Deploying to Netlify..."
echo ""

# Check if site is already linked
if [ -f ".netlify/state.json" ]; then
    echo "✅ Site is linked. Deploying to production..."
    netlify deploy --prod --dir=.
else
    echo "🔗 Linking site to Netlify..."
    echo "   If prompted, select 'Create & configure a new site'"
    netlify init
    echo ""
    echo "📤 Deploying to production..."
    netlify deploy --prod --dir=.
fi

echo ""
echo "✅ Deployment complete!"
echo ""
echo "🌐 Your site is live at: https://nubankcase.netlify.app"
echo ""
echo "✨ Updated features:"
echo "   - Fullscreen presentation (no black borders)"
echo "   - Optimized for 1920x1080p"
echo "   - Fills entire browser window"

