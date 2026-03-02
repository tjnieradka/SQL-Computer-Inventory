# Finding Duplicate and Anomalous Data

This document demonstrates SQL patterns used to identify
duplicate or unexpected data conditions in the ComputerInventory database.

Although the schema is designed to prevent many duplication issues,
these queries are useful for validation, audits, and data quality checks.

## 1. Detect Computers Assigned to More Than One Employee (Logical Anomaly)

**Use case:**
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

**Expected result:**
No rows returned.

**Why check this?**
- Confirms enforcement of one-to-one assignment logic
- Helps validate data integrity after imports or updates

## 2. Detect Duplicate Asset Tags (Should Be Unique)

**Use case:**
Ensure that asset tags are not duplicated across computers.

```sql
SELECT
    CompAssetTag,
    COUNT(*) AS DuplicateCount
FROM Computer
GROUP BY CompAssetTag
HAVING COUNT(*) > 1;
```

**Expected result:**
No rows returned.

**Typical causes**
- Manual data entry errors
- Bulk insert mistakes
- Missing unique constraints

## 3. Detect Duplicate Serial Numbers (If Applicable)

**Use case:**
Identify computers sharing the same serial number.

```sql
SELECT
    CompSerial,
    COUNT(*) AS DuplicateCount
FROM Computer
WHERE CompSerial IS NOT NULL
GROUP BY CompSerial
HAVING COUNT(*) > 1;
```
**Expected result:** 
No rows returned.

**Notes**
- Serial numbers may be NULL.
- Non-NULL values are expected to be unique.
