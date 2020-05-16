with source as (

    select
        trip_id,
        arrival_time,
        departure_time,
        stop_id,
        stop_sequence
    from {{ ref('new_york_subway_stop_times') }}

)

select * from source