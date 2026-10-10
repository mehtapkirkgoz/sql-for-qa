SELECT 
    orders.user_id AS order_id,
    users.first_name,
    users.last_name,
    orders.order_date,
    orders.status
FROM orders
JOIN users
    ON orders.user_id = users.id;


SELECT
    order_items.order_id,
    products.name AS product_name,
    order_items.quantity,
    order_items.unit_price
FROM order_items
JOIN products
    ON order_items.product_id = products.id;


SELECT
    users.first_name,
    users.last_name,
    orders.id AS order_id,
    products.name AS product_name,
    order_items.quantity,
    order_items.unit_price
FROM order_items
JOIN orders
    ON order_items.order_id = orders.id
JOIN users
    ON orders.user_id = users.id
JOIN products
    ON order_items.product_id = products.id;