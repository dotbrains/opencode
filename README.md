# opencode

[![License: PolyForm Shield 1.0.0](https://img.shields.io/badge/License-PolyForm%20Shield%201.0.0-blue.svg)](https://polyformproject.org/licenses/shield/1.0.0/)

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
- `shared/` - Shared AI config submodule ([dotbrains/shared-ai-config](https://github.com/dotbrains/shared-ai-config))
- `frontmatter/` - OpenCode-specific YAML frontmatter for agents and skills
- `rules/` - Instruction files loaded as system-level rules
- `PLUGINS.md` - External MCP servers and plugins ([details](PLUGINS.md))
- `RULES.md` - Rule definitions and usage ([details](RULES.md))
- `expertise/` - Domain knowledge for multi-team agents
- `teams.yaml`, `orchestrator.yaml`, `agent-chain.yaml` - Multi-team configuration

## Install This Config

The contents of this repository should be placed in your `$HOME/.config`.

```bash
git clone --recursive https://github.com/dotbrains/opencode.git $HOME/.config/opencode
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
- `@dotbrains/linear-cli` - Fallback CLI for Linear
- `@dotbrains/notion-cli` - Fallback CLI for Notion

## Shared Agent Definitions

Agent and skill body content is shared with [Claude Code](https://github.com/dotbrains/claude) via the [shared-ai-config](https://github.com/dotbrains/shared-ai-config) submodule. To update after shared content changes:

```bash
git submodule update --remote shared
./shared/assemble.sh opencode
```

## Fallback Commands (Notion + Linear)

If your workspace blocks MCP OAuth flows, this config includes local fallback slash commands:

- Notion: `command/notion-search.md`, `command/notion-page.md` (powered by `@dotbrains/notion-cli`)
- Linear: `command/linear-search.md`, `command/linear-issue.md` (powered by `@dotbrains/linear-cli`)

Setup and usage instructions are documented in `PLUGINS.md` under:

- **Linear → Fallback: linear-cli (when MCP auth is blocked)**
- **Notion → Fallback: notion-cli (when MCP auth is blocked)**

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

1. Select `orchestrator-lead` as your agent
2. Just type your request

The orchestrator will route to the appropriate teams:

| Request Type | Flow |
|--------------|------|
| New feature | Planning → Engineering → Validation |
| Bug fix | Engineering → Validation |
| Code review | Validation only |
| Architecture | Planning only |
| Security audit | Validation (security focus) |

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

This project is licensed under the [PolyForm Shield License 1.0.0](https://polyformproject.org/licenses/shield/1.0.0/) -- see [LICENSE](LICENSE) for details.
