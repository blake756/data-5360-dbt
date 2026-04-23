{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
    )
}}

{{ config(materialized='table', schema='DW_ECOESSENTIALS') }}

select
    {{ dbt_utils.generate_surrogate_key(['email_event_id']) }} as marketing_email_event_key,

    dd.date_key,
    dt.timestamp_key,
    du.user_key,
    dcamp.campaign_key,
    de.event_key,
    de2.email_key,

    sme.email_event_id

from {{ ref('stg_marketingemails') }} sme
left join {{ ref('dim_date') }} dd
    on cast(sme.event_timestamp as date) = dd.full_date
left join {{ ref('dim_timestamp') }} dt
    on sme.send_timestamp = dt.send_timestamp
left join {{ ref('dim_user') }} du
    on sme.customer_id = du.customer_id
left join {{ ref('dim_campaign') }} dcamp
    on sme.campaign_id = dcamp.campaign_id
    and dcamp.campaign_type = 'email'
left join {{ ref('dim_event') }} de
    on sme.event_type = de.event_type
left join {{ ref('dim_email') }} de2
    on sme.email_id = de2.email_id