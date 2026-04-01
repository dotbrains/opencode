# Plugins

This document lists the external MCP servers and plugins used by this OpenCode configuration.

## Linear

**Type:** Remote MCP (OAuth)

Linear's official MCP server for issue tracking, project management, and team workflows.

- **URL:** `https://mcp.linear.app/mcp`
- **Auth:** Run `opencode mcp auth linear` to complete the browser-based OAuth flow

### Verify

```
opencode mcp list
```

## Notion

**Type:** Remote MCP (OAuth)

Notion's official hosted MCP server for reading and writing workspace content.

- **URL:** `https://mcp.notion.com/mcp`
- **Auth:** Run `opencode mcp auth notion` to complete the browser-based OAuth flow

### Verify

```
opencode mcp list
```

## context-mode

**Repository:** [mksglu/context-mode](https://github.com/mksglu/context-mode)

Context Mode is an MCP server that keeps raw tool output out of your context window and tracks session state in SQLite for continuity across compactions.

- **MCP tools:** `ctx_batch_execute`, `ctx_execute`, `ctx_execute_file`, `ctx_index`, `ctx_search`, `ctx_fetch_and_index`
- **Plugin hooks:** `tool.execute.before`, `tool.execute.after`, `experimental.session.compacting`

### Prerequisites

- Node.js 18+

### Install

Install context-mode globally:

```bash
npm install -g context-mode
```

The `opencode.json` in this repo already registers context-mode as both an MCP server and a plugin. After installing the npm package and cloning this config, restart OpenCode.

### Verify

In an OpenCode session, run:

```
ctx doctor
```

All checks should pass. You can also run `ctx stats` to see context savings.

### Upgrade

```bash
npm update -g context-mode
```

Or from within OpenCode:

```
ctx upgrade
```
