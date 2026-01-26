/* ============================================================
   PURPOSE: Create the ComputerInventory database

   USE CASES:
   - Initial setup of the ComputerInventory lab environment
   - Recreating the database prior to running schema scripts
   - Learning and reference purposes

   NOTES:
   - This script creates the database only
   - Table definitions are created separately
   - Safe to re-run; database is created only if it does not exist
============================================================ */


IF DB_ID('ComputerInventory') IS NULL
BEGIN
    CREATE DATABASE ComputerInventory;
END;
GO

USE ComputerInventory;

GO
