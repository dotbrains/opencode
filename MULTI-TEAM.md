# Multi-Team Orchestration System

Three-tier multi-team agent orchestration for opencode. Based on [IndyDevDan's "One Agent Is NOT ENOUGH"](https://www.youtube.com/watch?v=M30gp1315Y4).

## Architecture

```
Orchestrator Lead
├── Planning Team (HIGH tier)
│   ├── Planning Lead
│   ├── Planning Agent
│   └── Plan Reviewer
├── Engineering Team (MEDIUM tier)
│   ├── Engineering Lead
│   ├── Frontend Dev
│   ├── Backend Dev
│   └── DevOps Specialist
└── Validation Team (MEDIUM tier)
    ├── Validation Lead
    ├── Reviewer
    ├── Security Reviewer
    └── QA Engineer
```

## Installation

This is included in the opencode config at `~/.config/opencode/`. No separate installation needed.

## Usage

### 1. Select orchestrator-lead as your agent

When starting opencode, select `orchestrator-lead` as the primary agent.

### 2. Just type your request

The orchestrator will automatically route to the appropriate teams:

| Request Type | Flow |
|--------------|------|
| New feature | Planning → Engineering → Validation |
| Bug fix | Engineering → Validation |
| Code review | Validation only |
| Architecture | Planning only |
| Security audit | Validation (security focus) |
| Quick lookup | Direct or Engineering |

## Agent Reference

### Orchestrator Lead

**Role:** Top-level coordinator

**Responsibilities:**
- Analyze requests and determine complexity
- Route to appropriate teams
- Synthesize results from all teams
- Final quality gate before delivery

**Model:** HIGH (mimo-v2-pro-free)

### Planning Team

| Agent | Role |
|-------|------|
| planning-lead | Coordinates planning work |
| planning-agent | Creates architecture/design |
| plan-reviewer | Reviews plans for completeness |

**Model:** HIGH (mimo-v2-pro-free)

### Engineering Team

| Agent | Role |
|-------|------|
| engineering-lead | Coordinates implementation |
| frontend-dev | UI/frontend implementation |
| backend-dev | API/backend implementation |
| devops-specialist | Infrastructure/deployment |

**Model:** MEDIUM (kimi-k2.5)

### Validation Team

| Agent | Role |
|-------|------|
| validation-lead | Coordinates validation |
| reviewer | Code quality reviews |
| security-reviewer | Security audits |
| qa-engineer | Test automation |

**Model:** MEDIUM (kimi-k2.5)

## Skills

Invoke skills directly for common workflows:

### @mt-feature

Full lifecycle for new features:
1. Planning team creates architecture
2. Engineering team implements
3. Validation team reviews

### @mt-review

Quick code review via validation team:
1. Reviewer checks code quality
2. Security reviewer checks for vulnerabilities
3. QA engineer checks test coverage

### @mt-audit

Deep security audit:
1. Security-focused validation
2. Vulnerability scanning
3. Severity-rated findings

### @mt-fix

Bug fix workflow:
1. Engineering team investigates and fixes
2. Validation team verifies the fix
3. No regressions introduced

### @mt-lookup

Quick code exploration:
1. Direct answer using available tools
2. Delegate to engineering workers if needed

## Configuration

### teams.yaml

Team member definitions for routing.

### orchestrator.yaml

- Team configurations (leads + workers)
- Model tier assignments
- Routing rules
- Preprocessing settings

### agent-chain.yaml

Sequential pipelines:
- `full-lifecycle` - plan → engineer → validate
- `engineer-validate` - skip planning
- `plan-validate` - skip implementation
- `security-audit` - deep security focus

### expertise/

Domain knowledge per team:
- `orchestrator-expertise.md` - Routing decisions, composition strategy
- `planning-expertise.md` - Architecture patterns, planning format
- `engineering-expertise.md` - Code patterns, anti-patterns
- `validation-expertise.md` - Security checklist, testing strategies

## Model Tiers

| Tier | Model | Use For |
|------|-------|---------|
| HIGH | mimo-v2-pro-free | Orchestrator, Planning, Architecture |
| MEDIUM | kimi-k2.5 | Engineering, Validation, Code Review |

Cost optimization: don't pay for intelligence you don't need.

## Examples

```
# New feature
> Build a user authentication system with OAuth2

# Bug fix
> Fix the login bug where sessions expire prematurely

# Code review
> Review the auth module for security issues

# Architecture
> Design a caching layer for our API

# Security
> Audit the payment processing code
```
