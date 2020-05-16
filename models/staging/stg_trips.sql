with source as (

    select * from {{ ref('new_york_subway_trips') }}

)

select * from source