# Database Design – Order Management System (PostgreSQL)

## Overview

This database is designed for an **Order Management System (OMS)**.
It consists of three main entities:

* Users
* Products
* Orders

The design ensures **data integrity**, **relationships**, and **scalability**.

---

##  ERD (Entity Relationship Diagram)

![ERD Diagram](../docs/OMSER.pgerd.png)

### Relationships:

* One **User** can place many **Orders** (1 → N)
* One **Product** can appear in many **Orders** (1 → N)

---

##  Table Definitions

###  users

id |     name     |       email       |  city   
----+--------------+-------------------+---------
  1 | Amit Sharma  | amit@gmail.com    | Delhi
  2 | Ravi Kumar   | ravi@gmail.com    | Mumbai
  3 | Sneha Singh  | sneha@gmail.com   | Lucknow
  4 | Priya Verma  | priya@gmail.com   | Jaipur
  5 | Rahul Yadav  | rahul@gmail.com   | Delhi
  6 | Anjali Gupta | anjali@gmail.com  | Mumbai
  7 | Vikas Mehta  | vikas@gmail.com   | Pune
  8 | Neha Kapoor  | neha@gmail.com    | Delhi
  9 | Arjun Das    | arjun@gmail.com   | Bhopal
 10 | Kiran Joshi  | kiranji@gmail.com | Mumbai

 **PRIMARY KEY: ID**

---

###  products

 id |    name    | stock |  price   
----+------------+-------+----------
  1 | Laptop     |    10 | 50000.00
  2 | Mobile     |    20 | 20000.00
  3 | Headphones |    30 |  2000.00
  4 | Keyboard   |    25 |  1500.00
  5 | Mouse      |    40 |   800.00
  6 | Monitor    |    15 | 12000.00
  7 | Printer    |     8 |  7000.00
  8 | Tablet     |    12 | 18000.00
  9 | Camera     |     5 | 45000.00
 10 | Speaker    |    18 |  3000.00

 **PRIMARY KEY: ID**

---

###  orders

 id | uid | pid | quantity | total_amount |  status   
----+-----+-----+----------+--------------+-----------
  1 |   1 |   1 |        1 |     50000.00 | PENDING
  2 |   2 |   2 |        2 |     40000.00 | COMPLETED
  3 |   3 |   3 |        3 |      6000.00 | PENDING
  4 |   4 |   4 |        1 |      1500.00 | SHIPPED
  5 |   5 |   5 |        2 |      1600.00 | PENDING
  6 |   6 |   6 |        1 |     12000.00 | COMPLETED
  7 |   7 |   7 |        1 |      7000.00 | CANCELLED
  8 |   8 |   8 |        2 |     36000.00 | PENDING
  9 |   9 |   9 |        1 |     45000.00 | SHIPPED
 10 |  10 |  10 |        3 |      9000.00 | COMPLETED

**PRIMARY KEY: ID**
**FOREIGN KEY: UID(USERS)**
**FOREIGN KEY: PID(PRODUCTS)**

---

### Primary Keys

* users.id
* products.id
* orders.id

### Foreign Keys

* orders.uid → users.id
* orders.pid → products.id

---

##  Relationships

| Relationship      | Description                       |
| ----------------- | --------------------------------- |
| Users → Orders    | One user can have many orders     |
| Products → Orders | One product can be in many orders |

---

##  Constraints

### users

* `NOT NULL`: name, email, city
* `UNIQUE`: email

### products

* `NOT NULL`: name, stock, price
* `CHECK`: stock ≥ 0
* `CHECK`: price > 0

### orders

* `NOT NULL`: uid, pid, quantity, total_amount, status
* `CHECK`: quantity > 0
* `CHECK`: status must be valid
* `FOREIGN KEY`: ensures valid user & product
