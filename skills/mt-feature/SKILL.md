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

### Step 1 — Delegate to Planning Lead

Dispatch to `@planning-lead` with:

```
Coordinate your team to create an implementation plan for: [USER'S REQUEST]

Steps:
1. Have planning-agent create an architecture/design
2. Have plan-reviewer critique the plan
3. Return the finalized plan with review feedback
```

### Step 2 — Delegate to Engineering Lead

Once planning is complete, dispatch to `@engineering-lead` with:

```
Based on this plan, coordinate your engineering team to implement: [USER'S REQUEST]

Use the plan from planning-lead as your guide.
Delegate to frontend-dev, backend-dev, or devops-specialist as needed.
Return the implementation results with files modified.
```

### Step 3 — Delegate to Validation Lead

After engineering is complete, dispatch to `@validation-lead` with:

```
Validate this implementation for correctness, security, and quality: [ENGINEERING OUTPUT]

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
