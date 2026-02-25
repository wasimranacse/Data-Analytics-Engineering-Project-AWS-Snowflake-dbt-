{{ config(materialized='table') }}

SELECT
    customer_type,
    COUNT(DISTINCT customer_name) AS total_customers,
    SUM(net_revenue) AS total_revenue,
    
    COUNT(DISTINCT order_number) AS total_orders
FROM {{ ref('fct_orders') }}
GROUP BY 1
