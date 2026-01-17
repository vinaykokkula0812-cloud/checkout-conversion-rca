-- 1. FUNNEL QUERY
-- Funnel analysis: Visit → Add to Cart → Checkout → Purchase
WITH user_funnel AS (
    SELECT
        user_id,
        MAX(CASE WHEN event_name = 'visit' THEN 1 ELSE 0 END) AS visit,
        MAX(CASE WHEN event_name = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_cart,
        MAX(CASE WHEN event_name = 'checkout' THEN 1 ELSE 0 END) AS checkout,
        MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS purchase
    FROM events
    GROUP BY user_id
)
SELECT
    COUNT(DISTINCT user_id) AS total_users,
    SUM(visit) AS visits,
    SUM(add_to_cart) AS add_to_carts,
    SUM(checkout) AS checkouts,
    SUM(purchase) AS purchases,
    ROUND(SUM(add_to_cart) * 100.0 / NULLIF(SUM(visit), 0), 2) AS visit_to_cart_pct,
    ROUND(SUM(checkout) * 100.0 / NULLIF(SUM(add_to_cart), 0), 2) AS cart_to_checkout_pct,
    ROUND(SUM(purchase) * 100.0 / NULLIF(SUM(checkout), 0), 2) AS checkout_to_purchase_pct
FROM user_funnel;

------------------------------------------------------------------------------------------------------
-- 2.DEVICE BREAKDOWN
-- Checkout → Purchase conversion by device
WITH device_funnel AS (
    SELECT
        user_id,
        device,
        MAX(CASE WHEN event_name = 'checkout' THEN 1 ELSE 0 END) AS checkout,
        MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS purchase
    FROM events
    GROUP BY user_id, device
)
SELECT
    device,
    SUM(purchase) AS purchases,
    SUM(checkout) AS checkouts,
    ROUND(SUM(purchase) * 100.0 / NULLIF(SUM(checkout), 0), 2) AS checkout_to_purchase_pct
FROM device_funnel
GROUP BY device;

-----------------------------------------------------------------------------------------------------------
-- 3. PAYMENT FAILURE QUERY

-- Payment failure events over time
SELECT
    DATE(event_time) AS event_date,
    COUNT(*) AS payment_failures
FROM events
WHERE event_name = 'payment_failed'
GROUP BY DATE(event_time)
ORDER BY event_date;

-------------------------------------------------------------------------------------------------------------
-- 4. PAYMENT FAILURE RATE

-- Payment failure rate per device
SELECT
    device,
    COUNT(CASE WHEN event_name = 'payment_failed' THEN 1 END) * 1.0
    / COUNT(CASE WHEN event_name = 'checkout' THEN 1 END) AS payment_failure_rate
FROM events
GROUP BY device;
