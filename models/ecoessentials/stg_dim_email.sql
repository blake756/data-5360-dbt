{{ config(
    materialized = 'table',
    schema = 'DW_ECOESSENTIALS'
    )
}}

SELECT
email_id,
emailname,
FROM {{ source('dw_ecoessentials', 'MARKETINGEMAILS') }}