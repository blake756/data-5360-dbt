{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

select
    customer_id as customer_key,
    customer_id,
    first_name,
    last_name,
    email,
    state
from {{ source('oliver','customer') }}
