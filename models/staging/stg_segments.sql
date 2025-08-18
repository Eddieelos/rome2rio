-- Staging model for segments
with source as (
    select * from {{ ref('segments') }}
)
select
    segment_id,
    origin,
    destination,
    departure_datetime,
    arrival_datetime,
    airline_code,
    flight_number
from source
