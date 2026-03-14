select
    fs.order_id,
    d.date,
    c.firstname,
    c.lastname,
    p.productname,
    s.storename,
    fs.quantity,
    fs.total_sales
from {{ ref('fact_sales') }} fs
join {{ ref('oliver_dim_customer') }} c
    on fs.customer_id = c.customer_id
join {{ ref('oliver_dim_product') }} p
    on fs.product_id = p.product_id
join {{ ref('oliver_dim_store') }} s
    on fs.store_id = s.store_id
join {{ ref('oliver_dim_date') }} d
    on fs.orderdate = d.date