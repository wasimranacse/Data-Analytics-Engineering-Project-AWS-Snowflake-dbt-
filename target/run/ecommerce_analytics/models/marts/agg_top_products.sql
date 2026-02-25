
  
    

create or replace transient table ECOMMERCE_ANALYTICS.MARTS.agg_top_products
    
    
    
    as (-- Top 10 poducts
WITH product_sales AS (

    SELECT
        product_name,
        SUM(net_revenue) AS total_revenue,
        SUM(item_sold) AS total_quantity

    FROM ECOMMERCE_ANALYTICS.MARTS.fct_orders
    GROUP BY 1

),

ranked AS (

    SELECT *,
           DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS rank_num
    FROM product_sales

)

SELECT *
FROM ranked
WHERE rank_num <= 10
    )
;


  