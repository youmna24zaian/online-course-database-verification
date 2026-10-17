# Online Course Database Verification

A small SQL Server exercise for inspecting the active database context and checking whether an `Online_Course` database and metadata entries named `Students` and `Enrollments` are visible. This repository documents and organizes the checks in the supplied `Exercise 3.sql`; it does not claim to implement a complete database test suite.

## What it verifies

The script performs these operations, in order:

1. Displays the name of the database currently selected by the connection (`DB_NAME()`).
2. Searches `sys.databases` for a database named `Online_Course`.
3. Attempts to select `Online_Course` with `USE Online_Course`.
4. Displays the selected database name again.
5. Lists schema and object names returned by `INFORMATION_SCHEMA.TABLES` for the names `Students` and `Enrollments`.

The final query returns matching metadata entries if found; it does **not** produce an explicit missing-object warning or a PASS/FAIL result. It also does not inspect columns, rows, data quality, constraints, keys, relationships, or application behavior. No execution results are included because the script has not been run against your SQL Server instance.

## Requirements

- A Microsoft SQL Server instance containing the target database, if you expect the database-selection and metadata steps to succeed.
- A SQL Server client such as SQL Server Management Studio (SSMS), Azure Data Studio, or `sqlcmd` that supports the `GO` batch separator.
- A login with permission to connect to the instance, see the relevant database metadata, and access `Online_Course`.

## Execution

1. Connect your SQL client to the intended SQL Server instance using your own credentials.
2. Open [`Exercise 3.sql`](Exercise%203.sql).
3. Review the target database name and confirm that running the `USE Online_Course` statement is appropriate for that connection.
4. Execute the script from top to bottom.
5. Review the result sets described below. Preserve the order and batch separators; `GO` is a client-side batch separator recognized by the listed tools, not a T-SQL statement sent to the server.

If `Online_Course` is absent or inaccessible, the `USE Online_Course` statement will fail. In that case, the subsequent database-context and metadata checks will not complete as intended. A row from `sys.databases` depends on the login's metadata visibility as well as the database's existence.

## Verification steps

- In the first result set, note the initial `CurrentDatabase` value.
- In the database lookup result, check whether `Online_Course` is returned. An empty result is not by itself proof that the database is absent if metadata visibility is restricted.
- If the `USE` statement succeeds, confirm the second `CurrentDatabase` value is `Online_Course`.
- In the final result set, compare the returned `TABLE_SCHEMA` / `TABLE_NAME` entries with the two names requested. Since the query only returns matches, an absent name will not appear as a separate failure row.
- Treat these as inspection results, not a comprehensive database validation or automated test verdict.

## Repository contents

- `Exercise 3.sql` — the supplied checks, grouped and commented without adding new queries.
- `screenshots/` — reserved for screenshots to be added later; no images are included.
- `.gitignore` — excludes common local editor and operating-system files.
