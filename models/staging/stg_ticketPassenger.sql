-- Staging model for ticketPassenger
with source as (
    select * from {{ ref('ticketPassenger') }}
)
select
    ticket_id,
    passenger_id
from source
