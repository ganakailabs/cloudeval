# GitHub Pages Deployment Guide

Complete guide for deploying Cloudeval Documentation to GitHub Pages with custom domain support.

## Prerequisites

- GitHub repository: `ganakailabs/cloudeval`
- Repository is public (or GitHub Pro/Team for private repos)
- Admin access to the repository

## Initial Setup

### Step 1: Enable GitHub Pages

1. Go to your repository on GitHub
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select **GitHub Actions** (not "Deploy from a branch")
4. Click **Save**

### Step 2: Create gh-pages Branch (First Time Only)

If the `gh-pages` branch doesn't exist, create it:

```bash
# Clone the repository
git clone https://github.com/ganakailabs/cloudeval.git
cd Cloudeval

# Create and switch to gh-pages branch
git checkout --orphan gh-pages

# Remove all files
git rm -rf .

# Create a placeholder file
echo "# GitHub Pages" > README.md
git add README.md
git commit -m "Initial gh-pages branch"
git push origin gh-pages

# Switch back to main
git checkout main
```

### Step 3: Verify Workflow File

The workflow file `.github/workflows/docs.yaml` is already configured. It will:

1. Build the MkDocs site
2. Push to `gh-pages` branch
3. Deploy via GitHub Pages Actions

### Step 4: Trigger First Deployment

Push to the `main` branch or manually trigger the workflow:

1. Go to **Actions** tab in your repository
2. Select **Docs** workflow
3. Click **Run workflow** → **Run workflow**

## Custom Domain Setup

### Step 1: Configure GitHub Repository

1. Go to **Settings** → **Pages**
2. In the **Custom domain** field, enter: `docs.cloudeval.ai`
3. Check **Enforce HTTPS** (will be available after DNS is configured)
4. Click **Save**

### Step 2: Verify CNAME File

The CNAME file is already in `docs/CNAME` with content:
```
docs.cloudeval.ai
```

The workflow automatically copies this to the `gh-pages` branch root during deployment.

### Step 3: Configure DNS (Namecheap)

See [NAMECHEAP_DNS_SETUP.md](NAMECHEAP_DNS_SETUP.md) for detailed instructions.

**Quick Summary:**
- Add CNAME record in Namecheap
- Host: `docs`
- Value: `ganakailabs.github.io`
- TTL: Automatic

### Step 4: Wait for DNS Propagation

- **Typical:** 1-4 hours
- **Maximum:** Up to 48 hours

Check propagation:
```bash
dig docs.cloudeval.ai CNAME +short
# Should return: ganakailabs.github.io.
```

### Step 5: Enable HTTPS

After DNS propagates and GitHub provisions SSL certificate:

1. Go to **Settings** → **Pages**
2. Check **Enforce HTTPS**
3. Wait for certificate provisioning (usually 10 minutes to 1 hour)

## Deployment Workflow

### Automatic Deployment

The site automatically deploys when you:
- Push to `main` branch
- Merge a pull request to `main`

### Manual Deployment

1. Go to **Actions** tab
2. Select **Docs** workflow
3. Click **Run workflow**
4. Select branch: `main`
5. Click **Run workflow**

### Deployment Status

Check deployment status:
- **Actions** tab → **Docs** workflow → Latest run
- **Settings** → **Pages** → Deployment history

## Verification

### Check Deployment

1. Visit: `https://ganakailabs.github.io/cloudeval/` (before custom domain)
2. Visit: `https://docs.cloudeval.ai/` (after DNS setup)

### Verify CNAME

After deployment, verify the CNAME file exists in `gh-pages` branch:
```bash
git checkout gh-pages
cat CNAME
# Should show: docs.cloudeval.ai
```

## Troubleshooting

### Workflow Fails

**Issue:** Workflow fails with "gh-pages branch not found"
**Solution:** Create the `gh-pages` branch (see Step 2 above)

**Issue:** Permission denied
**Solution:** Ensure workflow has `contents: write` permission (already configured)

**Issue:** Build errors
**Solution:** Check workflow logs in Actions tab for specific errors

### Custom Domain Not Working

**Issue:** Domain not resolving
**Solution:**
1. Verify DNS CNAME record is correct
2. Wait for DNS propagation (up to 48 hours)
3. Check CNAME file exists in `gh-pages` branch

**Issue:** SSL certificate not provisioning
**Solution:**
1. Ensure DNS is correctly configured
2. Wait up to 24 hours for automatic provisioning
3. Check for errors in GitHub Pages settings

**Issue:** Mixed content warnings
**Solution:**
1. Ensure `site_url` in `mkdocs.yml` uses HTTPS
2. Check all internal links use HTTPS
3. Clear browser cache

### Build Issues

**Issue:** Missing dependencies
**Solution:** Verify `requirements.txt` includes all needed packages

**Issue:** MkDocs build errors
**Solution:**
1. Test locally: `mkdocs build`
2. Check for YAML syntax errors
3. Verify all referenced files exist

## Monitoring

### GitHub Pages Status

Check status at: **Settings** → **Pages**

### Deployment Logs

View logs at: **Actions** → **Docs** → Latest run

### Site Health

- Check site availability
- Monitor deployment frequency
- Review error logs

## Best Practices

### 1. Test Locally First

Always test changes locally before pushing:

```bash
mkdocs serve
# Test at http://127.0.0.1:8000
```

### 2. Use Pull Requests

Create pull requests for changes to review before merging to `main`.

### 3. Monitor Deployments

Check deployment status after each push to ensure successful deployment.

### 4. Keep gh-pages Clean

Don't manually edit the `gh-pages` branch - it's managed by the workflow.

### 5. Version Control

Tag releases for important documentation versions:

```bash
git tag -a v1.0.0 -m "Documentation v1.0.0"
git push origin v1.0.0
```

## Rollback

If you need to rollback:

1. Revert the commit on `main` branch
2. Push the revert
3. Workflow will automatically redeploy

Or manually:

```bash
git checkout gh-pages
git revert HEAD
git push origin gh-pages
```

## Support

- [GitHub Pages Documentation](https://docs.github.com/pages)
- [MkDocs Documentation](https://www.mkdocs.org/)
- [Open an Issue](https://github.com/ganakailabs/cloudeval/issues)


