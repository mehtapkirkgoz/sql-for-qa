CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    active BOOLEAN
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INTEGER
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    order_date DATE,
    status VARCHAR(30)
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER,
    unit_price DECIMAL(10, 2)
);


INSERT INTO users (first_name, last_name, email, city, active) VALUES
('Mehtap', 'Kirkgoz', 'mehtap@example.com', 'Ankara', true),
('Ali', 'Yilmaz', 'ali@example.com', 'Istanbul', true),
('Ayse', 'Demir', 'ayse@example.com', 'Izmir', false),
('Can', 'Kaya', 'can@example.com', 'Ankara', true);

INSERT INTO products (name, price, stock) VALUES
('Keyboard', 1200.00, 10),
('Mouse', 650.00, 25),
('Monitor', 7500.00, 5),
('USB Cable', 150.00, 0);

INSERT INTO orders (user_id, order_date, status) VALUES
(1, '2026-10-01', 'Completed'),
(2, '2026-10-02', 'Pending'),
(1, '2026-10-03', 'Cancelled'),
(4, '2026-10-04', 'Completed');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 2, 650.00),
(2, 3, 1, 7500.00),
(3, 4, 3, 150.00),
(4, 2, 1, 650.00);