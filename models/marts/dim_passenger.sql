-- Dimension table: Passenger
-- One row per passenger
select
    passenger_id,
    first_name,
    last_name,
    date_of_birth
from {{ ref('stg_passengers') }}
