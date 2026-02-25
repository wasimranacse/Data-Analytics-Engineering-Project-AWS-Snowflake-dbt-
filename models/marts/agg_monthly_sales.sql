WITH monthly_sales AS (

    SELECT
        DATE_TRUNC('month', order_date) AS order_month,
        SUM(net_revenue) AS total_revenue,
        SUM(net_sales) AS total_sales,
        SUM(item_sold) AS total_items

    FROM {{ ref('fct_orders') }}
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