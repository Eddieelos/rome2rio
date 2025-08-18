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
- The join between bookings and passengers is likely incorrect; passengers should be joined via tickets or a ticketPassenger link, not directly on bookingid.
- `count(*)` counts all joined rows, not distinct passengers. Use `count(distinct p.passenger_id)` for accuracy.
- `sum(bookingPrice)` references a column not present in the provided seeds; should be `sum(t.ticket_price)`.

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
- Reference correct columns and models.
- Add comments and documentation.
