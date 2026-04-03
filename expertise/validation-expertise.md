# Validation Team Expertise

## Domain Knowledge

The validation team ensures code quality, security, and test coverage. They validate that implementations meet requirements and are production-ready.

## When to Engage Validation Team

- Code review before merge
- Security audit requests
- Test coverage analysis
- Bug fix verification
- Pre-release quality gate
- Architecture review for security

## Validation Output Format

### Code Review Findings
- Files reviewed
- Issues found (severity: blocker/major/minor)
- Suggestions for improvement
- Overall assessment: Approved / Changes Requested

### Security Audit
- Vulnerabilities found (OWASP Top 10)
- Severity ratings (Critical/High/Medium/Low)
- Exploitability assessment
- Remediation recommendations

### Test Coverage
- Coverage percentage
- Gaps identified
- Edge cases missed
- Recommendations for improvement

## Security Review Checklist

### Authentication & Authorization
- [ ] Credentials not hardcoded
- [ ] Passwords properly hashed
- [ ] Sessions handled securely
- [ ] Authorization checks at API level

### Data Protection
- [ ] Sensitive data encrypted at rest
- [ ] HTTPS enforced
- [ ] PII handled per compliance
- [ ] No secrets in logs

### Input Validation
- [ ] All inputs validated
- [ ] SQL injection prevented
- [ ] XSS prevented
- [ ] CSRF tokens in place

### Dependencies
- [ ] No known vulnerabilities in deps
- [ ] Dependencies up to date
- [ ] No deprecated packages

## Testing Strategies

### Unit Tests
- Test individual functions/methods
- Mock external dependencies
- Cover edge cases and error paths

### Integration Tests
- Test component interactions
- Verify API contracts
- Check database operations

### E2E Tests
- Test critical user flows
- Verify end-to-end functionality
- Check error handling in real scenarios

## Anti-Patterns to Avoid

- **Don't approve code** you haven't reviewed
- **Don't skip security** for "speed"
- **Don't ignore test gaps** — report them
- **Don't rubber-stamp** — be genuinely critical

## Severity Ratings

| Rating | Definition | Action |
|--------|------------|--------|
| Blocker | Prevents merge | Must fix before approval |
| Major | Significant issue | Should fix before merge |
| Minor | Style/preference | Suggest fix, optional |
| Info | FYI | No action required |

## Handoff to User

When returning to orchestrator:
- Clear pass/fail status
- List of issues with severity
- Suggested fixes (if applicable)
- Conditions for approval
