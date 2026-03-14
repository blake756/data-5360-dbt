{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

select distinct
    to_number(to_char(order_date, 'YYYYMMDD')) as date_key,
    order_date as date_day,
    extract(year from order_date) as year,
    extract(month from order_date) as month,
    extract(day from order_date) as day
from {{ source('oliver','orders') }}