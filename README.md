# LeetCode SQL Practice Solutions

This repository contains my personal solutions to **LeetCode Database (SQL) Problems**.  
It is meant as a record of my practice and also as a resource for anyone wanting to study common SQL interview questions.

---

## 📌 About

- Problems are from [LeetCode Database Section](https://leetcode.com/problemset/database/).
- All solutions are written in **Standard SQL** syntax (some queries may need small adjustments for different RDBMS like MySQL, PostgreSQL, or SQL Server).
- Topics covered include:
  - SELECT statements
  - JOINs
  - GROUP BY and aggregates
  - Subqueries
  - Window functions (planned)

---

## 🗂️ Repository Structure

- All solutions are currently stored in a single SQL script file:
  - [`LeetCode.sql`](./LeetCode.sql)
- Each problem solution is marked with comments indicating:
  - Problem title
  - LeetCode link

Example in the SQL file:
```sql
-- 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);
