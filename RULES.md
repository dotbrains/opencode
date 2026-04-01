# Rules

This document lists the instruction files loaded by OpenCode via the `instructions` config key in `opencode.json`.

## How It Works

OpenCode supports the `instructions` array, which takes paths (or globs) to markdown files. These files are injected into the agent's system prompt, giving them the highest priority over tool prompts and other instructions.

```json
{
  "instructions": ["rules/no-coauthor.md"]
}
```

Paths are relative to the `~/.config/opencode/` directory.

## Active Rules

### `rules/no-coauthor.md`

Prevents the agent from adding Co-Authored-By or AI attribution lines to git commits.

- Blocks `Co-Authored-By: opencode <noreply@opencode.ai>`
- Blocks `🤖 Generated with [opencode](https://opencode.ai)` footers
- Commits are written as if by a human developer

**Why:** The bash tool prompt instructs the agent to append these lines by default. This rule overrides that behavior. See upstream issue [#919](https://github.com/sst/opencode/issues/919) for a native config option.

## Adding New Rules

1. Create a markdown file in `rules/`:

   ```
   rules/my-rule.md
   ```

2. Write clear, imperative instructions:

   ```markdown
   # My Rule

   When doing X, you MUST do Y.

   - Constraint A
   - Constraint B
   ```

3. Add the path to `instructions` in `opencode.json`:

   ```json
   {
     "instructions": [
       "rules/no-coauthor.md",
       "rules/my-rule.md"
     ]
   }
   ```

Rule files are evaluated in order. Later rules can reference or override earlier ones if they address the same behavior.
