# Gopher Documentation

Documentation site for Gopher, built with [Docusaurus](https://docusaurus.io/).

## Local Development

```bash
# Install dependencies
npm install

# Start development server
npm start
```

The site will be available at http://localhost:3000/gopher/

## Build

```bash
npm run build
```

Build output is in the `build/` directory.

## Deploy to GitHub Pages

### Option 1: GitHub Actions (Recommended)

Add this workflow to `.github/workflows/deploy-docs.yml`:

```yaml
name: Deploy Docs

on:
  push:
    branches: [main]
    paths:
      - 'docs/**'

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 18
          cache: npm
          cache-dependency-path: docs/package-lock.json
      
      - name: Install dependencies
        working-directory: docs
        run: npm ci
      
      - name: Build
        working-directory: docs
        run: npm run build
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: docs/build
```

Then enable GitHub Pages in repository settings, using the `gh-pages` branch.

### Option 2: Manual Deploy

```bash
npm run build
npm run deploy
```

This requires `GIT_USER` environment variable set.

## Structure

```
docs/
├── docs/           # Documentation content (Markdown)
│   ├── index.md
│   ├── installation/
│   ├── guides/
│   └── reference/
├── src/
│   └── css/        # Custom styles
├── static/         # Static assets (images, etc.)
├── docusaurus.config.js
├── sidebars.js
└── package.json
```

## Adding Content

1. Add Markdown files to `docs/`
2. Update `sidebars.js` if needed
3. Run `npm start` to preview
4. Commit and push to deploy

## License

Copyright © 2026 Moon Laboratories Inc. All rights reserved.
