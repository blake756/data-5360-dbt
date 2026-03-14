{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
    )
}}


select
    employee_id as employee_key,
    employee_id
    first_name,
    last_name,
    hire_date,
    email,
    position,
    phone_number
from {{ source('oliver','employee') }}