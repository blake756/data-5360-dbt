select
    try_to_number(replace(CAMPAIGNID, 'NULL', '')) as campaign_id,
    CAMPAIGNNAME as campaign_name,
    try_to_number(replace(CUSTOMERID, 'NULL', '')) as customer_id,
    try_to_number(replace(EMAILEVENTID, 'NULL', '')) as email_event_id,
    try_to_number(replace(EMAILID, 'NULL', '')) as email_id,
    EMAILNAME as email_name,
    EVENTTIMESTAMP as event_timestamp,
    EVENTTYPE as event_type,
    SENDTIMESTAMP as send_timestamp,
    SUBSCRIBEREMAIL as subscriber_email,
    nullif(SUBSCRIBERFIRSTNAME, 'NULL') as subscriber_first_name,
    try_to_number(replace(SUBSCRIBERID, 'NULL', '')) as subscriber_id,
    nullif(SUBSCRIBERLASTNAME, 'NULL') as subscriber_last_name
from BLAKEHOBBS.DW_ECOESSENTIALS.MARKETINGEMAILS 