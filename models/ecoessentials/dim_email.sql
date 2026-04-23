{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
) }}

select distinct
    {{ dbt_utils.generate_surrogate_key(['email_id']) }} as email_key,
    email_id,
    'marketing_email' as email_name

from {{ ref('stg_marketingemails') }}
where email_id is not null