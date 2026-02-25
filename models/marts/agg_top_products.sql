
-- Top 10 poducts
{{ config(materialized='table') }}

SELECT
    product_name,
    COUNT(DISTINCT order_number) AS total_orders,
    SUM(item_sold) AS total_items_sold,
    SUM(net_revenue) AS total_revenue,
    RANK() OVER (ORDER BY SUM(net_revenue) DESC) AS revenue_rank
FROM {{ ref('fct_orders') }}
GROUP BY 1
QUALIFY revenue_rank <= 10
ORDER BY total_revenue DESC
