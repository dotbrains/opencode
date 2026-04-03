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
### Fallback: linear-cli (when MCP auth is blocked)
If your workspace blocks Linear MCP authentication or installation, you can still use Linear in OpenCode through local slash commands powered by `@dotbrains/linear-cli`.
#### 1) Install linear-cli
```bash
npm config set @dotbrains:registry https://npm.pkg.github.com
npm config set //npm.pkg.github.com/:_authToken $(gh auth token)
npm install -g @dotbrains/linear-cli
```
#### 2) Configure credentials
```bash
linear init
```
This creates `~/.config/linear/config.json` with your Linear API key.
#### 3) Use the fallback slash commands
Two commands are included in `command/`:
- `/linear-search <term>` → runs `linear search "<term>"`
- `/linear-issue <id-or-identifier>` → runs `linear issue "<id-or-identifier>"`
Example:
```text
/linear-search auth bug
/linear-issue ENG-123
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
### Fallback: notion-cli (when MCP auth is blocked)
If your workspace blocks Notion MCP installation (for example, approved-connections restrictions), you can still use Notion in OpenCode through local slash commands powered by `@dotbrains/notion-cli`.
#### 1) Install notion-cli
```bash
npm config set @dotbrains:registry https://npm.pkg.github.com
npm config set //npm.pkg.github.com/:_authToken $(gh auth token)
npm install -g @dotbrains/notion-cli
```
#### 2) Configure credentials
```bash
notion init
```
This creates `~/.config/notion/config.json` with your Notion credentials.
#### 3) Use the fallback slash commands
Two commands are included in `command/`:
- `/notion-search <query>` → runs `notion search "<query>" --json --limit 20`
- `/notion-page <page-id>` → runs `notion page "<page-id>" --json`
Example:
```text
/notion-search onboarding checklist
/notion-page 01234567-89ab-cdef-0123-456789abcdef
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

## Superpowers

**Repository:** [obra/superpowers](https://github.com/obra/superpowers)

Superpowers is a complete software development workflow for AI coding agents. It provides a composable set of "skills" that trigger automatically based on context.

### Core Workflow

1. **brainstorming** - Activates before writing code. Refines ideas through questions, presents design in chunks.
2. **writing-plans** - Breaks work into bite-sized tasks with exact file paths and verification steps.
3. **subagent-driven-development** - Dispatches subagents per task with two-stage review.
4. **test-driven-development** - Enforces RED-GREEN-REFACTOR cycle.
5. **requesting-code-review** - Reviews against plan, reports issues by severity.

### Skills Library

- `brainstorming` - Socratic design refinement
- `writing-plans` - Detailed implementation plans
- `subagent-driven-development` - Fast iteration with review
- `test-driven-development` - RED-GREEN-REFACTOR cycle
- `systematic-debugging` - 4-phase root cause process
- And more...

### Installation

The plugin is configured in `opencode.json`:

```json
{
  "plugin": ["superpowers@git+https://github.com/obra/superpowers.git"]
}
```

Restart OpenCode to load the plugin.

### Usage

```
use skill tool to load superpowers/brainstorming
```

Verify by asking: "Tell me about your superpowers"

## Get Shit Done (GSD)

**Repository:** [gsd-build/get-shit-done](https://github.com/gsd-build/get-shit-done)

A meta-prompting, context engineering, and spec-driven development system that solves context rot — the quality degradation that happens as AI fills its context window.

### Core Workflow

1. **`/gsd:new-project`** - Full initialization: questions → research → requirements → roadmap
2. **`/gsd:discuss-phase [N]`** - Capture implementation decisions before planning
3. **`/gsd:plan-phase [N]`** - Research + plan + verify for a phase
4. **`/gsd:execute-phase [N]`** - Execute all plans in parallel waves
5. **`/gsd:verify-work [N]`** - Manual user acceptance testing
6. **`/gsd:ship [N]`** - Create PR from verified phase work

### Key Commands

| Command | Description |
|---------|-------------|
| `/gsd-new-project` | Initialize new project with full workflow |
| `/gsd-quick` | Fast ad-hoc task execution |
| `/gsd-map-codebase` | Analyze existing codebase |
| `/gsd-discuss-phase` | Capture implementation decisions |
| `/gsd-plan-phase` | Research and plan phase |
| `/gsd-execute-phase` | Execute plans in waves |
| `/gsd-verify-work` | User acceptance testing |
| `/gsd-ship` | Create PR from verified work |
| `/gsd-progress` | Where am I? What's next? |
| `/gsd-help` | Show all commands |

### Installation

GSD commands are included in this repository under `command/`. They were installed via:

```bash
npx get-shit-done-cc@latest --opencode --global
```

### Usage

```
/gsd-help
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
