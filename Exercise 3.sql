-- =============================================================
-- Project: Online Course Database
-- Exercise 3: Database Verification
--
-- Scope: inspect the active database context, look for the
-- Online_Course database, switch to it, and list matching
-- Students / Enrollments metadata entries.
--
-- This script reports query results; it does not assert PASS/FAIL,
-- inspect table columns or data, or validate relationships.
-- =============================================================

-- 1. Show the database currently selected for this connection.
SELECT DB_NAME() AS CurrentDatabase;
GO

-- 2. Look for Online_Course on the connected SQL Server instance.
-- No row is returned if the database is not visible or does not exist.
SELECT name
FROM sys.databases
WHERE name = 'Online_Course';
GO

-- 3. Select the database for the subsequent metadata lookup.
-- This statement fails if Online_Course is unavailable to this login.
USE Online_Course;
GO

-- 4. Display the current database again to show the selected context.
SELECT DB_NAME() AS CurrentDatabase;
GO

-- 5. List matching metadata entries for these two names, if present.
-- This is an inventory query, not an assertion that both must exist.
SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME IN ('Students', 'Enrollments');
GO
