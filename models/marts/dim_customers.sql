{{ config(materialized='table') }}

SELECT
    customer_name,
    customer_type,
    MIN(order_date) AS first_order_date,
    COUNT(DISTINCT order_number) AS total_orders,
    SUM(item_sold) AS total_items,
    SUM(net_revenue) AS total_revenue
FROM {{ ref('stg_orders') }}
GROUP BY 1,2
