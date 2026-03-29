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

- `opencode.json` - Core opencode settings
- `tui.json` - Terminal UI preferences
- `agent/` - Agent configuration (assembled from shared + frontmatter)
- `command/` - Command definitions
- `skills/` - Skill configuration (assembled from shared + frontmatter)
- `shared/` - Shared AI config submodule ([dotbrains/shared-ai-config](https://github.com/dotbrains/shared-ai-config))
- `frontmatter/` - OpenCode-specific YAML frontmatter for agents and skills

## Install This Config

The contents of this repository should be placed in your `$HOME/.config`.

```bash
git clone --recursive https://github.com/dotbrains/opencode.git $HOME/.config/opencode
```

## Shared Agent Definitions

Agent and skill body content is shared with [Claude Code](https://github.com/dotbrains/claude) via the [shared-ai-config](https://github.com/dotbrains/shared-ai-config) submodule. To update after shared content changes:

```bash
git submodule update --remote shared
./shared/assemble.sh opencode
```

## License

This project is licensed under the [PolyForm Shield License 1.0.0](https://polyformproject.org/licenses/shield/1.0.0/) -- see [LICENSE](LICENSE) for details.
