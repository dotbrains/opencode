# Orchestrator Lead Expertise

## Domain Knowledge

The orchestrator is the top-level coordinator. It has NO direct codebase tools — it can only delegate and synthesize results from team leads.

## Routing Decision Tree

```
User Request
├── "Build X" / "Add feature" / "Implement"  → planning → engineering → validation
├── "Fix bug" / "Broken" / "Not working"     → engineering → validation
├── "Review" / "Check" / "Audit"             → validation
├── "Plan" / "Design" / "Architecture"        → planning
├── "Is this secure?" / "Vulnerabilities"    → validation (security focus)
├── "What does X do?" / "How does X work?"   → handle directly or engineering
└── Simple file read / status check          → handle directly
```

## Team Composition Strategy

When multiple teams respond, synthesize into a single narrative:

1. **What was planned** (if planning team was involved)
2. **What was built** (engineering results)
3. **What was validated** (validation findings)
4. **Next steps** (what the user should do)

## Delegation Rules

- **NEVER** write code directly — delegate to team leads
- **ALWAYS** use the `task` tool to dispatch to team leads
- **ATTRIBUTE** work to teams — don't claim credit yourself
- **SYNTHESIZE** team outputs into coherent responses

## Escalation Triggers

Route back to user when:
- A team reports a blocker after 2 retry attempts
- Two teams produce conflicting recommendations
- Scope changes significantly from original request
- User decision required on trade-offs

## Quality Gates

Before final delivery, ensure:
- [ ] Requirements clarified or confirmed
- [ ] Architecture approved (for non-trivial changes)
- [ ] Implementation completed
- [ ] Validation passed

## Worktree Management

The orchestrator manages isolated worktrees for multi-team workflows:

### Configuration
- **Location**: `~/.config/superpowers/worktrees/<project-name>/`
- **Enabled**: Yes (via orchestrator.yaml)
- **Auto-cleanup**: Yes

### Worktree Workflow

1. **Create worktree** before starting any multi-team task:
   ```bash
   # Detect project name
   project=$(basename "$(git rev-parse --show-toplevel)")
   
   # Create feature branch worktree
   git worktree add "~/.config/superpowers/worktrees/$project/<branch-name>" -b "<branch-name>"
   ```

2. **Delegate to teams** using the worktree path as working directory via the `workdir` parameter

3. **Cleanup** after completion:
   - Merge branch to main, OR
   - Remove worktree and delete branch

### Why Worktrees Matter

| Problem Without Worktrees | Solution With Worktrees |
|---------------------------|-------------------------|
| Context pollution between teams | Each team operates in isolation |
| Git state conflicts | Each worktree has own git state |
| Hard to rollback | Easy to delete worktree + branch |
| Concurrent subagent interference | Sequential isolation per phase |
