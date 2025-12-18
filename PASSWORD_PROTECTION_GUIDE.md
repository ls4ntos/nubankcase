# Password Protection Guide

Your presentation now has password protection! Here's how it works and how to customize it.

## 🔐 Current Setup

I've added **advanced password protection** with a custom UI. The password is currently set to: `nubank2024`

## 📝 How to Change the Password

### Option 1: Simple Password (Basic Prompt)

Edit `assets/password-protection.js` and change this line:
```javascript
const PASSWORD = 'nubank2024'; // Change this to your desired password
```

Then update `index.html` to use the simple version:
```html
<script src="assets/password-protection.js"></script>
```

### Option 2: Advanced Password (Custom UI - Currently Active)

Edit `assets/password-protection-advanced.js` and change this line:
```javascript
const PASSWORD = 'nubank2024'; // Change this to your desired password
```

## 🎨 Features

### Advanced Version (Currently Active):
- ✅ Custom styled password modal
- ✅ Maximum 5 attempts before temporary lockout
- ✅ Session-based (password remembered during browser session)
- ✅ User-friendly error messages
- ✅ Enter key support
- ✅ Auto-focus on password field

### Simple Version:
- ✅ Basic browser prompt
- ✅ Session-based authentication
- ✅ Lightweight

## 🔄 Switch Between Versions

In `index.html`, change the script tag:

**For Advanced (Current):**
```html
<script src="assets/password-protection-advanced.js"></script>
```

**For Simple:**
```html
<script src="assets/password-protection.js"></script>
```

## 🛡️ Security Notes

**Important:** Client-side password protection is **not fully secure** because:
- The password is visible in the JavaScript code
- Anyone can view the source code to see the password
- It's mainly for casual access control

**For Better Security:**
- Use Netlify's built-in password protection (Pro plan)
- Or implement server-side authentication

## 🌐 Netlify Built-in Password Protection (Recommended for Security)

If you have a Netlify Pro plan, you can use their built-in password protection:

1. Go to: https://app.netlify.com/sites/nubankcase
2. Navigate to: **Site configuration** → **Access & security** → **Visitor access**
3. Enable **Password Protection**
4. Set your password
5. Choose scope (all deploys or non-production only)

This is more secure because the password is checked server-side.

## 🔧 Customization Options

### Change Maximum Attempts (Advanced Version)

In `assets/password-protection-advanced.js`:
```javascript
const MAX_ATTEMPTS = 5; // Change to your desired number
```

### Change Session Storage

Currently uses `sessionStorage` (cleared when browser closes). To use `localStorage` (persists):
- Change `sessionStorage` to `localStorage` in the code
- Note: This means password persists even after closing browser

## 🚀 After Changing Password

1. Edit the password in the JavaScript file
2. Deploy to Netlify:
   ```bash
   netlify deploy --prod --dir=.
   ```

## 📱 How It Works

1. User visits the presentation URL
2. Password modal appears
3. User enters password
4. If correct: presentation loads (password remembered for session)
5. If wrong: error message shown (max 5 attempts)
6. After 5 failed attempts: temporary lockout

## ✅ Testing

1. Visit your presentation URL
2. You should see the password prompt
3. Enter: `nubank2024` (or your custom password)
4. Presentation should load

---

**Current Password:** `nubank2024`  
**Protection Type:** Advanced (Custom UI)  
**Max Attempts:** 5

