-- Staging model for tickets
with source as (
    select * from {{ ref('tickets') }}
)
select
    ticket_id,
    booking_id,
    issue_date,
    ticket_price
from source
