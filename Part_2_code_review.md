# Code Review: Junior Engineer dbt Model

## Submitted Model
```sql
select bookingid, count(*) as passenger_count, sum(bookingPrice) as revenue
from {{ ref('raw_bookings') }} b
join {{ ref('raw_passengers') }} p on b.bookingid = p.bookingid
join {{ ref('raw_tickets') }} t on b.bookingid = t.bookingid
group by bookingid
```

## Review & Feedback

### Logic
- The join between bookings and passengers is likely incorrect; passengers should be 

Overcounting risk: Joining passengers and tickets directly on bookingid may create a fan-out join  (e.g., if one booking has 3 passengers and 2 tickets, the join produces 6 rows). This would inflate both passenger_count and revenue. (duplicate values)
 # How to fix ? 
    Aggregate at the appropriate level before joining:
    First count passengers per booking in a CTE.
    First sum ticket revenue per booking in another CTE.
    Then join those CTEs back to raw_bookings.


- `count(*)` counts all joined rows, not distinct passengers. Use `count(distinct p.passenger_id)` for accuracy.

- Usig `raw` tables to build a model
    This is not good practice, `raw` table are operational data tables (structure of the upstream source). 
    - Those can change without notice and can create issues downstream  
    - No sustainable Semantic meaning - they don't  have "clean" and accurate data  
    noisy, denormalized, or unstandardized fields (e.g., inconsistent casing,nulls)
    - Testing & governance: dbt best practices suggest separating raw ingestion from
      business transformations. Otherwise, there’s no clean place to apply basic validations or fixes. 
### Maintainability
- Use CTEs to break up logic and improve readability.
- Use clear, snake_case column names for consistency.
- Add comments to explain join logic and aggregations.

### Clarity
- Add documentation blocks and column descriptions.
- Use explicit references to staging models, not raw tables.

### Actionable Suggestions
- Fix join logic to use ticketPassenger for passenger counts.
- Use CTEs and clear naming.
- stage the tables and apply tests 
- Reference correct columns and models.
- Add comments and documentation.
