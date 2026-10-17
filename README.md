
# Exercise 3 — Online Course Database

![Exercise 3 Banner](Images/exercise-3-banner.png)

## 📌 Project Overview

This project demonstrates SQL Server fundamentals through an Online Course Database exercise. It covers database creation, table relationships, sample data insertion, data filtering, aggregate functions, grouping, and subqueries.

The database consists of two related tables: `Students` and `Enrollments`.

## 🎯 Objectives

- Create and use a SQL Server database.
- Create tables and define primary and foreign key constraints.
- Insert sample student and enrollment records.
- Retrieve and filter data using SQL queries.
- Apply aggregate functions and grouping.
- Filter grouped results using `HAVING`.
- Use subqueries to answer data-related questions.

## 📁 Repository Structure

```text
Exercise 3/
├── Images/
│   ├── exercise-3-banner.png
│   ├── exercise-3-workflow.png
│   ├── exercise-3-concepts.png
│   └── exercise-3-showcase.png
├── Exercise 3.sql
├── .gitignore
└── README.md
```

## 🛠️ Tools and Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Transact-SQL (T-SQL)

## 🗄️ Database Design

The exercise uses two tables.

### 1. Students

Stores student information:

- `StudentID` — Primary key
- `FirstName` — Student's first name
- `LastName` — Student's last name
- `Age` — Student's age
- `City` — Student's city
- `GPA` — Grade Point Average

### 2. Enrollments

Stores course enrollment information:

- `EnrollmentID` — Primary key
- `StudentID` — References the corresponding student
- `CourseName` — Course name
- `Grade` — Grade received
- `Fee` — Course fee
- `Semester` — Enrollment semester

The `StudentID` foreign key connects `Enrollments` to `Students`, establishing a relationship between students and their course enrollments.

## 🔄 SQL Workflow

![SQL Workflow](Images/exercise-3-workflow.png)

The script follows these steps:

1. Create the `Online_Course` database.
2. Select the database for subsequent operations.
3. Create the `Students` and `Enrollments` tables.
4. Define the foreign key relationship.
5. Insert sample records into both tables.
6. Execute SQL queries to retrieve and analyze data.

## 📚 SQL Concepts Covered

![SQL Concepts](Images/exercise-3-concepts.png)

| SQL Concept | Application |
|---|---|
| Database Operations | `CREATE DATABASE`, `USE` |
| Table Creation | `CREATE TABLE` |
| Constraints | Primary keys, foreign keys, `NOT NULL` |
| Data Insertion | `INSERT INTO` |
| Filtering | `WHERE`, `AND`, `OR` |
| Sorting | `ORDER BY` |
| Unique Values | `DISTINCT` |
| Limiting Results | `TOP` |
| Aggregate Functions | `AVG`, `MAX`, `MIN`, `COUNT` |
| Grouping | `GROUP BY`, `HAVING` |
| Subqueries | Nested `SELECT` statements |

## 🔍 Query Highlights

The exercise includes queries to:

- Retrieve students with a GPA greater than 3.00.
- Filter students by city and age.
- Display unique city names in alphabetical order.
- Retrieve the three students with the highest GPAs.
- Calculate the average, highest, and lowest GPAs.
- Calculate the average grade for each course.
- Count enrollments for courses with more than three enrollments.
- Find students older than the average student age.
- Compare student GPAs with the average GPA of students living in Cairo.
- Find students with an enrollment grade above the overall average grade.

## 🖼️ Project Visual Showcase

![Project Showcase](Images/exercise-3-showcase.png)

## ▶️ How to Run

1. Open SQL Server Management Studio (SSMS).
2. Connect to a SQL Server instance.
3. Open `Exercise 3.sql`.
4. Execute the script.
5. Review the query results in the Results grid.

**Note:** The script begins with `CREATE DATABASE Online_Course`. If the database already exists, SQL Server will return an error. Run the script on a suitable SQL Server instance where the database does not already exist, or handle the existing database before rerunning it.

## 📈 Learning Outcomes

By completing this exercise, I practiced:

- Creating relational database tables.
- Defining primary and foreign key constraints.
- Inserting and querying structured data.
- Applying filtering and sorting conditions.
- Using aggregate functions and grouped queries.
- Writing subqueries to solve more complex data retrieval tasks.

## 👩‍💻 Author

**Youmna Zaian**

Computer Engineering Graduate | AI & Machine Learning
