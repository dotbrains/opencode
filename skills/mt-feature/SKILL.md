---
name: mt-feature
description: >-
  Run the full multi-team lifecycle: planning → engineering → validation.
  Use for new features that need architecture, implementation, and validation.
---

# Multi-Team Feature

Runs the complete three-tier workflow: planning, engineering, and validation.

## When to Use This Skill

Invoke when the user says things like:
- "build a feature"
- "add new functionality"
- "implement something"
- "create a new component"
- "build me a system"

## Workflow

### Step 0 — Create Worktree

Before starting, create an isolated worktree for this feature:

```bash
# Detect project and create feature worktree
project=$(basename "$(git rev-parse --show-toplevel)")
branch="feature/$(echo -e "$USER_REQUEST" | head -c 50 | tr ' ' '-' | tr '[:upper:]' '[:lower:]')"

# Create worktree in global location
mkdir -p "~/.config/superpowers/worktrees/$project"
git worktree add "~/.config/superpowers/worktrees/$project/$branch" -b "$branch"

# Navigate to worktree
cd "~/.config/superpowers/worktrees/$project/$branch"
```

**All subsequent steps operate in this worktree.**

### Step 1 — Delegate to Planning Lead

Analyze the request and inject relevant skills:

```
IF request is vague/creative → Start with brainstorming skill

Coordinate your team to create an implementation plan for: [USER'S REQUEST]

Steps:
1. If requirements unclear, use brainstorming skill first to explore idea
2. Have planning-agent create an architecture/design
3. Have plan-reviewer critique the plan
4. Return the finalized plan with review feedback
```

**Skill injection tips:**
- "Build me X" or "Create Y" → inject brainstorming before planning
- Complex system → inject planning-and-task-breakdown after initial plan

### Step 2 — Delegate to Engineering Lead

Once planning is complete, inject relevant implementation skills:

```
Based on this plan, coordinate your engineering team to implement: [USER'S REQUEST]

Use the plan from planning-lead as your guide.
Delegate to frontend-dev, backend-dev, or devops-specialist as needed.

**Skill injection:**
- For new code: "Use test-driven-development skill — write tests first"
- For complex logic: "Use systematic-debugging if issues arise"
- For security-sensitive code: "Apply security-and-hardening skill"

Return the implementation results with files modified.
```

### Step 3 — Delegate to Validation Lead

After engineering is complete, inject review skills:

```
Validate this implementation for correctness, security, and quality: [ENGINEERING OUTPUT]

**Skill injection:**
- "Use code-review-and-quality for multi-axis review"
- "Use security-and-hardening for auth/data handling review"

Delegate to:
- reviewer for code quality
- security-reviewer for security audit
- qa-engineer for test coverage

Return a consolidated validation report with pass/fail status.
```

### Step 4 — Synthesize and Report

Combine the results from all three teams into a coherent summary:

1. **What was planned** - architecture decisions
2. **What was built** - implementation results
3. **What was validated** - validation findings
4. **Status** - approved, changes requested, or blocked

## Rules

- **Never skip teams** — all three tiers should run for new features
- **Wait for each team** — don't start engineering until planning is done
- **Report blockers** — if any team fails, explain what needs attention
- **Synthesize, don't just relay** — combine outputs into narrative
- **Create worktree first** — always isolate before delegating
- **Cleanup after completion** — merge or remove worktree when done
- **Inject skills dynamically** — add relevant skills to delegations based on task context

## Dynamic Skill Injection

The orchestrator can inject skills into each delegation based on the task:

| Task Context | Skill to Inject |
|--------------|-----------------|
| Vague requirements | brainstorming |
| Complex system | planning-and-task-breakdown |
| New implementation | test-driven-development |
| Bug investigation | systematic-debugging |
| Security-sensitive code | security-and-hardening |
| Hard-to-read code | code-simplification |
| Pre-merge review | code-review-and-quality |
| Completion/merge | finishing-a-development-branch |

Example injection in delegation:
```
"Implement feature X. Use test-driven-development skill for 
the core logic — write tests first, then implementation."
```

## Cleanup

After validation completes:

```
To merge the feature branch to main:
  cd "~/.config/superpowers/worktrees/$project/$branch"
  git checkout main
  git merge "$branch"
  git push origin main

To remove worktree (if not merging):
  git worktree remove "~/.config/superpowers/worktrees/$project/$branch"
  git branch -d "$branch"
```
