{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    e.employee_key,
    d.date_key,
    s.certification_name,
    s.certification_cost
FROM {{ ref('stg_employee_certifications') }} AS s 
LEFT JOIN {{ ref('oliver_dim_employee') }} AS e 
    ON CAST(s.employee_id AS STRING) = CAST(e.employee_key AS STRING)
LEFT JOIN {{ ref('oliver_dim_date') }} AS d
    ON CAST(s.certification_awarded_date AS DATE) = CAST(d.date_day AS DATE)

    












