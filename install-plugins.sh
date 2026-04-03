#!/bin/bash
set -e

# Install plugins for opencode configuration

echo "Installing opencode plugins..."

# Check for npm
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed"
    exit 1
fi

# context-mode - MCP server and plugin
echo "Installing context-mode..."
npm install -g context-mode

# linear-cli - fallback for Linear (requires GitHub registry)
echo "Installing linear-cli..."
npm config set @dotbrains:registry https://npm.pkg.github.com
npm config set //npm.pkg.github.com/:_authToken "$(gh auth token)" 2>/dev/null || true
npm install -g @dotbrains/linear-cli

# notion-cli - fallback for Notion (requires GitHub registry)
echo "Installing notion-cli..."
npm install -g @dotbrains/notion-cli

echo ""
echo "Done! Restart opencode to load the plugins."
echo ""
echo "Verify with:"
echo "  opencode mcp list"
echo "  ctx doctor"
