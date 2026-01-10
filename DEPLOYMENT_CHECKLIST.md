# Deployment Checklist

Use this checklist to ensure your documentation site is properly deployed.

## Pre-Deployment

- [ ] Repository is created on GitHub: `ganakailabs/cloudeval`
- [ ] All documentation files are committed to `main` branch
- [ ] `mkdocs.yml` is configured correctly
- [ ] `requirements.txt` includes all dependencies
- [ ] `.github/workflows/docs.yaml` exists and is correct
- [ ] `docs/CNAME` file contains `docs.cloudeval.ai`
- [ ] Tested locally with `mkdocs serve`

## GitHub Setup

- [ ] GitHub Pages is enabled (Settings → Pages → Source: GitHub Actions)
- [ ] `gh-pages` branch exists (create if needed)
- [ ] Repository permissions allow GitHub Actions to write
- [ ] Workflow file is in `.github/workflows/docs.yaml`

## First Deployment

- [ ] Push code to `main` branch OR manually trigger workflow
- [ ] Check Actions tab - workflow runs successfully
- [ ] Verify `gh-pages` branch is created/updated
- [ ] Site is accessible at `https://ganakailabs.github.io/cloudeval/`

## Custom Domain Setup

### GitHub Configuration

- [ ] Go to Settings → Pages
- [ ] Enter custom domain: `docs.cloudeval.ai`
- [ ] Click Save
- [ ] Verify CNAME file appears in repository (in `gh-pages` branch)

### DNS Configuration (Namecheap)

- [ ] Logged into Namecheap account
- [ ] Navigated to Domain List → Manage `cloudeval.ai`
- [ ] Opened Advanced DNS tab
- [ ] Added CNAME record:
  - Type: CNAME Record
  - Host: `docs`
  - Value: `ganakailabs.github.io`
  - TTL: Automatic
- [ ] Saved all changes
- [ ] Verified record appears in Host Records

### DNS Verification

- [ ] Wait 1-4 hours for DNS propagation
- [ ] Test DNS: `dig docs.cloudeval.ai CNAME +short`
  - Should return: `ganakailabs.github.io.`
- [ ] Test resolution: `nslookup docs.cloudeval.ai`
- [ ] Check online: [whatsmydns.net](https://www.whatsmydns.net/#CNAME/docs.cloudeval.ai)

### SSL Certificate

- [ ] Wait for GitHub to provision SSL certificate (10 min - 1 hour)
- [ ] Check certificate status in Settings → Pages
- [ ] Enable "Enforce HTTPS" when available
- [ ] Verify site loads with HTTPS: `https://docs.cloudeval.ai/`

## Post-Deployment Verification

- [ ] Site is accessible at custom domain
- [ ] All pages load correctly
- [ ] Navigation works
- [ ] Search functionality works
- [ ] Links are correct (no 404 errors)
- [ ] Images and assets load
- [ ] Dark theme is default
- [ ] Mobile responsive design works

## Ongoing Maintenance

- [ ] Monitor deployment status after each push
- [ ] Review workflow logs if deployments fail
- [ ] Keep dependencies updated in `requirements.txt`
- [ ] Test changes locally before pushing
- [ ] Review and update documentation regularly

## Troubleshooting

If any step fails:

- [ ] Check workflow logs in Actions tab
- [ ] Verify DNS configuration
- [ ] Test locally with `mkdocs build`
- [ ] Review [GITHUB_DEPLOYMENT.md](GITHUB_DEPLOYMENT.md)
- [ ] Check [NAMECHEAP_DNS_SETUP.md](NAMECHEAP_DNS_SETUP.md)
- [ ] Open an issue if problem persists

## Quick Reference

### URLs

- **GitHub Pages (default):** `https://ganakailabs.github.io/cloudeval/`
- **Custom Domain:** `https://docs.cloudeval.ai/`
- **Repository:** `https://github.com/ganakailabs/cloudeval`

### Important Files

- `.github/workflows/docs.yaml` - Deployment workflow
- `mkdocs.yml` - MkDocs configuration
- `docs/CNAME` - Custom domain configuration
- `requirements.txt` - Python dependencies

### Commands

```bash
# Test locally
mkdocs serve

# Build locally
mkdocs build

# Check DNS
dig docs.cloudeval.ai CNAME +short

# Verify CNAME in gh-pages
git checkout gh-pages
cat CNAME
```

---

**Status:** ⬜ Not Started | 🟡 In Progress | ✅ Complete


