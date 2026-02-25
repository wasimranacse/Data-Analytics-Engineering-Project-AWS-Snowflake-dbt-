{{ config(materialized='table') }}

SELECT
    product_name,
    COUNT(DISTINCT order_number) AS total_orders,
    SUM(item_sold) AS total_items,
    SUM(net_revenue) AS total_revenue
FROM {{ ref('stg_orders') }}
GROUP BY 1
