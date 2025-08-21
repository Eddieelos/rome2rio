# Leadership Scenario: Performance Issue (Booking Queries Slow)


1. ### Code Standards & Review Process

## Engineering Standards Document

- Define SQL, Python, dbt, Airflow (or other stack-specific) style guides.
- Set conventions for naming (tables, columns, DAGs, models, tests).
- Apply formatting tools like sqlfluff to automate style enforcement.


## Code Review Proces with structured PR workflow:

- Every change requires peer review before merge.
- Define clear expectations: reviewers focus on correctness, performance, readability, and tests.
- Lightweight checklists and templates (e.g., “does this PR have tests, docs, follow naming conventions?”).

- Assign “PR buddies” in smaller groups to avoid bottlenecks and spread review load.

## Ownership & Accountability

- Adopt a “You build it, you own it” philosophy → engineers remain responsible for pipelines/models after deployment.
- Encourage small, frequent PRs over big bang changes.

2. ## Knowledge Sharing Approach

As the team scales, tribal knowledge doesn’t scale. I’d build multiple layers of sharing
- Documentation - Create a central knowledge base (Confluence, Notion, dbt Docs, or internal wiki).
- Rituals & Processes
- Pairing & Mentorship - Introduce pair programming / pairing rotations for onboarding and tricky tasks. 