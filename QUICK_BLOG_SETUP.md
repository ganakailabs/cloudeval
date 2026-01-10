# Quick Setup: blog.cloudeval.ai

Quick guide to set up `blog.cloudeval.ai` as a separate subdomain.

## Option 1: Automated Setup (Recommended)

Run the setup script:

```bash
cd /Users/prateek/workspace/repo/cloudeval
./setup-blog-repo.sh
```

This will:
- Create a new blog repository structure
- Copy blog content from main repo
- Set up GitHub Actions workflow
- Create all necessary configuration files

## Option 2: Manual Setup

### Step 1: Create Blog Repository

1. Go to: https://github.com/new
2. Repository name: `cloudeval-blog`
3. Make it public
4. Click "Create repository"

### Step 2: Clone and Setup

```bash
# Clone the new repository
git clone https://github.com/ganakailabs/cloudeval-blog.git
cd Cloudeval-blog

# Copy blog content from main repo
cp -r ../cloudeval/docs/blog/* blog/

# Create mkdocs.yml (see BLOG_SUBDOMAIN_SETUP.md for full config)
# Create .github/workflows/deploy.yml (see BLOG_SUBDOMAIN_SETUP.md)
# Create docs/CNAME with: blog.cloudeval.ai

# Commit and push
git add .
git commit -m "Initial blog setup"
git push origin main
```

### Step 3: Enable GitHub Pages

1. Go to: https://github.com/ganakailabs/cloudeval-blog/settings/pages
2. Source: **GitHub Actions**
3. Custom domain: `blog.cloudeval.ai`
4. Click **Save**

### Step 4: Add DNS Record

In Namecheap, add a CNAME record:

| Field | Value |
|-------|-------|
| Type | CNAME Record |
| Host | `blog` |
| Value | `ganakailabs.github.io` |
| TTL | Automatic |

### Step 5: Wait and Verify

- Wait 1-4 hours for DNS propagation
- Verify: `dig blog.cloudeval.ai CNAME +short`
- Should return: `ganakailabs.github.io.`
- Enable HTTPS in GitHub Pages settings

## DNS Records Summary

You'll have **two CNAME records** in Namecheap:

| Host | Type | Value | Repository |
|------|------|-------|------------|
| `docs` | CNAME | `ganakailabs.github.io` | Cloudeval |
| `blog` | CNAME | `ganakailabs.github.io` | Cloudeval-blog |

## Result

- **Main docs:** https://docs.cloudeval.ai/
- **Blog:** https://blog.cloudeval.ai/

## Detailed Guide

For complete instructions, see [BLOG_SUBDOMAIN_SETUP.md](BLOG_SUBDOMAIN_SETUP.md)


