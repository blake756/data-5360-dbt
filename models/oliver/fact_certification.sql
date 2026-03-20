SELECT
    e.employee_key,
    d.date_key,
    s.certification_name,
    s.certification_cost

FROM {{ ref('stg_employee_certifications') }} AS s 
INNER JOIN {{ ref('oliver_dim_employee') }} AS e 
    ON s.employee_id = e.employee_key 
INNER JOIN {{ ref('oliver_dim_date') }} AS d
    ON s.certification_completion_id = d.date_key