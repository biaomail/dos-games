#!/bin/bash

# Build script for creating a self-contained gh-pages deployment
# This script copies all necessary files for the DOS game player

set -e  # Exit on error

echo "🔨 Building gh-pages deployment..."

# Clean up existing gh-pages folder
if [ -d "gh-pages" ]; then
    echo "📁 Removing existing gh-pages folder..."
    rm -rf gh-pages
fi

# Create gh-pages directory
echo "📁 Creating gh-pages folder..."
mkdir -p gh-pages

# Copy HTML files
echo "📄 Copying HTML files..."
cp index.html gh-pages/
cp game.html gh-pages/

# Copy JSON files
echo "📄 Copying JSON files..."
cp games.json gh-pages/
cp mapping.json gh-pages/

# Copy lib directory (js-dos library)
echo "📚 Copying js-dos library..."
cp -r lib gh-pages/

# Copy README
echo "📝 Copying README..."
cp README.md gh-pages/

# Create a .nojekyll file to prevent GitHub Pages from processing with Jekyll
echo "⚙️  Creating .nojekyll file..."
touch gh-pages/.nojekyll

echo "✅ Build complete! gh-pages folder is ready for deployment."
echo "📦 Contents:"
ls -lh gh-pages/

echo ""
echo "🚀 To test locally, run:"
echo "   cd gh-pages && python3 -m http.server 8080"
