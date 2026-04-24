{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
) }}

select
    {{ dbt_utils.generate_surrogate_key([
        'nullif(sme.email_event_id::string, \'NULL\')'
    ]) }} as marketing_email_event_key,

    dd.date_key,
    dt.timestamp_key,
    du.user_key,
    dcamp.campaign_key,
    de.event_key,
    de2.email_key,

    sme.email_event_id

from {{ ref('stg_marketingemails') }} sme

left join {{ ref('dim_date') }} dd
    on cast(nullif(sme.event_timestamp::string, 'NULL') as date) = dd.full_date

left join {{ ref('dim_timestamp') }} dt
    on nullif(sme.event_timestamp::string, 'NULL') = dt.event_timestamp

left join {{ ref('dim_user') }} du
    on nullif(sme.customer_id::string, 'NULL') = du.customer_id::string

left join {{ ref('dim_campaign') }} dcamp
    on nullif(sme.campaign_id::string, 'NULL') = dcamp.campaign_id
    and dcamp.campaign_type = 'email'

left join {{ ref('dim_event') }} de
    on nullif(sme.event_type::string, 'NULL') = de.event_type

left join {{ ref('dim_email') }} de2
    on nullif(sme.email_id::string, 'NULL') = de2.email_id