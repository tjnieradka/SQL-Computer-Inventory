/* The provided BULK INSERT scripts assume the following:

- CSV files **must include a header row**
- `FIRSTROW = 2` is used to skip the header
- Columns in the CSV **must match the table column order**
- Columns backed by `IDENTITY` (auto-generated primary keys) **must be present but left blank**
- Fields are comma-separated with no trailing spaces
- Files are stored locally (e.g. `D:\SqlSeedData\`)

This approach is intentionally simple for a learning environment. */

BULK INSERT dbo.Software
FROM 'D:\SqlSeedData\Software.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);