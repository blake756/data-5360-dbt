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