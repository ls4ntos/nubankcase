#!/bin/bash
# Netlify Deployment Script

# Set up Node.js and Netlify CLI paths
export PATH="$HOME/.local/node/bin:$PATH"

echo "🚀 Deploying to Netlify..."
echo ""

# Check if logged in
if ! netlify status &>/dev/null; then
    echo "📝 You need to log in to Netlify first"
    echo "   Running: netlify login"
    netlify login
fi

# Navigate to project directory
cd "$(dirname "$0")"

# Deploy to production
echo ""
echo "📤 Deploying site..."
netlify deploy --prod --dir=.

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Your site should be live at: https://nubankcase.netlify.app"
