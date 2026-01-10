# Custom Domain Setup Summary

Quick reference for setting up `docs.cloudeval.ai` with GitHub Pages.

## Custom Domain: docs.cloudeval.ai

### Current Configuration

- **Domain:** `docs.cloudeval.ai`
- **GitHub Pages URL:** `ganakailabs.github.io`
- **Repository:** `ganakailabs/cloudeval`
- **CNAME File:** `docs/CNAME` contains `docs.cloudeval.ai`

## Required Changes

### 1. GitHub Repository Settings

**Location:** `https://github.com/ganakailabs/cloudeval/settings/pages`

**Actions Required:**
1. Go to **Settings** → **Pages**
2. Under **Custom domain**, enter: `docs.cloudeval.ai`
3. Click **Save**
4. After DNS is configured, enable **Enforce HTTPS**

**Status:** ⬜ Not Done | ✅ Done

---

### 2. Namecheap DNS Configuration

**Location:** Namecheap Domain Management → Advanced DNS

**CNAME Record to Add:**

| Field | Value |
|-------|-------|
| **Type** | CNAME Record |
| **Host** | `docs` |
| **Value** | `ganakailabs.github.io` |
| **TTL** | Automatic (or 30 min) |

**Important Notes:**
- Host should be just `docs` (NOT `docs.cloudeval.ai`)
- Value should be `ganakailabs.github.io` (NO `https://`, NO trailing slash, NO repository path)
- Do NOT include `/cloudeval` in the value

**Status:** ⬜ Not Done | ✅ Done

---

### 3. DNS Verification

**Wait Time:** 1-4 hours (can take up to 48 hours)

**Verify DNS:**

```bash
# Check CNAME record
dig docs.cloudeval.ai CNAME +short
# Expected output: ganakailabs.github.io.

# Check resolution
nslookup docs.cloudeval.ai
```

**Online Tools:**
- [whatsmydns.net](https://www.whatsmydns.net/#CNAME/docs.cloudeval.ai)
- [dnschecker.org](https://dnschecker.org/#CNAME/docs.cloudeval.ai)

**Status:** ⬜ Not Done | ✅ Done

---

### 4. SSL Certificate

**Wait Time:** 10 minutes to 1 hour after DNS propagates

**Actions:**
1. Go to **Settings** → **Pages**
2. Wait for "Certificate is being provisioned" message
3. Once ready, check **Enforce HTTPS**
4. Verify site loads at `https://docs.cloudeval.ai/`

**Status:** ⬜ Not Done | ✅ Done

---

## Complete Setup Checklist

- [ ] GitHub Pages enabled (Source: GitHub Actions)
- [ ] Custom domain entered in GitHub: `docs.cloudeval.ai`
- [ ] CNAME record added in Namecheap (Host: `docs`, Value: `ganakailabs.github.io`)
- [ ] DNS propagated (verified with `dig` or online tools)
- [ ] SSL certificate provisioned by GitHub
- [ ] HTTPS enforced in GitHub Pages settings
- [ ] Site accessible at `https://docs.cloudeval.ai/`

## Troubleshooting

### Domain Not Resolving

1. Verify CNAME record in Namecheap
2. Wait for DNS propagation (up to 48 hours)
3. Check CNAME file exists in `gh-pages` branch after deployment

### SSL Certificate Issues

1. Ensure DNS is correctly configured
2. Wait up to 24 hours for automatic provisioning
3. Check for errors in GitHub Pages settings

### Site Not Loading

1. Verify deployment succeeded (check Actions tab)
2. Check `gh-pages` branch has content
3. Verify CNAME file in `gh-pages` branch root

## Quick Commands

```bash
# Check DNS
dig docs.cloudeval.ai CNAME +short

# Verify CNAME in repository
git checkout gh-pages
cat CNAME

# Test site locally
mkdocs serve
```

## Support

- [Full Deployment Guide](GITHUB_DEPLOYMENT.md)
- [Namecheap DNS Setup](NAMECHEAP_DNS_SETUP.md)
- [Deployment Checklist](DEPLOYMENT_CHECKLIST.md)
- [GitHub Issues](https://github.com/ganakailabs/cloudeval/issues)

---

**Last Updated:** January 2025


