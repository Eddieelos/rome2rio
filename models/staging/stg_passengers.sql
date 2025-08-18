-- Staging model for passengers
with source as (
    select * from {{ ref('passengers') }}
)
select
    passenger_id,
    first_name,
    last_name,
    date_of_birth
from source
