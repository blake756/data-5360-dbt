{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
) }}

select distinct
    {{ dbt_utils.generate_surrogate_key(['cast(order_timestamp as date)']) }} as date_key,
    cast(order_timestamp as date) as full_date,
    extract(month from cast(order_timestamp as date)) as month,
    extract(year from cast(order_timestamp as date)) as year,
    extract(quarter from cast(order_timestamp as date)) as quarter
from {{ ref('stg_order') }}
where order_timestamp is not null