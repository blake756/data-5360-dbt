{{ config(materialized='table', schema='DW_ECOESSENTIALS') }}

select
    {{ dbt_utils.generate_surrogate_key(['c.customer_id']) }} as user_key,

    c.customer_id,
    me.subscriber_id,
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.state,
    c.zip_code

from {{ ref('stg_customer') }} c

left join {{ ref('stg_marketingemails') }} me
    on nullif(lower(c.customer_id::string), 'null')
     = nullif(lower(me.customer_id::string), 'null')