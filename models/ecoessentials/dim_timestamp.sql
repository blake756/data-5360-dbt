{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
) }}

select distinct
    {{ dbt_utils.generate_surrogate_key(['event_timestamp']) }} as timestamp_key,
    event_timestamp
from {{ ref('stg_marketingemails') }}
where event_timestamp is not null
  and lower(event_timestamp::string) != 'null'

