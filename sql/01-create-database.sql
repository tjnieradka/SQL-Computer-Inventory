/* ============================================================
   Create ComputerInventory database
   ============================================================ */


IF DB_ID('ComputerInventory') IS NULL
BEGIN
    CREATE DATABASE ComputerInventory;
END;
GO

USE ComputerInventory;
GO