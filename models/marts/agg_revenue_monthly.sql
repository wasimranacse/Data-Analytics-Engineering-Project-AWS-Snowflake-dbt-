{{ config(materialized='table') }}

SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    SUM(net_revenue) AS total_revenue,
    SUM(net_sales) AS total_sales,
    SUM(total_discount_value) AS total_discount
FROM {{ ref('fct_orders') }}
GROUP BY 1
ORDER BY 1
