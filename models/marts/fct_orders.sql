{{ config(materialized='table') }}

SELECT
    order_number,
    order_date,
    customer_name,
    product_name,
    sales_chanel,
    customer_type,
    item_sold,
    net_sales,
    net_revenue,
    discount_amount,
    coupon_amount,

    net_sales - net_revenue AS total_discount_value

FROM {{ ref('stg_orders') }}

