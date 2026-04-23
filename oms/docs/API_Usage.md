# API ↔ Database Interaction Mapping

## Overview

Each REST API endpoint translates into one or more **SQL operations** executed by the backend service.

---

#  USERS API

##  GET /users

---

##  GET /users/{id}

### SQL

SELECT * FROM users WHERE id = 1;

---

##  GET /users/search?name=Amit


### SQL

SELECT * FROM users WHERE name ILIKE '%AMIT%' 

---


---

##  PUT /users/{id}


### SQL

UPDATE users
SET NAME = 'KABIR', EMAIL = 'K@G.COM, CITY = 'DELHI'
WHERE id = 4 and id =5;

---

## 🔹 PATCH /users/{id}


UPDATE USERS
SET NAME = 'KABIR'
WHERE ID =4;

---

##  DELETE /users/{id}

### SQL

DELETE FROM users WHERE id = 1;



# PRODUCTS – API to SQL Mapping

##  GET /products

SELECT * FROM products;

---

## GET /products/{id}

SELECT * FROM products WHERE id = 1;

---

##  GET /products/search?name=lap

SELECT * FROM products WHERE name ILIKE '%LAP';

---

##  POST /products

INSERT INTO products (name, stock, price) VALUES (.....);

---

##  PUT /products/{id}

UPDATE products
SET name = LAMP, stock = 2, price = 500
WHERE id = 4;

---

##  DELETE /products/{id}

DELETE FROM products WHERE id = $1;

---

# ORDERS – API to SQL Mapping

## GET /orders

SELECT * FROM orders;

---

## GET /orders/{id}

SELECT * FROM orders WHERE id = 1;

---

## 🔹 GET /orders/search?status=PENDING

SELECT * FROM orders WHERE status = 1;

---

#### 5. Insert order

INSERT INTO ORDERS (UID, PID, QUANTITY, TOTAL_AMOUNT, STATUS)
VALUES
(1,2,2,1000,'PENDING'),
(1,3,3,1200,'PENDING'),
(2,4,2,15000,'SHIPPED'),
(2,5,3,10000,'SHIPPED');

#### 6. Update stock


UPDATE products
SET stock = stock - $1
WHERE id = $2;


---

##  PUT /orders/{id}

UPDATE orders
SET uid = 1,
    pid = 2,
    quantity = 3,
WHERE id = 6;


---

##  PATCH /orders/{id}


UPDATE orders
SET status = COALESCE(1, status)
WHERE id = 2;

---

##  DELETE /orders/{id}


DELETE FROM orders WHERE id = 1;


---

# Error Mapping

| Scenario           | SQL Issue              | API Response |
| ------------------ | ---------------------- | ------------ |
| Duplicate email    | UNIQUE violation       | 409          |
| User not found     | SELECT returns 0 rows  | 404          |
| Invalid data       | CHECK constraint fails | 400          |
| Stock insufficient | Business logic         | 409          |

---











