{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
    )
}}


select
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    customer_id,
    first_name,
    last_name,
    email,
    city,
    state,
    zip_code
from {{ ref('stg_customer') }}  

select distinct
    {{ dbt_utils.generate_surrogate_key(['subscriber_id']) }} as subscriber_key,
    subscriber_id,
    subscriber_first_name,
    subscriber_last_name
from {{ ref('stg_marketingemails') }}
where subscriber_id is not null 