---
name: mt-lookup
description: >-
  Run a quick exploration/lookup using the engineering team.
  Use for understanding code, answering questions about the codebase.
---

# Multi-Team Lookup

Runs a quick exploration to answer questions about the codebase.

## When to Use This Skill

Invoke when the user says things like:
- "what does this do?"
- "how does X work?"
- "explain this code"
- "find where X is defined"
- "show me the code for X"
- "what files are involved in X?"

## Workflow

### Step 1 — Direct Answer (if possible)

For simple questions, try to answer directly using your tools:
- Read relevant files
- Grep for patterns
- Find definitions

If you can answer confidently, do so directly.

### Step 2 — Delegate to Appropriate Worker

If direct exploration isn't enough, dispatch to the relevant worker:

**For code structure questions** — `@frontend-dev` or `@backend-dev`:

```
Explore the codebase to answer: [QUESTION]

Look in relevant directories, find the relevant code, and explain:
- What the code does
- How it works
- Any important patterns or conventions
```

**For architecture questions** — `@planning-lead`:

```
Analyze this architecture question: [QUESTION]

Explain the current architecture, patterns used, and how components interact.
```

### Step 3 — Synthesize and Answer

Present the answer clearly:
- Direct answer to the question
- Supporting evidence (file paths, code snippets)
- Any caveats or limitations

## Rules

- **Be concise** — don't over-explain
- **Be accurate** — verify your understanding
- **Show evidence** — point to specific code
- **Admit uncertainty** — if you're not sure, say so
- **Worktree optional** — quick lookups don't need isolation

## Examples

| Question | Approach |
|----------|-----------|
| "What does auth middleware do?" | Read the middleware file, summarize |
| "How are users stored?" | Find user model, explain schema |
| "Where is the API defined?" | Grep for route definitions |
| "What pattern does this use?" | Analyze code, identify patterns |
