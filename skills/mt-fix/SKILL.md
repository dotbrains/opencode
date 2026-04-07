---
name: mt-fix
description: >-
  Run a bug fix workflow: engineering to fix, then validation to verify.
  Use for fixing bugs, errors, or broken functionality.
---

# Multi-Team Bug Fix

Runs engineering to fix the bug, then validation to verify the fix.

## When to Use This Skill

Invoke when the user says things like:
- "fix this bug"
- "fix the error"
- "it's not working"
- "broken"
- "debug this"
- "investigate and fix"

## Workflow

### Step 0 — Create Worktree

Create an isolated worktree for this fix:

```bash
# Detect project and create fix branch
project=$(basename "$(git rev-parse --show-toplevel)")
branch="fix/$(echo -e "$BUG_DESCRIPTION" | head -c 50 | tr ' ' '-' | tr '[:upper:]' '[:lower:]')"

# Create worktree in global location
mkdir -p "~/.config/superpowers/worktrees/$project"
git worktree add "~/.config/superpowers/worktrees/$project/$branch" -b "$branch"

# Navigate to worktree
cd "~/.config/superpowers/worktrees/$project/$branch"
```

**All subsequent steps operate in this worktree.**

### Step 1 — Investigate

First, understand the problem:
- What behavior is expected?
- What actually happens?
- Any error messages?
- Recent changes that might have caused this?

### Step 2 — Delegate to Engineering Lead

Inject debugging skill for root cause analysis:

```
Fix this bug: [BUG DESCRIPTION]

**Skill injection:** Use systematic-debugging skill to investigate:
- Form hypothesis about root cause
- Design test to verify
- Iterate until root cause found
- Then implement fix

Investigate the root cause, then implement a fix.
Delegate to frontend-dev or backend-dev as appropriate.

Steps:
1. Reproduce the bug if possible
2. Identify the root cause (use systematic-debugging)
3. Implement the fix
4. Verify the fix works

Return:
- Root cause found
- Fix implemented
- Files modified
- Verification steps
```

### Step 3 — Delegate to Validation Lead

After the fix is implemented, inject verification skill:

```
Verify this bug fix: [BUG DESCRIPTION]

The engineering team has implemented a fix:
[ENGINEERING RESULTS]

**Skill injection:** Use verification-before-completion skill to:
- Confirm original bug is fixed
- Check for regressions
- Verify test coverage

Verify:
1. The original bug is fixed
2. No regressions introduced
3. Test coverage is adequate
4. Code quality is acceptable

Return: Pass/Fail with any remaining issues.
```

### Step 4 — Report Status

Present the fix results:

1. **Root Cause** - What was the problem?
2. **Fix Applied** - What was changed?
3. **Verification** - Did the fix work?
4. **Status** - Fixed or needs more work

## Rules

- **Don't assume** — investigate before fixing
- **Verify the fix** — don't just claim it's fixed
- **Check for regressions** — ensure the fix didn't break something else
- **Report honestly** — if the fix didn't work, say so
- **Create worktree first** — always isolate before fixing
- **Cleanup after completion** — merge or remove worktree when done

## Cleanup

After validation completes:

```
To merge the fix branch to main:
  cd "~/.config/superpowers/worktrees/$project/$branch"
  git checkout main
  git merge "$branch"
  git push origin main

To remove worktree (if not merging):
  git worktree remove "~/.config/superpowers/worktrees/$project/$branch"
  git branch -d "$branch"
```

## Bug Report Template

When reporting a bug, include:
- Expected behavior
- Actual behavior
- Steps to reproduce
- Error messages (if any)
- Environment/context
