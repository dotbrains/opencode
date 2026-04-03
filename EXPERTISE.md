# Expertise Files

Domain knowledge loaded by multi-team agents. Each team has specialized expertise they reference when working.

## orchestrator-expertise.md

The orchestrator is the top-level coordinator. It has NO direct codebase tools — it can only delegate and synthesize.

### Routing Decision Tree

```
User Request
├── "Build X" / "Add feature" / "Implement"  → planning → engineering → validation
├── "Fix bug" / "Broken" / "Not working"     → engineering → validation
├── "Review" / "Check" / "Audit"             → validation
├── "Plan" / "Design" / "Architecture"       → planning
├── "Is this secure?" / "Vulnerabilities"   → validation (security focus)
├── "What does X do?" / "How does X work?"   → handle directly or engineering
└── Simple file read / status check          → handle directly
```

### Composition Strategy

When multiple teams respond, synthesize into a single narrative:

1. What was planned (if planning team was involved)
2. What was built (engineering results)
3. What was validated (validation findings)
4. Next steps (what the user should do)

### Delegation Rules

- NEVER write code directly — delegate to team leads
- ALWAYS use the `task` tool to dispatch to team leads
- ATTRIBUTE work to teams — don't claim credit yourself
- SYNTHESIZE team outputs into coherent responses

---

## planning-expertise.md

The planning team handles architecture, design patterns, and technical decision-making.

### When to Engage

- New feature requiring architecture decisions
- Refactoring affecting multiple components
- Technology selection or migration
- API design for new services
- Database schema changes

### Planning Output Format

Every plan should include:

1. **Executive Summary** (2-3 sentences)
   - What we're building and why
   - Key architectural decisions

2. **System Design**
   - Component boundaries and responsibilities
   - Data flow (use Mermaid diagrams)
   - API contracts if applicable

3. **Pattern Decisions**
   - Chosen patterns with justification
   - Alternatives considered and rejected

4. **Directory Structure**
   - Where new code lives
   - Module boundaries
   - Migration path (if refactoring)

5. **Risks & Trade-offs**
   - Known risks and mitigations
   - Explicit trade-offs made

6. **Open Questions**
   - Decisions requiring user input
   - Assumptions that need validation

### Architecture Patterns

| Pattern | Use When |
|---------|----------|
| Layered | Standard CRUD apps |
| Microservices | Scale needs, team autonomy |
| Event-driven | Async workflows, real-time |
| CQRS | Complex read/write patterns |
| Hexagonal | Heavy domain logic |
| Serverless | Variable load, low ops |

---

## engineering-expertise.md

The engineering team implements features across the full stack.

### Worker Responsibilities

#### Frontend Dev
- UI components and interactions
- Client-side state management
- Styling and accessibility
- API integration (client side)

#### Backend Dev
- API endpoints and contracts
- Database schema and queries
- Business logic and services
- Authentication/authorization

#### DevOps Specialist
- CI/CD pipelines
- Infrastructure as code
- Deployment configurations
- Environment management

### Patterns to Follow

**Before Writing Code:**
1. Scan existing code in the target area for conventions
2. Check imports for existing utilities to reuse
3. Review tests for testing patterns to match

**Code Quality:**
- Keep changes minimal and focused
- Match naming conventions of existing code
- Add clear comments for non-obvious logic
- Handle errors explicitly with context

### Frontend Specific

- Use existing component patterns
- Match CSS/styling system (Tailwind, modules, etc.)
- Ensure accessibility (aria labels, keyboard nav)
- Check browser compatibility for newer APIs

### Backend Specific

- Design RESTful APIs by default
- Use GraphQL only when schema-driven
- Prefer migrations over destructive changes
- Validate auth at middleware layer

---

## validation-expertise.md

The validation team ensures code quality, security, and test coverage.

### When to Engage

- Code review before merge
- Security audit requests
- Test coverage analysis
- Bug fix verification
- Pre-release quality gate
- Architecture review for security

### Validation Output Format

#### Code Review Findings
- Files reviewed
- Issues found (severity: blocker/major/minor)
- Suggestions for improvement
- Overall assessment: Approved / Changes Requested

#### Security Audit
- Vulnerabilities found (OWASP Top 10)
- Severity ratings (Critical/High/Medium/Low)
- Exploitability assessment
- Remediation recommendations

#### Test Coverage
- Coverage percentage
- Gaps identified
- Edge cases missed
- Recommendations for improvement

### Security Review Checklist

**Authentication & Authorization**
- [ ] Credentials not hardcoded
- [ ] Passwords properly hashed
- [ ] Sessions handled securely
- [ ] Authorization checks at API level

**Data Protection**
- [ ] Sensitive data encrypted at rest
- [ ] HTTPS enforced
- [ ] PII handled per compliance
- [ ] No secrets in logs

**Input Validation**
- [ ] All inputs validated
- [ ] SQL injection prevented
- [ ] XSS prevented
- [ ] CSRF tokens in place

**Dependencies**
- [ ] No known vulnerabilities in deps
- [ ] Dependencies up to date
- [ ] No deprecated packages

### Severity Ratings

| Rating | Definition | Action |
|--------|------------|--------|
| Blocker | Prevents merge | Must fix before approval |
| Major | Significant issue | Should fix before merge |
| Minor | Style/preference | Suggest fix, optional |
| Info | FYI | No action required |
