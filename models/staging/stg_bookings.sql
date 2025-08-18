-- Staging model for bookings
with source as (
    select * from {{ ref('bookings') }}
)
select
    booking_id,
    booking_date,
    customer_id,
    number_of_passengers
from source
