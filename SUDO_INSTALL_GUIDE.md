# 🔐 Sudo Access Installation Guide

This guide will help you install all developer tools properly with administrator (sudo) access.

## Why Sudo Access?

Some tools like Homebrew require administrator privileges to install system-wide. This gives you:
- ✅ Proper installation paths
- ✅ System-wide access to tools
- ✅ Better integration with macOS
- ✅ Easier updates and maintenance

## Quick Installation

### Option 1: Run the Automated Script (Recommended)

```bash
cd /Users/lavisantos/Desktop/Design_Nubank_v1.1
./install-with-sudo.sh
```

**What happens:**
1. You'll be prompted for your macOS password (for sudo)
2. Script installs Xcode Command Line Tools
3. Installs Homebrew (package manager)
4. Installs Node.js via Homebrew
5. Installs Netlify CLI globally
6. Installs Git (if needed)

**Time:** ~5-10 minutes

---

### Option 2: Manual Installation Steps

If you prefer to do it step by step:

#### Step 1: Install Xcode Command Line Tools

```bash
xcode-select --install
```

A dialog will appear. Click "Install" and wait for completion (~5-10 minutes).

#### Step 2: Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

You'll be prompted for your password. After installation, follow the on-screen instructions to add Homebrew to your PATH.

#### Step 3: Install Node.js

```bash
brew install node
```

#### Step 4: Install Netlify CLI

```bash
npm install -g netlify-cli
```

#### Step 5: Verify Installation

```bash
node --version
npm --version
netlify --version
git --version
```

---

## What Gets Installed?

| Tool | Purpose | Location |
|------|---------|----------|
| **Xcode Command Line Tools** | Compilers, Git, and development tools | `/Library/Developer/CommandLineTools` |
| **Homebrew** | Package manager for macOS | `/opt/homebrew` (Apple Silicon) or `/usr/local` (Intel) |
| **Node.js** | JavaScript runtime | Installed via Homebrew |
| **npm** | Node package manager | Comes with Node.js |
| **Netlify CLI** | Command-line tool for Netlify | Global npm package |
| **Git** | Version control | Comes with Xcode Tools or via Homebrew |

---

## Troubleshooting

### "Password Required" Error

If you see password prompts:
- Enter your macOS user account password
- This is the same password you use to log into your Mac
- The password won't be visible as you type (this is normal)

### "Command Not Found" After Installation

If tools aren't found after installation:

1. **Restart your terminal** (close and reopen)
2. **Or reload your shell:**
   ```bash
   source ~/.zshrc
   ```

### Homebrew PATH Issues

If Homebrew isn't found:

**For Apple Silicon Macs (M1/M2/M3):**
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"
```

**For Intel Macs:**
```bash
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/usr/local/bin/brew shellenv)"
```

### Permission Denied Errors

If you get permission errors:
- Make sure you're using `sudo` where needed
- Check that your user account has administrator privileges
- Try running commands with `sudo` prefix

---

## After Installation

Once everything is installed, you can:

1. **Deploy your site:**
   ```bash
   cd /Users/lavisantos/Desktop/Design_Nubank_v1.1
   netlify deploy --prod --dir=.
   ```

2. **Update tools later:**
   ```bash
   brew update          # Update Homebrew
   brew upgrade node     # Update Node.js
   npm update -g netlify-cli  # Update Netlify CLI
   ```

---

## Security Note

Sudo access gives administrative privileges. The installation script only uses sudo for:
- Installing Xcode Command Line Tools
- Installing Homebrew (which needs to write to system directories)

All other tools (Node.js, Netlify CLI) are installed in user space and don't require sudo.

---

## Need Help?

If you encounter any issues:
1. Check the error message carefully
2. Make sure you have administrator privileges on your Mac
3. Try running the script again
4. Check that Xcode Command Line Tools installation completed

---

## Quick Reference

```bash
# Check if you have sudo access
sudo -v

# Check installed tools
which node
which npm
which netlify
which git
which brew

# Check versions
node --version
npm --version
netlify --version
git --version
brew --version
```

