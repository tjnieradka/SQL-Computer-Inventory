/* ============================================================
   REPORTING VIEWS

   PURPOSE: Create reporting views for the ComputerInventory database

   CONTEXT:
   - TN Global Technologies (Fictional)
   - IT Asset & Computer Inventory reporting examples

   USE CASES:
   - Standardized asset reporting
   - Inventory summaries
   - Audit and validation scenarios
   - Business-facing data consumption

   NOTES:
   - Views encapsulate commonly used joins and aggregations
   - Designed for clarity and demonstration purposes
============================================================ */


-- ============================================================
-- View 1: Computer Inventory
-- ============================================================
-- Purpose: Standard inventory report

CREATE VIEW vw_ComputerInventory
AS

SELECT
    c.CompAssetTag,
    c.CompModel,
    cs.StatusName AS ComputerStatus,
    v.VenName AS Vendor,
    t.CompTypeName AS ComputerType,
    r.RAMGB AS RAM_GB
FROM Computer c
INNER JOIN CompStatus cs
    ON c.CompStatusID = cs.CompStatusID
INNER JOIN Vendor v
    ON c.VenID = v.VenID
INNER JOIN CompType t
    ON c.CompTypeID = t.CompTypeID
INNER JOIN CompRAM r
    ON c.CompRAMID = r.CompRAMID;

GO

-- ============================================================
-- View 2: Computer Assignments
-- ============================================================
-- Purpose: Who has what device


CREATE VIEW vw_ComputerAssignments
AS

SELECT
    c.CompAssetTag,
    c.CompModel,
    e.EmpFirst,
    e.EmpLast,
    o.OfficeName
FROM Computer c
LEFT JOIN Employee e
    ON c.EmpID = e.EmpID
LEFT JOIN EmpOffice o
    ON e.EmpOfficeID = o.EmpOfficeID;

GO

-- ============================================================
-- View 3: Computer Software
-- ============================================================
-- Purpose: Software per computer

CREATE VIEW vw_ComputerSoftware
AS

SELECT
    c.CompAssetTag,
    s.SwTitle,
    s.SwVer
FROM Computer c
INNER JOIN Computer_Software cs
    ON c.CompID = cs.CompID
INNER JOIN Software s
    ON cs.SwID = s.SwID;

GO

-- ============================================================
-- View 4: Office Asset Summary
-- ============================================================
-- Purpose: Aggregate view


CREATE VIEW vw_OfficeAssetSummary
AS
SELECT
    o.OfficeName,
    COUNT(c.CompID) AS ComputerCount
FROM Computer c
INNER JOIN Employee e
    ON c.EmpID = e.EmpID
INNER JOIN EmpOffice o
    ON e.EmpOfficeID = o.EmpOfficeID
GROUP BY o.OfficeName;
GO