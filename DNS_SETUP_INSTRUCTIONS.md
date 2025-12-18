# DNS Setup Instructions for lavis.work/nubankcase

## Step-by-Step Guide

### Step 1: Add Custom Domain in Netlify

1. Go to your Netlify dashboard: https://app.netlify.com/sites/nubankcase/configuration/domains
2. Click **"Add custom domain"**
3. Enter: `lavis.work`
4. Click **"Verify"** and then **"Add domain"**
5. Netlify will show you the DNS records you need to add

### Step 2: Configure DNS at Your Domain Registrar

You need to add these DNS records where you manage `lavis.work`:

#### A Record (for apex/root domain):
- **Type:** A
- **Name/Host:** `@` (or leave blank - this means root domain)
- **Value/Points to:** `75.2.60.5`
- **TTL:** 3600 (or default)

#### CNAME Record (for www subdomain):
- **Type:** CNAME
- **Name/Host:** `www`
- **Value/Points to:** `nubankcase.netlify.app`
- **TTL:** 3600 (or default)

### Step 3: Wait for DNS Propagation

- DNS changes typically take 15-30 minutes, but can take up to 48 hours
- You can check status in your Netlify dashboard
- Netlify will automatically provision an SSL certificate once DNS is verified

### Step 4: Access Your Site

Once DNS propagates:
- Your site will be accessible at: `https://lavis.work`
- And also at: `https://www.lavis.work`

### Step 5: Path Configuration

**Important Note:** When deployed to the root domain, your site will be at `lavis.work/` (root).

If you want `lavis.work/nubankcase` to also work, you have two options:

**Option A:** Redirect `/nubankcase` to root (already configured in netlify.toml)
- Uncomment the redirect rule in `netlify.toml`
- Then `lavis.work/nubankcase` will redirect to `lavis.work/`

**Option B:** Keep site at root
- Access it directly at `lavis.work/`
- This is the standard approach

---

## Common Domain Registrars - Quick Links

- **GoDaddy:** https://www.godaddy.com → My Products → DNS
- **Namecheap:** https://www.namecheap.com → Domain List → Manage → Advanced DNS
- **Cloudflare:** https://dash.cloudflare.com → Select domain → DNS
- **Google Domains:** https://domains.google → My Domains → DNS
- **Name.com:** https://www.name.com → My Domains → DNS Management

---

## Verification

After adding DNS records, you can verify they're working:

```bash
# Check A record
dig lavis.work A

# Check CNAME record
dig www.lavis.work CNAME
```

Or use online tools:
- https://dnschecker.org
- https://www.whatsmydns.net

---

## Troubleshooting

**If DNS isn't working after 24 hours:**
1. Double-check the DNS records are correct
2. Make sure there are no conflicting records
3. Check Netlify dashboard for any error messages
4. Contact your domain registrar support

**If SSL certificate isn't provisioning:**
- Wait a bit longer (can take up to 24 hours after DNS verification)
- Check Netlify dashboard for SSL status
- Netlify automatically provisions SSL certificates for custom domains

---

## Need Help?

If you tell me which registrar you use, I can provide specific step-by-step instructions with screenshots guidance!

