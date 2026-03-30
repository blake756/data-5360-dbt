select
    {{ dbt_utils.generate_surrogate_key(['email_event_id']) }} as marketing_email_event_key,
    dd.date_key,
    dc.customer_key,
    dcamp.campaign_key,
    ds.subscriber_key,
    de.email_key, 
    email_event_id, 
    event_type,
    event_timestamp
from {{ ref('stg_marketingemails') }} sme
left join {{ ref('dim_date') }} dd
    on cast(sme.event_timestamp as date) = dd.full_date
left join {{ ref('dim_customer') }} dc
    on sme.customer_id = dc.customer_id
left join {{ ref('dim_campaign') }} dcamp
    on sme.campaign_id = dcamp.campaign_id
left join {{ ref('dim_subscriber') }} ds
    on sme.subscriber_id = ds.subscriber_id
left join {{ ref('dim_email') }} de
    on sme.email_id = de.email_id