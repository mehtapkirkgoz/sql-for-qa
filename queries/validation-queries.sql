SELECT email, COUNT(*) AS duplicate_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;


SELECT *
FROM users
WHERE email IS NULL;


SELECT *
FROM products
WHERE stock < 0;


SELECT *
FROM order_items
WHERE quantity <= 0;


SELECT oi.*
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.id
WHERE p.id IS NULL;