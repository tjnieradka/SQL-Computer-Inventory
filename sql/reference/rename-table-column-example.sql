-- Rename column in table from 'dbo.Computer_HDD.DriveSlot' to 'CompDriveSlot'

EXEC sp_rename 
    'dbo.Computer_HDD.DriveSlot',
    'CompDriveSlot',
    'COLUMN';
