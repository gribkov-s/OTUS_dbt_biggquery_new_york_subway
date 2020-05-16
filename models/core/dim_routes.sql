with routes as (

    select   
        route_id,
        route_long_name as route_name,
        route_type 
        
    from {{ ref('stg_routes') }}

)

select * from routes