#!/bin/bash

# Claude MCP Servers Setup Script
# This script installs and configures MCP (Model Context Protocol) servers for Claude Code

echo "🔧 Installing Claude MCP servers (latest versions)…"
echo ""

# Sequential Thinking — Claude's chain-of-thought engine
echo "📦 Installing Sequential Thinking server..."
claude mcp add sequential-thinking -s user \
  -- npx -y @modelcontextprotocol/server-sequential-thinking || true

# Playwright — modern multi-browser automation
echo "📦 Installing Playwright server..."
claude mcp add playwright -s user \
  -- npx -y @playwright/mcp-server || true

# Puppeteer — Chrome-only (legacy but still functional)
echo "📦 Installing Puppeteer server..."
claude mcp add puppeteer -s user \
  -- npx -y @modelcontextprotocol/server-puppeteer || true

# Fetch — enhanced HTTP client with image fetching capabilities
echo "📦 Installing Fetch server..."
claude mcp add fetch -s user \
  -- npx -y @kazuph/mcp-fetch || true

# Browser-Tools — DevTools logs, screenshots, debugging
echo "📦 Installing Browser-Tools server..."
claude mcp add browser-tools -s user \
  -- npx -y @agentdeskai/browser-tools-mcp || true

# Memory — persistent context storage for Claude
echo "📦 Installing Memory server..."
claude mcp add mcp-memory -s user \
  -- npx -y mcp-memory || true

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ MCP server registration complete!"
echo ""
echo "🔴 IMPORTANT: To enable Browser-Tools functionality:"
echo "   Run this in a SEPARATE terminal and keep it running:"
echo "   npx -y @agentdeskai/browser-tools-server"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Installed MCP servers:"
claude mcp list