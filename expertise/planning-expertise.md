# Planning Team Expertise

## Domain Knowledge

The planning team handles architecture, design patterns, and technical decision-making. They produce high-level plans without writing implementation code.

## When to Engage Planning Team

- New feature requiring architecture decisions
- Refactoring affecting multiple components
- Technology selection or migration
- API design for new services
- Database schema changes
- Performance optimization requiring architectural changes

## Planning Output Format

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

## Architecture Patterns Reference

| Pattern | Use When |
|---------|----------|
| Layered | Standard CRUD apps |
| Microservices | Scale needs, team autonomy |
| Event-driven | Async workflows, real-time |
| CQRS | Complex read/write patterns |
| Hexagonal | Heavy domain logic |
| Serverless | Variable load, low ops |

## Anti-Patterns to Avoid

- **Over-engineering**: Don't introduce patterns until needed
- **Premature optimization**: Profile before optimizing
- **Big bang rewrites**: Incremental migration preferred
- ** ivory tower architecture**: Ground in existing code reality

## Handoff to Engineering

When passing to engineering:
- Clear file-level task breakdown
- Dependency graph
- Acceptance criteria for each component
- Known constraints and non-negotiables
