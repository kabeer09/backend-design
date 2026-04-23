# API ↔ Database Interaction Mapping

## Overview

Each REST API endpoint translates into one or more **SQL operations** executed by the backend service.

---

#  USERS API

##  GET /users

**Purpose:** Fetch all users

### SQL

SELECT * FROM users;

### With filter

SELECT * FROM users WHERE city = 'Delhi';

---

##  GET /users/{id}

**Purpose:** Fetch a single user

### SQL

SELECT * FROM users WHERE id = 1;

---

##  GET /users/search?name=Amit

**Purpose:** Search users

### SQL

SELECT * FROM users WHERE name ILIKE '%AMIT%' 

---

##  POST /users

**Purpose:** Create a new user

### SQL

INSERT INTO users (name, email, city) VALUES ('KABIR','K@G.COM','DELHI');

### DB Interaction Notes

* Checks `UNIQUE(email)`
* Fails → `409 Conflict`

---

##  PUT /users/{id}

**Purpose:** Full update

### SQL

UPDATE users
SET NAME = 'KABIR', EMAIL = 'K@G.COM, CITY = 'DELHI'
WHERE id = 4 and id =5;

---

## 🔹 PATCH /users/{id}

**Purpose:** Partial update

UPDATE USERS
SET NAME = 'KABIR'
WHERE ID =4;

---

## 🔹 DELETE /users/{id}

### SQL

DELETE FROM users WHERE id = 1;



# PRODUCTS – API to SQL Mapping

## 🔹 GET /products

SELECT * FROM products;

---

## GET /products/{id}

SELECT * FROM products WHERE id = 1;

---

##  GET /products/search?name=lap

SELECT * FROM products WHERE name ILIKE '%LAP';

---

## 🔹 POST /products

INSERT INTO products (name, stock, price) VALUES (.....);

---

##  PUT /products/{id}

UPDATE products
SET name = LAMP, stock = 2, price = 500
WHERE id = 4;

---

## 🔹 DELETE /products/{id}

DELETE FROM products WHERE id = $1;

---

# ORDERS – API to SQL Mapping

## GET /orders

SELECT * FROM orders;

---

## 🔹 GET /orders/{id}

SELECT * FROM orders WHERE id = 1;

---

## 🔹 GET /orders/search?status=PENDING

SELECT * FROM orders WHERE status = 1;

---

## 🔹 POST /orders

**Purpose:** Create order with computed total

### Step-by-step DB interaction

#### 1. Validate user exists

SELECT id FROM users WHERE id = 1;

#### 2. Validate product + fetch price

SELECT price, stock FROM products WHERE id = 2;

#### 3. Check stock

* If stock < quantity → ❌ reject (409)

#### 4. Calculate total

```
total_amount = price * quantity
```

#### 5. Insert order

```sql
INSERT INTO orders (uid, pid, quantity, total_amount, status)
VALUES ($1, $2, $3, $4, 'PENDING');
```

#### 6. Update stock

```sql
UPDATE products
SET stock = stock - $1
WHERE id = $2;
```

---

## 🔹 PUT /orders/{id}

```sql
UPDATE orders
SET uid = $1,
    pid = $2,
    quantity = $3,
    total_amount = $4,
    status = $5
WHERE id = $6;
```

---

## 🔹 PATCH /orders/{id}


UPDATE orders
SET status = COALESCE($1, status)
WHERE id = $2;

---

##  DELETE /orders/{id}


DELETE FROM orders WHERE id = $1;


---

# Error Mapping

| Scenario           | SQL Issue              | API Response |
| ------------------ | ---------------------- | ------------ |
| Duplicate email    | UNIQUE violation       | 409          |
| User not found     | SELECT returns 0 rows  | 404          |
| Invalid data       | CHECK constraint fails | 400          |
| Stock insufficient | Business logic         | 409          |

---











