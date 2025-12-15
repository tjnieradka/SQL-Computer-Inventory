/* ============================================================
   PURPOSE: Drop the ComputerInventory database (to be recreated)
   WARNING: This script is DESTRUCTIVE
            All data in ComputerInventory will be permanently deleted.

   USE CASES:
   - Resetting the lab environment
   - Re-running all schema and seed scripts from scratch
   - Learning / reference purposes
   - DROP DATABASE:
	- Deletes the entire database
	- Removes all tables
        - Removes all data
        - Removes all schemas
        - Removes stored procedures, views, indexes, constraints
        - Removes users, roles, permissions
        - Deletes the physical database files (.mdf, .ldf) from disk
        - There is no recycle bin, no undo

   NOTES:
   - The database is switched to SINGLE_USER mode
   - ROLLBACK IMMEDIATE forces disconnect of active sessions
============================================================ */

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'ComputerInventory')
BEGIN
    -- Force all connections to close
    ALTER DATABASE ComputerInventory 
        SET SINGLE_USER 
        WITH ROLLBACK IMMEDIATE;

    -- Drop the database
    DROP DATABASE ComputerInventory;
END;
GO
