SELECT * FROM users;


SELECT *
FROM users
WHERE active = true;


SELECT * 
FROM users 
WHERE city = 'Ankara';


SELECT * 
FROM products 
WHERE price > 1000;


SELECT * 
FROM products  
ORDER BY price DESC;


SELECT * 
FROM products  
ORDER BY price DESC;


SELECT COUNT(*) AS total_users
FROM users;


SELECT COUNT(*) AS active_users
FROM users
WHERE active = true;


SELECT city, COUNT(*) AS user_count
FROM users
GROUP BY city;


SELECT *
FROM products
WHERE stock = 0;


SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;