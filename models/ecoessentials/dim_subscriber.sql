select distinct
    {{ dbt_utils.generate_surrogate_key(['subscriber_id']) }} as subscriber_key,
    subscriber_id,
    subscriber_first_name,
    subscriber_last_name
from {{ ref('stg_marketingemails') }}
where subscriber_id is not null 