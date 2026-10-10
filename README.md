# SQL for QA – Database Validation Portfolio Project

## Project Overview

This project demonstrates basic SQL and database validation skills for software testing using PostgreSQL and pgAdmin.

The purpose of the project is to practice and demonstrate how SQL can be used by a QA tester to inspect data, validate business rules, verify relationships between tables, and identify data quality issues.

The project uses a simple e-commerce style database containing users, products, orders, and order items.

---

## Database Structure

The sample database contains the following tables:

- `users`
- `products`
- `orders`
- `order_items`

The tables are related using primary and foreign keys.

### Main Relationships

- `orders.user_id` → `users.id`
- `order_items.order_id` → `orders.id`
- `order_items.product_id` → `products.id`

---

## SQL Topics Practiced

The following SQL concepts were practiced during this project:

- SELECT
- WHERE
- ORDER BY
- COUNT
- GROUP BY
- HAVING
- JOIN
- LEFT JOIN
- NULL checks
- Duplicate data checks
- Basic data validation
- Referential integrity checks

---

## Basic Queries

Basic queries were created to retrieve and filter data.

Examples include:

- Get all users
- Get active users
- Get users from a specific city
- Get products above a specific price
- Sort products by price
- Count all users
- Count active users
- Count users by city
- Find out-of-stock products
- Count orders by status

Example:

```sql
SELECT *
FROM users
WHERE active = true;
```

Example with sorting:

```sql
SELECT *
FROM products
WHERE price > 1000
ORDER BY price DESC;
```

---

## JOIN Examples

JOIN queries were used to validate relationships between different tables.

Examples include:

- Display orders together with customer information
- Display order items together with product names
- Display customer, order, product, quantity, and price information in a single result

Example:

```sql
SELECT
    orders.id AS order_id,
    users.first_name,
    users.last_name,
    orders.order_date,
    orders.status
FROM orders
JOIN users
    ON orders.user_id = users.id;
```

Example using multiple JOINs:

```sql
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
```

---

## QA Validation Queries

SQL queries were also created specifically for data validation and software testing purposes.

### Duplicate Email Check

```sql
SELECT email, COUNT(*) AS duplicate_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
```

Purpose: Verify that duplicate customer email addresses do not exist.

### Missing Email Check

```sql
SELECT *
FROM users
WHERE email IS NULL;
```

Purpose: Identify users with missing email data.

### Negative Stock Check

```sql
SELECT *
FROM products
WHERE stock < 0;
```

Purpose: Verify that product stock values cannot become negative.

### Invalid Quantity Check

```sql
SELECT *
FROM order_items
WHERE quantity <= 0;
```

Purpose: Identify invalid order item quantities.

### Missing Product Reference Check

```sql
SELECT oi.*
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.id
WHERE p.id IS NULL;
```

Purpose: Identify order items that reference a product that does not exist.

---

## Tools Used

- PostgreSQL
- pgAdmin
- Visual Studio Code
- Git
- GitHub
- SQL

---

## Repository Structure

```text
sql-for-qa
│
├── README.md
│
├── database
│   └── sample-database.sql
│
└── queries
    ├── basic-queries.sql
    ├── joins.sql
    └── validation-queries.sql
```

---

## What I Learned

During this project, I practiced how to:

- Create a simple relational database
- Insert sample test data
- Retrieve records using SELECT
- Filter data using WHERE
- Sort results using ORDER BY
- Count and group records using COUNT and GROUP BY
- Use HAVING to identify duplicate data
- Combine related tables using JOIN
- Use LEFT JOIN to identify missing relationships
- Validate data using SQL
- Detect NULL values and invalid records
- Check basic business rules directly in the database
- Use SQL as a QA testing tool

---

## Project Status

Completed.

This project represents my third QA portfolio project and focuses on SQL and database validation.

It follows my manual testing and API testing projects and will be followed by projects focusing on broader QA case studies and test automation.
