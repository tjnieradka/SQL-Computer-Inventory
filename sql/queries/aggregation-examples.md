# Aggregation Examples

This document demonstrates common aggregation patterns used to summarize and analyze inventory data in the ComputerInventory database.
The Ouput examples are from Microsoft SQL Server Managment Studio.
The focus is on realistic IT asset management reporting scenarios.

---

## 1. Count Computers by Status

**Use case:**  
Understand how many computers are active, retired, or in storage.

```sql
SELECT
    cs.StatusName,
    COUNT(*) AS ComputerCount
FROM Computer c
INNER JOIN CompStatus cs
    ON c.CompStatusID = cs.CompStatusID
GROUP BY cs.StatusName
ORDER BY ComputerCount DESC;
```
**Output**  

<img width="207" height="144" alt="image" src="https://github.com/user-attachments/assets/a545edf0-1ea0-48d5-bb85-795391fc9df8" />



**Key concept**
- GROUP BY aggregates rows into categories.
- COUNT(*) counts rows per group.

## 2. Count Computers by Office

**Use case:**
Determine how hardware is distributed across offices.

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
ORDER BY ComputerCount DESC;
```
**Output**  

<img width="234" height="219" alt="image" src="https://github.com/user-attachments/assets/07653f7c-b18e-43a5-81e0-8ddac2e45fcf" />



**Why INNER JOIN?**
- Only counts computers that are currently assigned to employees
- Avoids counting unassigned assets

## 3. Count Unassigned Computers

**Use case:**
Identify how many computers are not currently assigned to users.

```sql
SELECT
    COUNT(*) AS UnassignedComputerCount
FROM Computer
WHERE EmpID IS NULL;
```
**Output**  

<img width="194" height="65" alt="image" src="https://github.com/user-attachments/assets/afa56665-2785-4a86-93c1-ad1c76249d0d" />


**Typical scenarios**
- Spare inventory
- Recently returned devices
- Assets pending deployment

## 4. Count Software Installations per Computer

**Use case:**
- See how many software products are installed on each computer.

```sql
SELECT
    c.CompAssetTag,
    COUNT(cs.SwID) AS InstalledSoftwareCount
FROM Computer c
LEFT JOIN Computer_Software cs
    ON c.CompID = cs.CompID
GROUP BY c.CompAssetTag
ORDER BY InstalledSoftwareCount DESC;
```

**Output (only initial rows shown)**  

<img width="269" height="405" alt="image" src="https://github.com/user-attachments/assets/d7028b18-92e3-4ff0-9190-3bf7d910af7e" />


**Key concept**
- LEFT JOIN ensures computers with zero software are included
- COUNT(column) ignores NULL values

## Aggregation Summary

| Pattern           | Purpose                      |
|-------------------|------------------------------|
| COUNT(*)          | Count rows                   |
| GROUP BY          | Aggregate by category        |
| LEFT JOIN + COUNT | Include zero-related records |
| ORDER BY          | Rank results                 |

