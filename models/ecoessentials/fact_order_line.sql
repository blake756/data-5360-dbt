{{ config(materialized='table', schema='DW_ECOESSENTIALS') }}

select
    {{ dbt_utils.generate_surrogate_key(['ol.order_id','ol.product_id']) }} as order_line_key,

    dd.date_key,
    du.user_key,
    dp.product_key,
    dcamp.campaign_key,

    ol.order_id,
    ol.product_id,

    ol.quantity,
    ol.discount,
    ol.price_after_discount as net_sales_amount

from {{ ref('stg_order_line') }} ol

left join {{ ref('stg_order') }} o
    on ol.order_id = o.order_id

left join {{ ref('dim_date') }} dd
    on cast(o.order_timestamp as date) = dd.full_date

left join {{ ref('dim_user') }} du
    on o.customer_id = du.customer_id

left join {{ ref('dim_product') }} dp
    on ol.product_id = dp.product_id

left join {{ ref('dim_campaign') }} dcamp
    on ol.campaign_id = dcamp.campaign_id
    and dcamp.campaign_type = 'online'


