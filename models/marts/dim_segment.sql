-- Dimension table: Segment
-- One row per segment
select
    segment_id,
    origin,
    destination,
    departure_datetime,
    arrival_datetime,
    airline_code,
    flight_number
from {{ ref('stg_segments') }}
