{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
) }}

with customers as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        city,
        state,
        zip_code
    from {{ ref('stg_customer') }}
),

subscribers as (
    select distinct
        subscriber_id,
        subscriber_first_name,
        subscriber_last_name,
        email as subscriber_email 
    from {{ ref('stg_marketingemails') }}
    where subscriber_id is not null
),

joined as (
    select
        coalesce(c.customer_id, s.subscriber_id) as integration_id,
        coalesce(c.first_name, s.subscriber_first_name) as first_name,
        coalesce(c.last_name, s.subscriber_last_name) as last_name,
        coalesce(c.email, s.subscriber_email) as email,
        c.city,
        c.state,
        c.zip_code,
        case when c.customer_id is not null then 'Yes' else 'No' end as is_customer,
        case when s.subscriber_id is not null then 'Yes' else 'No' end as is_subscriber

    from customers c
    full outer join subscribers s 
        on c.email = s.subscriber_email
)

select
    {{ dbt_utils.generate_surrogate_key(['integration_id', 'email']) }} as customer_key,
    *
from joined