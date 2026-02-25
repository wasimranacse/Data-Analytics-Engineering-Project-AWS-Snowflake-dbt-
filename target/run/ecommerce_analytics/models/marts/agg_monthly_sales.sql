
  
    

create or replace transient table ECOMMERCE_ANALYTICS.MARTS.agg_monthly_sales
    
    
    
    as (WITH monthly_sales AS (

    SELECT
        DATE_TRUNC('month', order_date) AS order_month,
        SUM(net_revenue) AS total_revenue,
        SUM(net_sales) AS total_sales,
        SUM(item_sold) AS total_items

    FROM ECOMMERCE_ANALYTICS.MARTS.fct_orders
    GROUP BY 1

),

final AS (

    SELECT
        *,
        LAG(total_revenue) OVER (ORDER BY order_month) AS prev_month_revenue,

        ROUND(
            (total_revenue - LAG(total_revenue) OVER (ORDER BY order_month))
            / NULLIF(LAG(total_revenue) OVER (ORDER BY order_month), 0) * 100,
            2
        ) AS revenue_growth_pct

    FROM monthly_sales

)

SELECT * FROM final
    )
;


  