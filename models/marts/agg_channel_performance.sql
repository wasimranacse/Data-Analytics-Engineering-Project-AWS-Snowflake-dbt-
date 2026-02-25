{{ config(materialized='table') }}

SELECT
    sales_chanel,
    COUNT(DISTINCT order_number) AS total_orders,
    SUM(net_revenue) AS total_revenue,
    SUM(item_sold) AS total_items
FROM {{ ref('fct_orders') }}
GROUP BY 1
ORDER BY total_revenue DESC
