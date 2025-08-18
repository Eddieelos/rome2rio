-- Staging model for ticketSegment
with source as (
    select * from {{ ref('ticketSegment') }}
)
select
    ticket_id,
    segment_id
from source
