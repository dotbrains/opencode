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

# superpowers - Complete software development workflow
# Already configured in opencode.json via plugin array
echo "superpowers is configured in opencode.json (no install needed)"

# get-shit-done - GSD workflow system
echo "Installing get-shit-done..."
npx get-shit-done-cc@latest --opencode --global

# ntn - Official Notion CLI, fallback for Notion when MCP auth is blocked
echo "Installing ntn (official Notion CLI)..."
npm install -g ntn
echo "Run 'ntn login' to authorize your Notion workspace."

echo ""
echo "Done! Restart opencode to load the plugins."
echo ""
echo "Verify with:"
echo "  opencode mcp list"
echo "  ctx doctor"
