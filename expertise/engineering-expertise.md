# Engineering Team Expertise

## Domain Knowledge

The engineering team implements features across the full stack. Workers own their layer and should not modify code outside their domain unless explicitly requested.

## Worker Responsibilities

### Frontend Dev
- UI components and interactions
- Client-side state management
- Styling and accessibility
- API integration (client side)

### Backend Dev
- API endpoints and contracts
- Database schema and queries
- Business logic and services
- Authentication/authorization

### DevOps Specialist
- CI/CD pipelines
- Infrastructure as code
- Deployment configurations
- Environment management

## Patterns to Follow

### Before Writing Code
1. **Scan existing code** in the target area for conventions
2. **Check imports** for existing utilities to reuse
3. **Review tests** for testing patterns to match

### Code Quality
- Keep changes minimal and focused
- Match naming conventions of existing code
- Add clear comments for non-obvious logic
- Handle errors explicitly with context

### Testing
- Write tests for new functionality
- Match existing test structure and patterns
- Cover edge cases, not just happy path

## Anti-Patterns to Avoid

- **Don't touch files outside your layer** (frontend ≠ backend)
- **Don't add dependencies** without checking existing ones
- **Don't create abstractions** until 3+ use cases exist
- **Don't skip error handling** to "save time"
- **Don't leave TODO comments** — either do it or create an issue

## Frontend Specific

- Use existing component patterns
- Match CSS/styling system (Tailwind, modules, etc.)
- Ensure accessibility (aria labels, keyboard nav)
- Check browser compatibility for newer APIs

## Backend Specific

- Design RESTful APIs by default
- Use GraphQL only when schema-driven
- Prefer migrations over destructive changes
- Validate auth at middleware layer
- Profile before optimizing

## Handoff to Validation

When passing to validation:
- List of files modified/created
- Test coverage status
- Any known issues or areas of concern
- Instructions for reproduction (if bug fix)
