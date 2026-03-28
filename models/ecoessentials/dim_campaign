with order_campaigns as (

    select distinct
        campaign_id,
        cast(campaign_id as varchar) as campaign_name,
        discount as campaign_discount,
        'online' as campaign_type
    from {{ ref('stg_order_line') }}
    where campaign_id is not null

),

email_campaigns as (

    select distinct
        campaign_id,
        cast(campaign_name as varchar) as campaign_name,
        null as campaign_discount,
        'email' as campaign_type
    from {{ ref('stg_marketingemails') }}
    where campaign_id is not null

),

combined as (

    select * from order_campaigns
    union
    select * from email_campaigns

)

select distinct
    {{ dbt_utils.generate_surrogate_key(['campaign_id']) }} as campaign_key,
    campaign_id,
    campaign_name,
    campaign_discount,
    campaign_type
from combined