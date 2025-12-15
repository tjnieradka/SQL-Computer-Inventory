/* ============================================================
   SCRIPT: drop-table-software.sql
   PURPOSE: Drop the dbo.Software table if it exists
   WARNING: This script is DESTRUCTIVE
            All data in dbo.Software will be permanently deleted.

   USE CASES:
   - Resetting the lab environment
   - Re-running table creation and seed scripts
   - Schema redesign or refactoring
   - Learning and reference purposes

   NOTES:
   - Uses DROP TABLE IF EXISTS (SQL Server 2016+)
   - Safe to run even if the table does not exist
   - Foreign key dependencies must be removed first
============================================================ */

DROP TABLE IF EXISTS dbo.Software;
GO
