# Library Management Database (MySQL 8)

## 📌 Overview
This project is a **relational database system** for managing a library.  
It tracks **members, staff, books, authors, categories, copies, and loans**.  
The database is designed with proper **constraints**, **relationships**, and **sample data inserts**.

---

## 🗄️ Features
- Members and staff management.
- Book categories and author tracking.
- Many-to-many relationship between books and authors.
- Copies of books and their availability.
- Loan management with due dates and return tracking.
- Constraints to ensure **data integrity** (primary keys, foreign keys, unique, not null).

---

## ⚙️ Requirements
- **MySQL 8.0+**
- Any MySQL client (CLI, MySQL Workbench, phpMyAdmin, etc.)

  ```sql
   SOURCE library_management.sql;
