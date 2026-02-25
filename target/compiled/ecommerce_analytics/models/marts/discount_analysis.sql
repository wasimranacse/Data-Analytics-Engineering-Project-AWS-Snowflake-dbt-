SELECT
    sales_chanel,

    SUM(net_revenue) AS revenue,
    SUM(discount_amount + coupon_amount) AS total_discount,

    ROUND(
        SUM(discount_amount + coupon_amount) / NULLIF(SUM(net_sales), 0) * 100,
        2
    ) AS discount_pct

FROM ECOMMERCE_ANALYTICS.MARTS.fct_orders
GROUP BY sales_chanel
ORDER BY revenue DESC