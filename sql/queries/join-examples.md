
# Join Examples

## INNER JOIN

### Find Computers Assigned to Employees at a Specific Office

**Use case:**
View all computers assigned to employees in a given office (e.g., Vancouver).
```
USE ComputerInventory;
GO
SELECT
    c.CompAssetTag,
    c.CompModel,
    e.EmpFirst,
    e.EmpLast,
    o.OfficeName
FROM Computer c
INNER JOIN Employee e
    ON c.EmpID = e.EmpID
INNER JOIN EmpOffice o
    ON e.EmpOfficeID = o.EmpOfficeID
WHERE o.OfficeName = 'Vancouver'
ORDER BY e.EmpLast;
```
**Output**  

<img width="447" height="453" alt="image" src="https://github.com/user-attachments/assets/2529459f-0a1d-4174-be22-ba45cb34a8e2" />


**Why INNER JOIN?**
- Only returns records where relationships exist
- Appropriate when assignments are required


## LEFT JOIN

### Find All Computers and Their Assigned Users 

**Use case:**
List computers between asset tags of TN000080 and TN000100, including those that are not currently assigned to an employee.
```


USE ComputerInventory;
GO

SELECT
    c.CompID,
    c.CompAssetTag,
    c.CompModel,
    e.EmpFirst,
    e.EmpLast
FROM Computer c
LEFT JOIN Employee e
    ON c.EmpID = e.EmpID
WHERE c.CompAssetTag BETWEEN 'TN000080' AND 'TN000100'
ORDER BY c.CompID;
```

**Output**  

<img width="452" height="454" alt="image" src="https://github.com/user-attachments/assets/ec5d45a9-1d7f-43b5-8520-89b80e1f33a2" />


**Why LEFT JOIN?**
- Ensures computers without assigned users are still returned
- Common for inventory completeness checks



## Many-to-Many

### Find All Software Installed on Each Computer (Many-to-Many)

**Use case:**
Report installed software per computer using a junction table.

```
SELECT
    c.CompAssetTag,
    s.SwTitle,
    s.SwVer
FROM Computer c
INNER JOIN Computer_Software cs
    ON c.CompID = cs.CompID
INNER JOIN Software s
    ON cs.SwID = s.SwID
ORDER BY c.CompAssetTag, s.SwTitle;
```
**Output (Partial shown)** 

<img width="402" height="402" alt="image" src="https://github.com/user-attachments/assets/f017d7bd-4267-44ab-9476-3e6b9a665cd9" />



**Key concept**
- Demonstrates many-to-many relationships
- Common in software asset management

