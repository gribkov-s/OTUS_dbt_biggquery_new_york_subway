with trips_stops as (

    select * from {{ ref('fact_trips_stops') }}

),

last_stop_number as (

    select
        trips_stops.trip_id,
        max(trips_stops.stop_sequence) as last_stop_number 

    from trips_stops

    group by
        trips_stops.trip_id

),

first_stop as (

    select
        trips_stops.trip_id,
        trips_stops.stop_id

    from trips_stops

    where  
        stop_sequence = 1

),

last_stop as (

    select
        trips_stops.trip_id,
        trips_stops.stop_id,
        last_stop_number.last_stop_number

    from trips_stops

    left join last_stop_number using (trip_id)

    where 
        trips_stops.stop_sequence = last_stop_number.last_stop_number

),

first_and_last_stop as (

    select
        last_stop.trip_id,
        first_stop.stop_id as first_stop_id,
        last_stop.stop_id as last_stop_id,
        last_stop.last_stop_number

    from last_stop

    left join first_stop using (trip_id)

)

select * from first_and_last_stop