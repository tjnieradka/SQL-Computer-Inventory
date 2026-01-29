# Search and Filtering Examples

This document demonstrates common SQL filtering and search techniques used to query the ComputerInventory database.

The focus is on readability, correctness, and realistic reporting scenarios.

## 1. Basic Filtering with WHERE

The WHERE clause is used to filter rows before results are returned.

**Example: Find active computers**

```sql
SELECT
    CompAssetTag,
    CompModel
FROM Computer
WHERE CompStatusID = 1;
```
**Output (initial rows shown)**  
<img width="261" height="330" alt="image" src="https://github.com/user-attachments/assets/d78495a3-b230-4a5a-8aa0-cf7e32bfdc15" />

## 2. Searching with LIKE

LIKE is used for partial text searches.

**Example: Find computers by asset tag prefix**

```sql
SELECT
    CompAssetTag,
    CompModel
FROM Computer
WHERE CompAssetTag LIKE 'TN%';
```

**Output (initial rows shown)**  

<img width="254" height="400" alt="image" src="https://github.com/user-attachments/assets/3cdb6569-d9ef-471e-a850-ac937ac8250b" />

## 3. Using BETWEEN for Ranges

BETWEEN can be used safely with fixed-format, zero-padded values.

**Example: Find computers with asset tages BETWEEN 'TN000080' and 'TN000090'**

```sql

SELECT
    CompAssetTag,
    CompModel
FROM Computer
WHERE CompAssetTag BETWEEN 'TN000080' AND 'TN000090';
```

**Output**  

<img width="263" height="259" alt="image" src="https://github.com/user-attachments/assets/2fa86f8d-cc63-43bf-9752-5479c5ed4b54" />

## 4. Handling NULL Values

NULL represents missing or unknown data.

**Example: Find computers where employee ID is missing (i.e., not assigned to any employee)**

```sql
SELECT
    CompAssetTag,
    CompModel
FROM Computer
WHERE EmpID IS NULL;
```

**Output**  

<img width="260" height="105" alt="image" src="https://github.com/user-attachments/assets/3a46084a-0135-4cf5-9012-a196b545baf5" />

## 5. Filtering Aggregated Results with HAVING

HAVING is used to filter results after aggregation.

**Example: Show count of computers at each office for offices with more than 5 computers**

```sql
SELECT
    o.OfficeName,
    COUNT(c.CompID) AS ComputerCount
FROM Computer c
INNER JOIN Employee e
    ON c.EmpID = e.EmpID
INNER JOIN EmpOffice o
    ON e.EmpOfficeID = o.EmpOfficeID
GROUP BY o.OfficeName
HAVING COUNT(c.CompID) > 5;
```
**Output**  

<img width="228" height="205" alt="image" src="https://github.com/user-attachments/assets/3cd67d10-2233-4aa8-bca1-6b53ab560fc4" />

## 6. Logical Order of SQL Query Processing

Although SQL queries are written top-to-bottom, they are processed in a different logical order by the database engine:

1. FROM
2. JOIN
3. WHERE
4. GROUP BY
5. HAVING
6. SELECT
7. ORDER BY

NOTES:
- Column aliases cannot be used in WHERE
- Aggregation happens before SELECT output
- Filtering aggregated data requires HAVING

## 7. Search & Filtering Summary

| Pattern | Purpose |
|-------|---------|
| WHERE | Filter rows |
| LIKE | Partial text search |
| BETWEEN | Range filtering |
| IS NULL | Find missing values |
| HAVING | Filter aggregated results |
