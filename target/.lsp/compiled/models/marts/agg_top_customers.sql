-- Top 10 customers
WITH customer_sales AS (

    SELECT
        customer_name,
        SUM(net_revenue) AS total_revenue,
        COUNT(DISTINCT order_number) AS total_orders

    FROM ECOMMERCE_ANALYTICS.MARTS.fct_orders
    GROUP BY 1

),

ranked AS (

    SELECT *,
           DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS rank_num
    FROM customer_sales

)

SELECT *
FROM ranked
WHERE rank_num <= 10

