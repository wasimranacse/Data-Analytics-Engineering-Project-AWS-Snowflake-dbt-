SELECT
    order_date,
    order_number,
    customer_name,
    customer_type,
    product_name,
    sales_chanel,

    item_sold,
    net_sales,
    net_revenue,
    discount_amount,
    coupon_amount

FROM {{ ref('stg_orders') }}