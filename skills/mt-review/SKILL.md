---
name: mt-review
description: >-
  Run a quick code review using the validation team.
  Use for reviewing changes, PRs, or specific files.
---

# Multi-Team Review

Runs a focused code review using the validation team.

## When to Use This Skill

Invoke when the user says things like:
- "review this code"
- "check this PR"
- "review the changes"
- "look at this implementation"
- "code review"
- "review my code"

## Workflow

### Step 1 — Identify What to Review

Clarify what needs review:
- Specific files/directories
- A PR or branch
- Recent changes
- The user's current working context

### Step 2 — Delegate to Validation Lead

Dispatch to `@validation-lead` with:

```
Review [TARGET] for code quality, style, security, and test coverage.

Delegate to:
- reviewer: Check code quality, style consistency, best practices
- security-reviewer: Check for security vulnerabilities
- qa-engineer: Check test coverage and edge cases

Return a consolidated review with:
- Overall assessment: Approved / Changes Requested
- Issues found (severity: blocker/major/minor)
- Suggested fixes
```

### Step 3 — Report Findings

Present the review results clearly:

1. **Overall Status** - Approved or Changes Requested
2. **Blockers** - Must fix before merge
3. **Major Issues** - Should fix before merge
4. **Minor Issues** - Suggestions for improvement

## Rules

- **Be specific** — know exactly what you're reviewing
- **Don't approve** code you haven't had reviewed
- **Report honestly** — minor issues are still worth reporting
- **Provide fixes** — where possible, suggest how to fix issues

## Severity Guide

| Severity | Definition | Action Required |
|----------|------------|-----------------|
| Blocker | Bug, security risk, breaking change | Must fix before approval |
| Major | Significant issue, potential bug | Should fix before approval |
| Minor | Style, readability, optimization | Suggested, optional |
| Info | FYI, note | No action needed |
