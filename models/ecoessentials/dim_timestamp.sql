{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
) }}

select distinct
    {{ dbt_utils.generate_surrogate_key(['send_timestamp']) }} as timestamp_key,
    send_timestamp

from {{ ref('stg_marketingemails') }}
where send_timestamp is not null