select distinct
    {{ dbt_utils.generate_surrogate_key(['email_id']) }} as email_key,
    email_id,
    subscriber_email as email_address,
    send_timestamp
from {{ ref('stg_marketingemails') }}
where email_id is not null 