{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


SELECT 
product_id as product_key,
product_id,
unit_price,
description,
product_name
from {{ source('oliver','product') }}