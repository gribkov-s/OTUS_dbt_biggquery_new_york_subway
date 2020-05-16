with routes as (

    select * from {{ ref('dim_routes') }}

),

trips_stops as (

    select * from {{ ref('fact_trips_stops') }}

),

stops_count as (

    select
        routes.route_name,
        routes.route_type,
        count(*) as stops_count

    from routes

    left join trips_stops using (route_id)

    group by
        routes.route_name,
        routes.route_type

)

select * from stops_count