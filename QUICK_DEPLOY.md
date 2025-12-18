# 🚀 Quick Deploy via Command Line

All tools are installed! Here's how to deploy:

## Option 1: Use the Deploy Script (Easiest)

```bash
cd /Users/lavisantos/Desktop/Design_Nubank_v1.1
./deploy.sh
```

## Option 2: Manual Deployment

```bash
# 1. Set up environment
export PATH="$HOME/.local/node/bin:$PATH"

# 2. Navigate to project
cd /Users/lavisantos/Desktop/Design_Nubank_v1.1

# 3. Login to Netlify (first time only)
netlify login

# 4. Deploy to production
netlify deploy --prod --dir=.
```

## What's Installed:

✅ Node.js v20.11.0 (in ~/.local/node)
✅ Netlify CLI v23.12.3
✅ All deployment scripts ready

## After Login:

Once you complete the browser login, the deployment will proceed automatically!

---

**Note:** The first time you run `netlify login`, it will open a browser window for you to authorize the CLI. After that, deployments can be done entirely from the command line!
