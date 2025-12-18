# Custom Domain Setup: lavis.work/nubankcase

## ⚠️ Important Note

For `lavis.work/nubankcase` to work as a path, you need to host this site at the root domain `lavis.work`. However, if you want to keep `lavis.work` for other content, use the subdomain approach instead.

## Option 1: Subdomain (Easiest) - nubankcase.lavis.work

### Step 1: Add Domain in Netlify Dashboard
1. Go to: https://app.netlify.com/sites/nubankcase/configuration/domains
2. Click **Add custom domain**
3. Enter: `nubankcase.lavis.work`
4. Click **Verify** and **Add domain**

### Step 2: Configure DNS Records
Go to your domain registrar (where you manage lavis.work) and add:

**CNAME Record:**
- **Name/Host:** `nubankcase`
- **Type:** CNAME
- **Value/Target:** `nubankcase.netlify.app`
- **TTL:** 3600 (or default)

### Step 3: Wait for Propagation
- Netlify will automatically provision SSL certificate
- DNS changes take 5 minutes to 48 hours (usually 15-30 minutes)
- Check status in Netlify dashboard

**Result:** ✅ `https://nubankcase.lavis.work`

---

## Option 2: Path-based - lavis.work/nubankcase

If you specifically need the path format `lavis.work/nubankcase`:

### Step 1: Add Root Domain to Netlify
1. Go to: https://app.netlify.com/sites/nubankcase/configuration/domains
2. Click **Add custom domain**
3. Enter: `lavis.work`
4. Click **Verify** and **Add domain**

### Step 2: Configure DNS Records

**A Record (for apex domain):**
- **Name/Host:** `@` (or leave blank for root)
- **Type:** A
- **Value:** `75.2.60.5` (Netlify's load balancer IP)

**CNAME Record (for www):**
- **Name/Host:** `www`
- **Type:** CNAME
- **Value:** `nubankcase.netlify.app`

### Step 3: Understanding the Path
⚠️ **Important:** When you deploy to `lavis.work`, the site will be accessible at:
- `lavis.work/` (root)
- NOT automatically at `lavis.work/nubankcase`

If you want `lavis.work/nubankcase` specifically, you have two options:

**A) Use it as the root site:**
- The presentation will be at `lavis.work/`
- You can redirect `lavis.work/nubankcase` → `lavis.work/` (see below)

**B) Use Netlify's path-based routing:**
- Requires hosting multiple sites under one domain
- More complex setup

### Step 4: Optional Redirect (if using Option 2A)
If you want `lavis.work/nubankcase` to redirect to the root:

Add to `netlify.toml`:
```toml
[[redirects]]
  from = "/nubankcase"
  to = "/"
  status = 301
```

---

## 🎯 Recommended: Use Option 1 (Subdomain)

**Why?**
- ✅ Cleaner: `nubankcase.lavis.work`
- ✅ Easier DNS setup
- ✅ Can host multiple projects (nubankcase.lavis.work, project2.lavis.work)
- ✅ Standard web practice
- ✅ Keeps root domain free for other uses

---

## Quick Setup Steps (Subdomain)

1. **Netlify:** Add `nubankcase.lavis.work` in domain settings
2. **DNS:** Add CNAME record `nubankcase` → `nubankcase.netlify.app`
3. **Wait:** 15-30 minutes for DNS propagation
4. **Done:** Access at `https://nubankcase.lavis.work`

---

## Need Specific DNS Help?

Tell me which registrar you use (GoDaddy, Namecheap, Cloudflare, Google Domains, etc.) and I can provide exact step-by-step instructions!
