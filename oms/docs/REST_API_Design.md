# REST API Design – Order Management System (OMS)

## Overview

This document defines the REST API for managing:

* Users
* Products
* Orders

---

##  Base URL

### baseurl: http://localhost:8080/endpoint

---

##  Resource Structure

| Resource    | Description     |
| ----------- | --------------- |
| `/users`    | Manage users    |
| `/products` | Manage products |
| `/orders`   | Manage orders   |

### SQL Intent

* SELECT * FROM USERS;,
* SELECT * FROM PRODUCTS;
* SELECT * FROM ORDERS;

---

#  USERS API

## List Users 

**GET** `/users?city=Delhi`

### SQL Intent

* SELECT * FROM users WHERE city = 'Delhi';

### Response

 {
    "id": 1,
    "name": "Amit Sharma",
    "email": "amit@gmail.com",
    "city": "Delhi"
  }


---

## Get User by ID

**GET** `/users/{id}`

### SQL

SELECT * FROM users WHERE id = 1;

### Response

{
  "id": 1,
  "name": "Amit Sharma",
  "email": "amit@gmail.com",
  "city": "Delhi"
}

### Errors

* `404 Not Found`

---

## Search Users

**GET** `/users/search?name=Amit`

SELECT * FROM users WHERE name ILIKE '%Amit%';

---

## Create User

**POST** `/users`

### Request

{
  "name": "John Doe",
  "email": "john@gmail.com",
  "city": "Delhi"
}

### SQL

INSERT INTO users (name, email, city) VALUES (...);

### Response

* `204 No Content`

### Errors

* `400 Bad Request`
* `409 Conflict` (duplicate email)

---

## 🔹 Update User (Full)

**PUT** `/users/{id}`

UPDATE users SET name=?, email=?, city=? WHERE id=?;

---

##  Update User (Partial)

**PATCH** `/users/{id}`

UPDATE users SET name=? WHERE id=?;
`

---

## 🔹 Delete User

**DELETE** `/users/{id}`

DELETE FROM users WHERE id=?;

### Response

* `204 No Content`

---

#  PRODUCTS API

##  List Products

**GET** `/products`

SELECT * FROM products;

---

##  Get Product

**GET** `/products/{id}`

---

##  Search Products

**GET** `/products/search?name=lap`

SELECT * FROM products WHERE name ILIKE '%lap%';

---

##  Create Product

**POST** `/products`

### Request

{
  "name": "Laptop",
  "stock": 10,
  "price": 50000
}

### Response

* `204 No Content`

---

## 🔹 Update Product

**PUT** `/products/{id}`

---

## 🔹 Partial Update

**PATCH** `/products/{id}`

---

## 🔹 Delete Product

**DELETE** `/products/{id}`

---

#  ORDERS API

##  List Orders

**GET** `/orders`

SELECT * FROM orders;

---

##  Get Order

**GET** `/orders/{id}`

---

## Search Orders

**GET** `/orders/search?status=PENDING`

SELECT * FROM orders WHERE status = 'PENDING';

---

##  Create Order

**POST** `/orders`

### Request

{
  "uid": 1,
  "pid": 2,
  "quantity": 2
}

### Response

* `204 No Content`

### Errors

* `400 Bad Request`
* `404 User/Product Not Found`
* `409 Conflict (insufficient stock)`

---

##  Update Order

**PUT** `/orders/{id}`

---

##  Partial Update

**PATCH** `/orders/{id}`

---

##  Delete Order

**DELETE** `/orders/{id}`

---

# HTTP Status Codes

| Code | Meaning                 |
| ---- | ----------------------- |
| 200  | OK                      |
| 201  | Created (not used here) |
| 204  | No Content              |
| 400  | Bad Request             |
| 404  | Not Found               |
| 409  | Conflict                |
| 500  | Internal Server Error   |

---

#  Error Response Format

{
  "error": "Invalid input",
  "message": "Email already exists"
}

---

#  Validation Rules

* Email must be unique
* Stock ≥ 0
* Quantity > 0
* Status must be valid enum

---

# Relationships

* One user → many orders
* One product → many orders

---
