{{ config(materialized='view') }}

with tripdata as 
(
  select 
    *
  from {{ source('staging','fhv_tripdata_external_table') }}
  where dispatching_base_num is not null or dispatching_base_num != ''
)
select
    -- identifiers
    cast(pulocationid as integer) as  pickup_locationid,
    cast(dolocationid as integer) as dropoff_locationid,
    cast(sr_flag as integer) as sr_flag,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime,
    
    -- trip info
    dispatching_base_num
from tripdata
where EXTRACT(YEAR FROM pickup_datetime) = 2019


-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  --limit 100

{% endif %}
