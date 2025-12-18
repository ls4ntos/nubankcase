# Quick Setup: lavis.work/nubankcase

## 🎯 Goal
Make your Nubank presentation accessible at `lavis.work/nubankcase` while keeping your Framer site at `lavis.work`.

## ⚡ Quick Steps

### 1. Netlify Subdomain Setup (5 minutes)

**In Netlify:**
1. Go to: https://app.netlify.com/sites/nubankcase/configuration/domains
2. Click "Add custom domain"
3. Enter: `nubankcase.lavis.work`
4. Click "Verify" → "Add domain"

**In Your Domain Registrar:**
- Add CNAME record:
  - Name: `nubankcase`
  - Value: `nubankcase.netlify.app`

**Wait:** 15-30 minutes for DNS to propagate

**Test:** Visit `https://nubankcase.lavis.work` - should show your presentation ✅

---

### 2. Framer Configuration (Choose One)

#### Option A: Redirect (If Available)
In Framer project settings → Redirects:
- From: `/nubankcase`
- To: `https://nubankcase.lavis.work`
- Type: 301

#### Option B: Iframe Embed (Always Works)
1. Create new page in Framer
2. Set page URL to `/nubankcase`
3. Add Code Component with:
```html
<iframe 
  src="https://nubankcase.lavis.work" 
  style="width: 100%; height: 100vh; border: none;"
  allowfullscreen>
</iframe>
```

---

## ✅ Done!

Your presentation will be at:
- **Primary:** `https://lavis.work/nubankcase`
- **Direct:** `https://nubankcase.lavis.work`

Both URLs will work! 🎉

