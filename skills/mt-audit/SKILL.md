---
name: mt-audit
description: >-
  Run a deep security audit using the validation team with security focus.
  Use for vulnerability scanning, penetration testing, and security reviews.
---

# Multi-Team Security Audit

Runs a comprehensive security audit with focused validation team.

## When to Use This Skill

Invoke when the user says things like:
- "security audit"
- "check for vulnerabilities"
- "is this secure?"
- "penetration test"
- "security review"
- "vulnerability scan"

## Workflow

### Step 0 — Create Worktree

Create an isolated worktree for this audit:

```bash
# Detect project and create audit branch
project=$(basename "$(git rev-parse --show-toplevel)")
branch="audit/$(echo -e "$TARGET" | head -c 30 | tr ' ' '-' | tr '[:upper:]' '[:lower:]')"

# Create worktree in global location
mkdir -p "~/.config/superpowers/worktrees/$project"
git worktree add "~/.config/superpowers/worktrees/$project/$branch" -b "$branch"

# Navigate to worktree
cd "~/.config/superpowers/worktrees/$project/$branch"
```

**All subsequent steps operate in this worktree.**

### Step 1 — Clarify Scope

Determine what to audit:
- Specific files/modules
- Authentication/authorization
- API endpoints
- Dependencies
- Full codebase

### Step 2 — Delegate to Validation Lead (Security Focus)

Dispatch to `@validation-lead` with:

```
Perform a deep security audit of [TARGET].

Focus on:
- Authentication and authorization
- Input validation and sanitization
- Data protection (encryption, PII)
- Dependency vulnerabilities
- Common vulnerabilities (OWASP Top 10)

Delegate to security-reviewer for vulnerability scanning and analysis.
Return a consolidated security report with severity ratings.
```

### Step 3 — Reviewer Code Quality

Also dispatch to `@reviewer` for code quality check:

```
Review [TARGET] specifically for security-related code patterns:
- Hardcoded credentials
- SQL injection vectors
- XSS vulnerabilities
- Insecure error handling
- Missing validation

Return findings with severity ratings.
```

### Step 4 — Synthesize Security Report

Combine both reports into a security assessment:

1. **Critical** - Immediate action required
2. **High** - Fix before production
3. **Medium** - Address when possible
4. **Low** - Consider fixing
5. **Info** - No immediate risk

For each finding, include:
- Description
- Severity
- Location (file/line)
- Remediation suggestion

## Security Checklist

The audit should check:

- [ ] Authentication mechanisms
- [ ] Authorization controls
- [ ] Input validation
- [ ] Output encoding
- [ ] Database queries (SQL injection)
- [ ] Session management
- [ ] Cryptography usage
- [ ] Error handling (no info leaks)
- [ ] Dependencies (known CVEs)
- [ ] Secrets management

## Rules

- **Don't minimize** — if it's a risk, report it
- **Be specific** — point to exact locations
- **Provide fixes** — don't just criticize
- **Consider context** — some issues are acceptable with mitigations
- **Create worktree first** — always isolate before audit
- **Cleanup after completion** — remove worktree when done

## Cleanup

After audit completes:

```
To remove worktree:
  project=$(basename "$(git rev-parse --show-toplevel)")
  git worktree remove "~/.config/superpowers/worktrees/$project/audit-*"
  git branch -d "audit-*"
```
