{{ config(materialized='view') }}

select
    EMAILEVENTID as email_event_id,
    CUSTOMERID as customer_id,
    SUBSCRIBERID as subscriber_id,
    EMAILID as email_id,
    CAMPAIGNID as campaign_id,
    EVENTTYPE as event_type,
    EVENTTIMESTAMP as event_timestamp
from BLAKEHOBBS.DW_DELIVERABLE2EMAILS.MARKETINGEMAILS
