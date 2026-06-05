# SynfraCore — Cloudflare Pages Deployment Guide

## ✅ One-Time Setup (15 minutes total)

---

## STEP 1 — Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `synfracore`
3. Set to **Private** (or Public — your choice)
4. Click **Create repository**
5. Run these commands in your terminal:

```bash
cd synfracore
git init
git add .
git commit -m "Initial commit — SynfraCore platform"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/synfracore.git
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.

---

## STEP 2 — Connect to Cloudflare Pages

1. Go to https://dash.cloudflare.com
2. Click **Workers & Pages** in the left sidebar
3. Click **Create** → **Pages** tab → **Connect to Git**
4. Authorize GitHub and select your `synfracore` repo
5. Click **Begin setup**

### Build Settings (enter exactly):

| Setting | Value |
|---------|-------|
| **Framework preset** | `Next.js` |
| **Build command** | `npx @cloudflare/next-on-pages@1` |
| **Build output directory** | `.vercel/output/static` |
| **Root directory** | *(leave blank)* |

### Environment Variables (click Add variable):

| Variable | Value |
|----------|-------|
| `NODE_VERSION` | `20` |
| `NODE_ENV` | `production` |

6. Click **Save and Deploy**

⏳ First build takes ~3-4 minutes. After that, every `git push` auto-deploys in ~2 min.

---

## STEP 3 — Connect synfracore.com Domain

Since your domain is already on Cloudflare — this is instant:

1. In your Pages project → **Custom domains** tab
2. Click **Set up a custom domain**
3. Enter: `synfracore.com`
4. Click **Continue** → Cloudflare auto-creates the DNS record
5. Click **Activate domain**

For `www.synfracore.com` (optional):
- Repeat above with `www.synfracore.com`
- The `_redirects` file already redirects www → non-www

✅ **That's it. Your site is live at synfracore.com.**

---

## Day-to-Day Workflow (after setup)

Every time you want to update the site:

```bash
# Make your changes, then:
git add .
git commit -m "your change description"
git push
```

Cloudflare Pages auto-detects the push and redeploys. Usually live in 1-2 minutes.

---

## Troubleshooting Build Failures

If the build fails in Cloudflare, check the build logs. Common fixes:

**Error: `nodejs_compat` flag**
→ In Pages project → Settings → Functions → Compatibility flags
→ Add `nodejs_compat` to Production and Preview

**Error: Module not found**
→ Make sure `NODE_VERSION = 20` is set in environment variables

**Build command fails**
→ Change build command to:
```
npm install --legacy-peer-deps && npx @cloudflare/next-on-pages@1
```

---

## Free Tier Limits (Cloudflare Pages)

| Resource | Free Limit |
|----------|-----------|
| Requests/month | Unlimited ✅ |
| Bandwidth | Unlimited ✅ |
| Builds/month | 500 |
| Build time | 20 min/build |
| Custom domains | Unlimited ✅ |
| SSL certificate | Free ✅ |

More than enough for SynfraCore at any scale.

