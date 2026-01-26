/* ============================================================
   PURPOSE: Drop all tables in the ComputerInventory database
   WARNING: This script is DESTRUCTIVE
            All tables and data will be permanently deleted.

   USE CASES:
   - Resetting the schema without dropping the database
   - Re-running CREATE TABLE scripts
   - Learning / reference purposes

   BEHAVIOR:
   - Drops all foreign key constraints
   - Drops all user tables
   - Leaves the database intact

   NOTES:
   - System tables are not affected
   - Database itself is NOT dropped
============================================================ */

USE ComputerInventory;
GO

/* ============================================================
   Step 1: Drop all foreign key constraints
============================================================ */

DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql +=
    N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) +
    N'.' + QUOTENAME(OBJECT_NAME(parent_object_id)) +
    N' DROP CONSTRAINT ' + QUOTENAME(name) + N';' + CHAR(13)
FROM sys.foreign_keys;

EXEC sp_executesql @sql;
GO

/* ============================================================
   Step 2: Drop all user tables
============================================================ */

SET @sql = N'';

SELECT @sql +=
    N'DROP TABLE ' + QUOTENAME(SCHEMA_NAME(schema_id)) +
    N'.' + QUOTENAME(name) + N';' + CHAR(13)
FROM sys.tables;

EXEC sp_executesql @sql;
GO
