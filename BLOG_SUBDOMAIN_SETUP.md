# Blog Subdomain Setup: blog.cloudeval.ai

Guide for setting up `blog.cloudeval.ai` to point to the blog section of the documentation.

## Overview

Since GitHub Pages only supports one CNAME per repository, we have two options:

1. **Option A: Separate Repository** (Recommended)

   - Create a separate repository for the blog
   - Deploy blog content independently
   - Point `blog.cloudeval.ai` to the blog repository

2. **Option B: Redirect Approach**
   - Keep blog in the same repository
   - Use redirects or iframe to serve blog content
   - More complex, less SEO-friendly

## Option A: Separate Repository (Recommended)

### Step 1: Create Blog Repository

1. Create a new repository: `ganakailabs/cloudeval-blog`
2. Initialize with blog content

### Step 2: Set Up Blog Repository Structure

```bash
# Create new repository structure
mkdir Cloudeval-blog
cd Cloudeval-blog

# Copy blog content from main repo
cp -r ../cloudeval/docs/blog/* .

# Create minimal mkdocs.yml for blog
cat > mkdocs.yml << 'EOF'
site_name: Cloudeval Blog
site_url: https://blog.cloudeval.ai/
theme:
  name: material
  palette:
    - scheme: slate
      primary: black
      accent: blue
nav:
  - Home: index.md
  - Updates: updates.md
  - Tutorials: tutorials.md
  - Best Practices: best-practices.md
  - Case Studies: case-studies.md
EOF

# Create index.md
cat > index.md << 'EOF'
# Cloudeval Blog

Welcome to the Cloudeval blog!

[View Full Documentation](https://docs.cloudeval.ai/)
EOF
```

### Step 3: Create GitHub Actions Workflow

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy Blog

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.11"

      - name: Install dependencies
        run: |
          pip install mkdocs mkdocs-material

      - name: Build site
        run: mkdocs build

      - name: Setup Pages
        uses: actions/configure-pages@v4

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./site

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### Step 4: Configure GitHub Pages

1. Go to `https://github.com/ganakailabs/cloudeval-blog/settings/pages`
2. Set Source: **GitHub Actions**
3. Custom domain: `blog.cloudeval.ai`
4. Click **Save**

### Step 5: Add CNAME File

Create `docs/CNAME`:

```
blog.cloudeval.ai
```

Update workflow to copy CNAME:

```yaml
- name: Copy CNAME
  run: |
    if [ -f docs/CNAME ]; then
      cp docs/CNAME site/CNAME
    fi
```

### Step 6: Configure DNS (Namecheap)

Add another CNAME record:

| Field     | Value                   |
| --------- | ----------------------- |
| **Type**  | CNAME Record            |
| **Host**  | `blog`                  |
| **Value** | `ganakailabs.github.io` |
| **TTL**   | Automatic               |

**Note:** This works because GitHub Pages serves different repositories at different paths, and the CNAME determines which repository to serve.

## Option B: Redirect Approach (Same Repository)

If you want to keep everything in one repository, you can use redirects:

### Step 1: Create Redirect Page

Create `docs/blog-redirect.html`:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Redirecting to Blog...</title>
    <meta
      http-equiv="refresh"
      content="0; url=https://docs.cloudeval.ai/blog/"
    />
    <link rel="canonical" href="https://docs.cloudeval.ai/blog/" />
  </head>
  <body>
    <p>Redirecting to <a href="https://docs.cloudeval.ai/blog/">blog</a>...</p>
  </body>
</html>
```

### Step 2: Use CDN/Reverse Proxy

Set up a reverse proxy or CDN (like Cloudflare) to:

- Route `blog.cloudeval.ai` → `docs.cloudeval.ai/blog/`

This requires additional infrastructure setup.

## Recommended: Option A (Separate Repository)

### Benefits

- ✅ Clean separation of concerns
- ✅ Independent deployment
- ✅ Better SEO (separate domain)
- ✅ Easier to manage
- ✅ Can have different themes/configurations

### Setup Script

Here's a complete setup script:

```bash
#!/bin/bash
# setup-blog-repo.sh

REPO_NAME="cloudeval-blog"
GITHUB_USER="ganakailabs"

# Create directory
mkdir -p $REPO_NAME
cd $REPO_NAME

# Initialize git
git init
git checkout -b main

# Copy blog files from main repo
cp -r ../cloudeval/docs/blog/* .

# Create mkdocs.yml
cat > mkdocs.yml << 'EOF'
site_name: Cloudeval Blog
site_url: https://blog.cloudeval.ai/
theme:
  name: material
  palette:
    - scheme: slate
      primary: black
      accent: blue
nav:
  - Home: index.md
  - Updates: updates.md
  - Tutorials: tutorials.md
  - Best Practices: best-practices.md
  - Case Studies: case-studies.md
EOF

# Create CNAME
mkdir -p docs
echo "blog.cloudeval.ai" > docs/CNAME

# Create .github/workflows
mkdir -p .github/workflows
cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy Blog

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.11"
      - run: pip install mkdocs mkdocs-material
      - run: mkdocs build
      - run: |
          if [ -f docs/CNAME ]; then
            cp docs/CNAME site/CNAME
          fi
      - uses: actions/configure-pages@v4
      - uses: actions/upload-pages-artifact@v3
        with:
          path: ./site
      - uses: actions/deploy-pages@v4
        id: deployment
EOF

# Create README
cat > README.md << 'EOF'
# Cloudeval Blog

Blog repository for Cloudeval Documentation.

Visit: https://blog.cloudeval.ai/
EOF

# Create requirements.txt
echo "mkdocs>=1.5.0" > requirements.txt
echo "mkdocs-material>=9.0.0" >> requirements.txt

# Commit
git add .
git commit -m "Initial blog repository setup"

# Create GitHub repo (requires GitHub CLI or manual creation)
echo "Next steps:"
echo "1. Create repository on GitHub: $GITHUB_USER/$REPO_NAME"
echo "2. Push code: git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "3. git push -u origin main"
echo "4. Enable GitHub Pages in repository settings"
echo "5. Set custom domain: blog.cloudeval.ai"
echo "6. Add CNAME record in Namecheap (Host: blog, Value: ganakailabs.github.io)"
```

## DNS Configuration Summary

You'll need **two CNAME records** in Namecheap:

| Host   | Type  | Value                   | Purpose            |
| ------ | ----- | ----------------------- | ------------------ |
| `docs` | CNAME | `ganakailabs.github.io` | Main documentation |
| `blog` | CNAME | `ganakailabs.github.io` | Blog subdomain     |

Both point to the same GitHub Pages server, but GitHub uses the CNAME file in each repository to determine which content to serve.

## Verification

After setup:

1. **Main site:** `https://docs.cloudeval.ai/` → Main documentation
2. **Blog site:** `https://blog.cloudeval.ai/` → Blog content

## Maintenance

### Syncing Blog Content

If you keep blog in the main repo and want to sync:

```bash
# From main repo
cd Cloudeval
./sync-blog.sh ../cloudeval-blog
```

Create `sync-blog.sh`:

```bash
#!/bin/bash
BLOG_REPO=$1
cp -r docs/blog/* $BLOG_REPO/
cd $BLOG_REPO
git add .
git commit -m "Sync blog content from main repo"
git push
```

## Troubleshooting

### Blog Domain Not Working

1. Verify CNAME record: `dig blog.cloudeval.ai CNAME +short`
2. Check CNAME file in blog repository
3. Verify GitHub Pages is enabled for blog repo
4. Wait for DNS propagation (1-4 hours)

### Both Domains Point to Same Content

- Ensure each repository has its own CNAME file
- Verify GitHub Pages settings for each repository
- Check that workflows are deploying to correct branches

## Next Steps

1. Choose Option A (separate repo) or Option B (redirect)
2. Follow the setup steps above
3. Configure DNS in Namecheap
4. Test both domains

---

**Need help?** [Open an issue](https://github.com/ganakailabs/cloudeval/issues)

