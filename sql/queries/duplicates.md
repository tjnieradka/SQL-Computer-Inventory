# Finding Duplicate and Anomalous Data

This document demonstrates SQL patterns used to identify
duplicate or unexpected data conditions in the ComputerInventory database.

Although the schema is designed to prevent many duplication issues,
these queries are useful for validation, audits, and data quality checks.

1. Detect Computers Assigned to More Than One Employee (Logical Anomaly)

Use case:
Verify that no computer asset is associated with more than one employee.

In this schema, each computer should be assigned to at most one employee.

```sql
SELECT
    CompAssetTag,
    COUNT(DISTINCT EmpID) AS AssignedEmployeeCount
FROM Computer
WHERE EmpID IS NOT NULL
GROUP BY CompAssetTag
HAVING COUNT(DISTINCT EmpID) > 1;
```

Expected result:
No rows returned.

Why this matters
- Confirms enforcement of one-to-one assignment logic
- Helps validate data integrity after imports or updates
