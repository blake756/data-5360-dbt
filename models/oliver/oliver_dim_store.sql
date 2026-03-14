{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
    )
}}

SELECT 
store_id as store_key,
store_id, 
city,
state,
street,
store_name
from {{ source('oliver','store') }}