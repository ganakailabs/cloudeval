# Quick Start: GitHub Deployment & Custom Domain

This is your quick reference for deploying the documentation site to GitHub Pages with custom domain `docs.cloudeval.ai`.

## 🚀 Quick Deployment Steps

### 1. Initial GitHub Setup (One-Time)

```bash
# 1. Push your code to GitHub
git add .
git commit -m "Initial documentation setup"
git push origin main

# 2. Enable GitHub Pages
# Go to: https://github.com/ganakailabs/cloudeval/settings/pages
# Set Source: GitHub Actions
# Click Save
```

### 2. Create gh-pages Branch (If Needed)

```bash
git checkout --orphan gh-pages
git rm -rf .
echo "# GitHub Pages" > README.md
git add README.md
git commit -m "Initial gh-pages branch"
git push origin gh-pages
git checkout main
```

### 3. Trigger Deployment

The workflow will automatically run when you push to `main`, or manually:

1. Go to **Actions** tab
2. Select **Docs** workflow
3. Click **Run workflow**

## 🌐 Custom Domain Setup

### Step 1: GitHub Configuration

**URL:** `https://github.com/ganakailabs/cloudeval/settings/pages`

1. Scroll to **Custom domain**
2. Enter: `docs.cloudeval.ai`
3. Click **Save**

✅ **Done!** The CNAME file is already configured in the repository.

### Step 2: Namecheap DNS Configuration

**URL:** Namecheap → Domain List → Manage `cloudeval.ai` → Advanced DNS

**Add CNAME Record:**

```
Type:    CNAME Record
Host:    docs
Value:   ganakailabs.github.io
TTL:     Automatic
```

**⚠️ Important:**
- Host = `docs` (NOT `docs.cloudeval.ai`)
- Value = `ganakailabs.github.io` (NO `https://`, NO `/cloudeval`)

### Step 3: Wait & Verify

**DNS Propagation:** 1-4 hours (up to 48 hours)

**Verify:**
```bash
dig docs.cloudeval.ai CNAME +short
# Should return: ganakailabs.github.io.
```

**Online Check:**
- https://www.whatsmydns.net/#CNAME/docs.cloudeval.ai

### Step 4: Enable HTTPS

After DNS propagates (usually 10 min - 1 hour):

1. Go to **Settings** → **Pages**
2. Check **Enforce HTTPS**
3. Verify site loads: `https://docs.cloudeval.ai/`

## ✅ Verification Checklist

- [ ] GitHub Pages enabled (Source: GitHub Actions)
- [ ] Workflow runs successfully (check Actions tab)
- [ ] Site accessible at `https://ganakailabs.github.io/cloudeval/`
- [ ] Custom domain entered in GitHub: `docs.cloudeval.ai`
- [ ] CNAME record added in Namecheap
- [ ] DNS propagated (verified)
- [ ] SSL certificate provisioned
- [ ] HTTPS enforced
- [ ] Site accessible at `https://docs.cloudeval.ai/`

## 📋 Files Already Configured

✅ `.github/workflows/docs.yaml` - Deployment workflow  
✅ `docs/CNAME` - Custom domain file  
✅ `mkdocs.yml` - Site URL configured  
✅ `requirements.txt` - Dependencies listed  

## 🔧 Troubleshooting

### Workflow Fails

**Issue:** "gh-pages branch not found"  
**Fix:** Create the branch (see Step 2 above)

**Issue:** Permission denied  
**Fix:** Check repository settings allow Actions

### Domain Not Working

**Issue:** DNS not resolving  
**Fix:** 
1. Verify CNAME record in Namecheap
2. Wait for propagation (up to 48 hours)
3. Check CNAME file in `gh-pages` branch

**Issue:** SSL not provisioning  
**Fix:**
1. Ensure DNS is correct
2. Wait up to 24 hours
3. Check GitHub Pages settings for errors

## 📚 Detailed Guides

- **[GITHUB_DEPLOYMENT.md](GITHUB_DEPLOYMENT.md)** - Complete deployment guide
- **[CUSTOM_DOMAIN_SUMMARY.md](CUSTOM_DOMAIN_SUMMARY.md)** - Custom domain quick reference
- **[NAMECHEAP_DNS_SETUP.md](NAMECHEAP_DNS_SETUP.md)** - Detailed Namecheap instructions
- **[DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md)** - Full checklist

## 🎯 What Happens Next?

1. **Push to main** → Workflow automatically runs
2. **Workflow builds** → MkDocs generates site
3. **Workflow deploys** → Pushes to `gh-pages` branch
4. **GitHub Pages serves** → Site goes live
5. **DNS propagates** → Custom domain works
6. **SSL provisions** → HTTPS enabled

## 📞 Need Help?

- Check workflow logs: **Actions** → **Docs** → Latest run
- Review detailed guides above
- [Open an issue](https://github.com/ganakailabs/cloudeval/issues)

---

**Ready to deploy?** Follow the steps above and your site will be live! 🚀


