# Setup: lavis.work/nubankcase with Framer Main Site

Since your main site `lavis.work` is hosted on Framer, we'll use a subdomain approach and configure Framer to proxy the subdirectory.

## Solution Overview

1. **Deploy Netlify site to subdomain:** `nubankcase.lavis.work`
2. **Configure Framer to proxy:** `lavis.work/nubankcase` → `nubankcase.lavis.work`

---

## Step 1: Set Up Subdomain on Netlify

### 1.1 Add Subdomain in Netlify
1. Go to: https://app.netlify.com/sites/nubankcase/configuration/domains
2. Click **"Add custom domain"**
3. Enter: `nubankcase.lavis.work`
4. Click **"Verify"** and **"Add domain"**

### 1.2 Configure DNS for Subdomain
At your domain registrar (where you manage `lavis.work`), add:

**CNAME Record:**
- **Type:** CNAME
- **Name/Host:** `nubankcase`
- **Value/Points to:** `nubankcase.netlify.app`
- **TTL:** 3600 (or default)

**Wait 15-30 minutes** for DNS propagation. You can verify it's working by visiting `https://nubankcase.lavis.work` (should show your presentation).

---

## Step 2: Configure Framer to Proxy /nubankcase

Framer has a few options for handling this. Choose the method that works best:

### Option A: Framer Redirect (Simplest)

If Framer supports custom redirects:

1. Go to your Framer project settings
2. Navigate to **Custom Domains** or **Redirects** section
3. Add a redirect rule:
   - **From:** `/nubankcase`
   - **To:** `https://nubankcase.lavis.work`
   - **Type:** 301 (Permanent) or 302 (Temporary)

### Option B: Framer Custom Code (Iframe Embed)

If redirects aren't available, you can embed the presentation using an iframe:

1. In your Framer project, create a new page or section
2. Add a **Code Component** or **Embed**
3. Use this code:

```html
<iframe 
  src="https://nubankcase.lavis.work" 
  style="width: 100%; height: 100vh; border: none;"
  allowfullscreen>
</iframe>
```

4. Set the page URL to `/nubankcase` in Framer's page settings

### Option C: Framer Custom Domain Rewrites (If Available)

Some Framer plans support custom rewrites. Check if your plan includes:
- Custom domain rewrites
- Proxy rules
- Server-side redirects

If available, configure:
- **Path:** `/nubankcase/*`
- **Proxy to:** `https://nubankcase.lavis.work/*`

---

## Step 3: Alternative - Direct Subdomain Access

If Framer doesn't support proxying, you can simply:
- Use `nubankcase.lavis.work` directly
- Link to it from your main Framer site
- Users can access it via the subdomain

---

## Verification Checklist

- [ ] Subdomain `nubankcase.lavis.work` is set up in Netlify
- [ ] DNS CNAME record is added at domain registrar
- [ ] Subdomain is accessible at `https://nubankcase.lavis.work`
- [ ] SSL certificate is active (Netlify auto-provisions)
- [ ] Framer redirect/proxy is configured (if using Option A or C)
- [ ] Test `lavis.work/nubankcase` to ensure it works

---

## Testing

1. **Test subdomain directly:**
   ```
   https://nubankcase.lavis.work
   ```
   Should show your Nubank presentation.

2. **Test via main domain:**
   ```
   https://lavis.work/nubankcase
   ```
   Should either redirect to or proxy the subdomain (depending on Framer configuration).

---

## Troubleshooting

**If subdomain doesn't work:**
- Check DNS propagation: https://dnschecker.org
- Verify CNAME record is correct
- Wait up to 48 hours for full propagation

**If `/nubankcase` path doesn't work:**
- Check Framer redirect/rewrite configuration
- Verify the redirect target URL is correct
- Try using iframe embed (Option B) as fallback

**If assets don't load:**
- The presentation uses relative paths, so it should work from subdirectory
- Check browser console for any 404 errors
- Verify all files are deployed to Netlify

---

## Need Help with Framer Configuration?

Framer's capabilities vary by plan. If you need help:
1. Check Framer's documentation for "Custom Redirects" or "Domain Rewrites"
2. Contact Framer support if your plan supports custom domain configurations
3. Use Option B (iframe) as a reliable fallback

---

## Quick Summary

1. ✅ Add `nubankcase.lavis.work` to Netlify
2. ✅ Add CNAME DNS record: `nubankcase` → `nubankcase.netlify.app`
3. ✅ Configure Framer to redirect/proxy `/nubankcase` → `nubankcase.lavis.work`
4. ✅ Test both URLs work correctly

Your presentation will be accessible at `lavis.work/nubankcase`! 🎉

