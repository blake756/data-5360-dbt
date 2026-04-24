select
    ORDER_LINE_ID as order_line_id,
    ORDER_ID as order_id,
    PRODUCT_ID as product_id,
    CAMPAIGN_ID as campaign_id,
    PROMOTIONAL_CAMPAIGN as promotional_campaign,
    QUANTITY as quantity,
    DISCOUNT as discount,
    PRICE_AFTER_DISCOUNT as price_after_discount
from BLAKEHOBBS.DW_ECOESSENTIALS_ECOESSENTIALS_TRANSACTIONAL_DB.ORDER_LINE

