with trips as (

    select * from {{ ref('stg_trips') }}

),

stops as (

    select * from {{ ref('stg_stop_times') }}

),

trips_stops as (

    select
        trips.route_id,
        trips.service_id,
        trips.trip_id,
        trips.direction_id,
        stops.stop_id,
        stops.stop_sequence,
        stops.arrival_time,
        stops.departure_time

    from trips

    left join stops using (trip_id)

)

select * from trips_stops