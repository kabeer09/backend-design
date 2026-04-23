# 🛒 Order Management System (OMS)

## 📌 Overview

This project is a **backend-ready Order Management System** designed using **PostgreSQL, Docker, and REST API principles**.
It demonstrates database design, SQL operations, containerization, and API structure (without application code).

---

## 🎯 Features

* Relational database design (users, products, orders)
* PostgreSQL schema with constraints
* Seed data for testing
* SQL queries (CRUD + advanced)
* Dockerized setup (auto initialization)
* REST API design (documented)
* Postman collection for API testing
* Clean Git workflow with feature branches

---

## 🧱 Tech Stack

* Database: PostgreSQL
* Containerization: Docker, Docker Compose
* API Design: REST
* Version Control: Git

---

## 📁 Project Structure

```
order-management-system/
│
├── db/
│   ├── schema.sql
│   ├── seed.sql
│   ├── queries.sql
│
├── docs/
│   ├── Database_Design.md
│   ├── REST_API_Design.md
│   ├── API_Usage.md
│
├── postman/
│   └── OMS_Postman_Collection.json
│
├── docker-compose.yml
└── README.md
```

---

## 🐳 Docker Setup (Run Project)

### ▶️ Start the system

```
docker-compose up
```

### 🔁 Stop the system

```
docker-compose down
```

---

## ⚙️ What Happens Automatically

* PostgreSQL database is created
* Tables are initialized from `schema.sql`
* Sample data is inserted from `seed.sql`

👉 No manual SQL execution required.

---

## 🔌 Database Connection

You can connect using:

* pgAdmin or DBeaver

### Connection Details:

```
Host: localhost
Port: 5432
Database: oms_db
User: postgres
Password: postgres
```

---

## 🗄️ Database Design

### Tables:

* **users**
* **products**
* **orders**

### Relationships:

* One user → many orders (1:N)
* One product → many orders (1:N)

### Constraints:

* Primary Keys
* Foreign Keys
* UNIQUE (email)
* CHECK (price > 0, quantity > 0)

---

## 🧾 SQL Queries

Located in:

```
db/queries.sql
```

Includes:

* CRUD operations
* Search queries
* JOIN queries
* GROUP BY aggregations

---

## 🌐 REST API Design

Documentation:

```
docs/REST_API_Design.md
```

### Key APIs:

* Users: Create, List, Get by ID
* Products: List, Search
* Orders: Create, Update, Delete

---

## 📡 API Usage Mapping

```
docs/API_Usage.md
```

Explains how each API maps to SQL queries.

---

## 📮 Postman Collection

Located in:

```
postman/OMS_Postman_Collection.json
```

### Features:

* Organized endpoints
* Sample requests
* Environment variables (`{{base_url}}`)

---

## 🔄 Git Workflow

* Feature-based branching:

  * `feature/schema`
  * `feature/queries`
  * `feature/docker`
* Incremental commits with clear messages

---

## 🧠 Key Concepts Demonstrated

* Database normalization
* SQL joins and aggregations
* Docker containerization
* Environment configuration
* API design principles

---

## 🚀 How to Run (Quick Start)

```
git clone <your-repo-url>
cd order-management-system
docker-compose up
```

---

## ✅ Evaluation Highlights

* Fully Dockerized PostgreSQL setup
* Auto-initialized database (schema + seed)
* Clean Git history with branches
* Well-structured API design
* Ready-to-use Postman collection

---

## 📌 Author

Kabeer Ahmed
