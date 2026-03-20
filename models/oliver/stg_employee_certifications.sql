{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

select
certification_completion_id,
first_name,
last_name,
email,
employee_id,
PARSE_JSON(CERTIFICATION_JSON):certification_name::string AS certification_name,
PARSE_JSON(CERTIFICATION_JSON):certification_cost::int AS certification_cost,
PARSE_JSON(CERTIFICATION_JSON):certification_awarded_date::date AS certification_awarded_date
from {{ source('oliver', 'employee_certifications')}}

