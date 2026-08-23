# opencode

[![License: PolyForm Shield 1.0.0](https://img.shields.io/badge/License-PolyForm%20Shield%201.0.0-blue.svg)](https://polyformproject.org/licenses/shield/1.0.0)

This repository contains my sensible defaults for opencode.

## Upstream Project

- https://github.com/anomalyco/opencode

## Install opencode

```bash
curl -fsSL https://opencode.ai/install | bash
```

Or with Homebrew:

```bash
brew install anomalyco/tap/opencode
```

## Contents

- `opencode.json` - Core opencode settings (includes MCP servers and plugins)
- `tui.json` - Terminal UI preferences
- `agent/` - Agent configuration (assembled from shared + frontmatter)
- `command/` - Command definitions
- `skills/` - Skill configuration (assembled from shared + frontmatter)
- `shared/` - Shared AI config submodule ([smeltery/shared-ai-config](https://github.com/smeltery/shared-ai-config))
- `frontmatter/` - OpenCode-specific YAML frontmatter for agents and skills
- `rules/` - Instruction files loaded as system-level rules
- `PLUGINS.md` - External MCP servers and plugins ([details](PLUGINS.md))
- `RULES.md` - Rule definitions and usage ([details](RULES.md))
- `expertise/` - Domain knowledge for multi-team agents
- `teams.yaml`, `orchestrator.yaml`, `agent-chain.yaml` - Multi-team configuration

## Install This Config

The contents of this repository should be placed in your `$HOME/.config`.

```bash
git clone --recursive https://github.com/smeltery/opencode.git $HOME/.config/opencode
```

### Install Plugins

After cloning, run the plugin installation script:

```bash
./install-plugins.sh
```

This installs:
- `context-mode` - MCP server for context management
- `superpowers` - Complete software development workflow (via plugin in opencode.json)
- `get-shit-done` - GSD workflow system (via npx)
- [`ntn`](https://developers.notion.com/cli/get-started/overview) - Official Notion CLI, fallback for Notion

## Shared Agent Definitions

Agent and skill body content is shared with [Claude Code](https://github.com/smeltery/claude) via the [shared-ai-config](https://github.com/smeltery/shared-ai-config) submodule. To update after shared content changes:

```bash
git submodule update --remote shared
./shared/assemble.sh opencode
```

## Fallback Commands (Notion)

If your workspace blocks MCP OAuth flows, this config includes local fallback slash commands:

- Notion: `command/notion-search.md`, `command/notion-page.md` (powered by [`ntn`](https://developers.notion.com/cli/get-started/overview), the official Notion CLI)

Setup and usage instructions are documented in `PLUGINS.md` under:

- **Notion CLI (ntn)**

## Multi-Team Orchestration

This config includes a three-tier multi-team system for opencode. Based on [IndyDevDan's "One Agent Is NOT ENOUGH"](https://www.youtube.com/watch?v=M30gp1315Y4).

### Architecture

```
Orchestrator Lead
├── Planning Team (HIGH tier)
│   └── planning-lead → planning-agent + plan-reviewer
├── Engineering Team (MEDIUM tier)
│   └── engineering-lead → frontend-dev + backend-dev + devops-specialist
└── Validation Team (MEDIUM tier)
    └── validation-lead → reviewer + security-reviewer + qa-engineer
```

### Model Tiers

| Tier | Model | Use For |
|------|-------|---------|
| HIGH | minimax-m2.5-free | Orchestrator, Planning, Architecture |
| MEDIUM | minimax-m2.5-free | Engineering, Validation, Code Review |

### Usage

By default, OpenCode now starts with `orchestrator` as the primary agent. This agent coordinates the multi-team system:

| Request Type | Flow |
|--------------|------|
| New feature | Planning → Engineering → Validation |
| Bug fix | Engineering → Validation |
| Code review | Validation only |
| Architecture | Planning only |
| Security audit | Validation (security focus) |

You can also switch agents using the **Tab** key to cycle between primary agents.

### Skills

You can also invoke skills directly using the skill tool:

- `@mt-feature` — Full lifecycle for new features
- `@mt-review` — Quick code review
- `@mt-audit` — Deep security audit
- `@mt-fix` — Bug fix workflow
- `@mt-lookup` — Code exploration/understanding

### Configuration Files

- `teams.yaml` - Team member definitions
- `orchestrator.yaml` - Routing rules, model tiers, team configs
- `agent-chain.yaml` - Sequential pipelines
- `expertise/` - Domain knowledge per team

For detailed documentation, see:
- [MULTI-TEAM.md](MULTI-TEAM.md) - Full system documentation
- [EXPERTISE.md](EXPERTISE.md) - Domain knowledge per team

## License

This project is licensed under the [PolyForm Shield License 1.0.0](https://polyformproject.org/licenses/shield/1.0.0) -- see [LICENSE](LICENSE) for details.
