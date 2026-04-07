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

## Dynamic Skill Injection

The orchestrator can dynamically inject relevant skills into subagent delegations based on task context. This makes workflows smarter by providing the right tool for the job.

### Configuration

Skill injection is configured in `orchestrator.yaml`:

```yaml
skill-injection:
  triggers:
    "build me": brainstorming
    "fix": systematic-debugging
    "security": security-and-hardening
    # ... more triggers
    
  workflow-defaults:
    new-feature:
      - brainstorming
      - writing-plans
      - test-driven-development
      - code-review-and-quality
      - finishing-a-development-branch
```

### Available Skills

| Skill | When to Use |
|-------|-------------|
| `brainstorming` | User has vague/creative idea, needs design before implementation |
| `test-driven-development` | Implementing new feature, tests should drive code |
| `systematic-debugging` | Investigating bug, root cause unclear |
| `security-and-hardening` | Handling user input, auth, data, or external integrations |
| `code-simplification` | Code works but is hard to read/maintain |
| `code-review-and-quality` | Need multi-axis review before merge |
| `planning-and-task-breakdown` | Have spec, need to break into tasks |
| `execution-plans` | Have implementation plan, need to execute |
| `finishing-a-development-branch` | Work complete, need to merge/PR/cleanup |
| `dispatching-parallel-agents` | 2+ independent tasks that can run concurrently |

### Skill Injection Patterns

**1. Detect trigger conditions:**
```
IF user request contains [vague requirements] → inject brainstorming
IF task involves [security-sensitive code] → inject security-and-hardening
IF implementation plan exists → inject executing-plans
```

**2. Inject via delegation prompt:**
```
Delegate to @engineering-lead with:

"Implement feature X. Use test-driven-development skill for the 
core logic — write tests first, then implementation."

OR

"Debug issue Y. Follow systematic-debugging skill — 
hypothesize, test, iterate until root cause found."
```

**3. Chain skills appropriately:**
```
Brainstorming → writing-plans → executing-plans → code-review-and-quality → finishing-a-development-branch
```

### Example: Smart Delegation

```
User: "Build me a cool user dashboard with charts and notifications"

Analysis:
- "Build" + "vague requirement" → inject brainstorming first
- Delegate to planning-lead: "Use brainstorming skill to explore 
  this idea with the user, create a spec, then invoke writing-plans"

After spec is ready:
- Delegate to engineering-lead: "Execute this spec. Use 
  test-driven-development for the core components."

After implementation:
- Delegate to validation-lead: "Use code-review-and-quality to 
  review before merge"

After approval:
- Use finishing-a-development-branch to merge and cleanup
```

### Rules for Dynamic Skills

- **Match to intent, not just keywords** — "fix this" might need debugging OR simple fix
- **Don't over-inject** — one relevant skill is better than three marginal ones
- **Let subagent execute** — delegate the skill, don't run it yourself
- **Chain properly** — some skills are prerequisites (brainstorming before writing-plans)
