with source as (

    select * from {{ ref('new_york_subway_routes') }}

)

select * from source