-- Top 10 customers
{{ config(materialized='table') }}

SELECT 
    customer_name,
    COUNT(DISTINCT order_number) AS Total_Orders,
    SUM(item_sold) AS Total_Items,
    SUM(net_revenue) AS Total_Revenue,
    RANK() OVER(ORDER BY SUM(net_revenue) DESC) AS Revenue_Rank
FROM {{ ref('fct_orders') }}
GROUP BY 1
QUALIFY Revenue_Rank <= 10
ORDER BY Total_Revenue DESC


