SELECT
    orderdate::date AS Order_Date,
    ordernumber::number AS Order_Number,
    CASE
        WHEN orderstatus = 'processing' THEN 'Completed'
        ELSE 'Completed'
    END AS Order_Status,
    customername AS Customer_Name,
    CASE
        WHEN customertype = 'new' THEN 'New'
        WHEN customertype = 'returning' THEN 'Returning'
        ELSE ''
    END AS Customer_Type,
    CASE
        WHEN productname = 'nan' THEN 'EasyWeed® HTV'
        ELSE productname
    END AS Product_Name,
    
    ITEMSSOLD::integer AS Item_Sold,
    netsales::float AS Net_Sales,
    CASE
        WHEN attribution = 'Direct' THEN 'Direct'
        WHEN attribution = 'Google' THEN 'Google'
        WHEN attribution = 'Bing.com' THEN 'Bing'
        WHEN attribution = 'Duckduckgo.com' THEN 'Duckduckgo'
        WHEN attribution = 'Search.yahoo.com' THEN 'Yahoo'
        WHEN attribution = 'Acetransco.com' THEN 'Ace Transco'
        WHEN attribution = 'Ntp.msn.com' THEN 'MSN'
        WHEN attribution = 'Imprintnext.com' THEN 'Imprint Next'
        ELSE 'Direct'
    END AS Sales_Chanel,
    netrevenue::float AS Net_Revenue,
    discountamount::float AS Discount_Amount,
    couponamount::float AS Coupon_Amount
FROM {{ source('raw', 'ORDERS_RAW') }}

