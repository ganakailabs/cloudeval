#!/bin/bash
# Setup script for creating separate blog repository

set -e

REPO_NAME="cloudeval-blog"
GITHUB_USER="ganakailabs"
CURRENT_DIR=$(pwd)
BLOG_DIR="../$REPO_NAME"

echo "🚀 Setting up blog repository: $REPO_NAME"

# Create directory
if [ -d "$BLOG_DIR" ]; then
    echo "⚠️  Directory $BLOG_DIR already exists. Removing..."
    rm -rf "$BLOG_DIR"
fi

mkdir -p "$BLOG_DIR"
cd "$BLOG_DIR"

# Initialize git
echo "📦 Initializing git repository..."
git init
git checkout -b main

# Copy blog files from main repo
echo "📋 Copying blog content..."
mkdir -p blog
cp -r "$CURRENT_DIR/docs/blog"/* blog/ 2>/dev/null || {
    echo "⚠️  Blog directory not found, creating sample files..."
    mkdir -p blog
    cat > blog/index.md << 'EOF'
# cloudeval Blog

Welcome to the cloudeval blog!

[View Full Documentation](https://docs.cloudeval.ai/)
EOF
}

# Create mkdocs.yml
echo "⚙️  Creating mkdocs.yml..."
cat > mkdocs.yml << 'EOF'
site_name: cloudeval Blog
site_url: https://blog.cloudeval.ai/
site_description: cloudeval Blog - Updates, tutorials, and insights
site_author: cloudeval Team

repo_url: https://github.com/ganakailabs/cloudeval-blog
edit_uri: edit/main/blog/

extra_css:
- assets/stylesheets/extra.css

theme:
  language: en
  name: material
  font:
    text: Roboto
  palette:
    - scheme: slate
      primary: black
      accent: blue
      toggle:
        icon: material/brightness-7
        name: Switch to light mode
    - scheme: default
      primary: black
      accent: blue
      toggle:
        icon: material/brightness-4
        name: Switch to dark mode
  features:
    - navigation.instant
    - navigation.indexes
    - navigation.sections:
        level: 1
    - navigation.tabs
    - navigation.footer
    - content.code.copy
  icon:
    repo: fontawesome/brands/github

markdown_extensions:
  - admonition
  - attr_list
  - md_in_html
  - pymdownx.highlight:
      anchor_linenums: true
      line_spans: __span
      pygments_lang_class: true
  - pymdownx.superfences
  - pymdownx.tabbed:
      alternate_style: true
  - toc:
      permalink: '#'

plugins:
  - search

nav:
  - Home: index.md
  - Updates: blog/updates.md
  - Tutorials: blog/tutorials.md
  - Best Practices: blog/best-practices.md
  - Case Studies: blog/case-studies.md

extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/ganakailabs/cloudeval-blog

copyright: Copyright &copy; 2025 Cloudeval Team
EOF

# Create index.md
echo "📄 Creating index.md..."
cat > index.md << 'EOF'
# cloudeval Blog

Welcome to the cloudeval blog! Here you'll find updates, tutorials, and insights about cloud evaluation and best practices.

## Latest Posts

- [Getting Started with cloudeval](blog/getting-started-with-cloudeval.md)
- [Security Best Practices](blog/security-best-practices.md)
- [Cost Optimization Case Study](blog/cost-optimization-case-study.md)
- [CI/CD Integration Guide](blog/ci-cd-integration.md)

## Resources

- [Full Documentation](https://docs.cloudeval.ai/)
- [GitHub Repository](https://github.com/ganakailabs/cloudeval)
EOF

# Create CNAME
echo "🌐 Creating CNAME file..."
mkdir -p docs
echo "blog.cloudeval.ai" > docs/CNAME

# Create .github/workflows
echo "🔧 Creating GitHub Actions workflow..."
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
      
      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.11"
      
      - name: Install dependencies
        run: |
          pip install --upgrade pip
          pip install mkdocs mkdocs-material pymdown-extensions
      
      - name: Build site
        run: mkdocs build
      
      - name: Copy CNAME
        run: |
          if [ -f docs/CNAME ]; then
            cp docs/CNAME site/CNAME
          fi
      
      - name: Setup Pages
        uses: actions/configure-pages@v4
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./site
      
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
EOF

# Create README
echo "📝 Creating README..."
cat > README.md << 'EOF'
# cloudeval Blog

Blog repository for cloudeval documentation.

Visit: https://blog.cloudeval.ai/

## Setup

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Serve locally:
   ```bash
   mkdocs serve
   ```

3. Build:
   ```bash
   mkdocs build
   ```

## Deployment

The blog is automatically deployed to GitHub Pages via GitHub Actions when you push to the `main` branch.

## Custom Domain

The blog is configured to use `blog.cloudeval.ai` as the custom domain.

See [BLOG_SUBDOMAIN_SETUP.md](BLOG_SUBDOMAIN_SETUP.md) for DNS configuration.
EOF

# Create requirements.txt
echo "📦 Creating requirements.txt..."
cat > requirements.txt << 'EOF'
mkdocs>=1.5.0
mkdocs-material>=9.0.0
pymdown-extensions>=10.0.0
EOF

# Create .gitignore
echo "🚫 Creating .gitignore..."
cat > .gitignore << 'EOF'
site/
.cache/
__pycache__/
*.pyc
venv/
env/
.DS_Store
EOF

# Copy CSS if it exists
if [ -d "$CURRENT_DIR/docs/assets/stylesheets" ]; then
    echo "🎨 Copying stylesheets..."
    mkdir -p assets/stylesheets
    cp "$CURRENT_DIR/docs/assets/stylesheets/extra.css" assets/stylesheets/ 2>/dev/null || true
fi

# Commit
echo "💾 Committing files..."
git add .
git commit -m "Initial blog repository setup" || true

echo ""
echo "✅ Blog repository setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Create repository on GitHub:"
echo "   gh repo create $GITHUB_USER/$REPO_NAME --public"
echo "   OR create it manually at: https://github.com/new"
echo ""
echo "2. Add remote and push:"
echo "   cd $BLOG_DIR"
echo "   git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "   git push -u origin main"
echo ""
echo "3. Enable GitHub Pages:"
echo "   Go to: https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
echo "   - Source: GitHub Actions"
echo "   - Custom domain: blog.cloudeval.ai"
echo ""
echo "4. Add DNS record in Namecheap:"
echo "   - Type: CNAME"
echo "   - Host: blog"
echo "   - Value: ganakailabs.github.io"
echo ""
echo "5. Wait for DNS propagation (1-4 hours)"
echo ""
echo "📁 Blog repository location: $BLOG_DIR"

