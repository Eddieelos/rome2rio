-- Fact table: Bookings
-- One row per booking, with total passengers and total revenue
with bookings as (
    select * from {{ ref('stg_bookings') }}
),
passenger_counts as (
    select booking_id, count(distinct passenger_id) as passenger_count
    from {{ ref('stg_tickets') }} t
    join {{ ref('stg_ticketPassenger') }} tp on t.ticket_id = tp.ticket_id
    group by booking_id
),
ticket_revenue as (
    select booking_id, sum(ticket_price) as total_revenue
    from {{ ref('stg_tickets') }}
    group by booking_id
)
select
    b.booking_id,
    b.booking_date,
    b.customer_id,
    b.number_of_passengers,
    coalesce(pc.passenger_count, 0) as passenger_count,
    coalesce(tr.total_revenue, 0) as total_revenue
from bookings b
left join passenger_counts pc on b.booking_id = pc.booking_id
left join ticket_revenue tr on b.booking_id = tr.booking_id
