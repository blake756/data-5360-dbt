{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
) }}

SELECT
    c.customer_key,
    e.employee_key,
    p.product_key,
    s.store_key,
    d.date_key,
    ol.quantity,
    ol.unit_price,
    ol.quantity * ol.unit_price AS total_sales

FROM {{ source('oliver', 'orderline') }} ol

INNER JOIN {{ source('oliver', 'orders') }} o
    ON ol.order_id = o.order_id

INNER JOIN {{ ref('oliver_dim_customer') }} c
    ON o.customer_id = c.customer_key

INNER JOIN {{ ref('oliver_dim_employee') }} e
    ON o.employee_id = e.employee_key

INNER JOIN {{ ref('oliver_dim_product') }} p
    ON ol.product_id = p.product_key

INNER JOIN {{ ref('oliver_dim_store') }} s
    ON o.store_id = s.store_key

INNER JOIN {{ ref('oliver_dim_date') }} d
    ON o.order_date = d.date_day