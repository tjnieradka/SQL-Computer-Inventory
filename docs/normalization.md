# Database Normalization

This document describes how normalization principles were applied in the
**TN Global Technologies – Computer Inventory** database design.

The schema is normalized to **Third Normal Form (3NF)** to reduce redundancy,
ensure data integrity, and support maintainable reporting.

---

## First Normal Form (1NF)

**Definition**  
A table is in First Normal Form (1NF) if:
- Each field contains atomic (indivisible) values.
- There are no repeating groups or multi-valued attributes.
- Each record can be uniquely identified by a primary key.

**Application in this database**
All tables use:
- A single-column primary key (e.g., `CompID`, `EmpID`, `SwID`).
- Atomic attributes (one value per column).

**Example**
Instead of storing multiple RAM values in a single column:
```
Computer
---------
CompRAM = "8GB,16GB"
```
RAM configurations are normalized into a separate lookup table:

```
CompRAM
---------
CompRAMID (PK)
RAMGB
```
And referenced from the Computer table via CompRAMID.

**Result**
No repeating groups.
One value per field.
Clear primary keys for all entities.

## Second Normal Form (2NF)

**Definition**
- A table is in Second Normal Form (2NF) if:
- It is already in 1NF.
- All non-key attributes depend on the entire primary key.
- No partial dependencies exist

**Application in this database**
Tables with composite keys are limited to associative entities only.

**Example**
The Computer_Software table uses a composite primary key:
```
Computer_Software
------------------
SwID (PK, FK)
CompID (PK, FK)
```
This table contains only keys, and no non-key attributes depend on just part of the composite key.
Non-key attributes (such as software version or licensing details) are stored in the Software table instead.

**Result**
No partial dependencies.
Associative tables contain relationship data only.
Entity attributes remain in their appropriate parent tables.

## Third Normal Form (3NF)

**Definition**
A table is in Third Normal Form (3NF) if:
- It is in 2NF
- No transitive dependencies exist
- Non-key attributes depend only on the primary key

**Application in this database**
Descriptive attributes are separated into lookup tables and referenced by foreign keys.

**Examples**
Instead of storing status names directly in entity tables:
```
Computer
---------
CompStatus = "Active"
```

Status values are normalized:

```
CompStatus
-----------
CompStatusID (PK)
StatusName
```

And referenced in the Computer table:

```
Computer
---------
CompStatusID (FK)
```
The same pattern is used for:
- ```EmpStatus```
- ```SwStatus```
- ```CompType```
- ```CompProcessor```
- ```CompRAM```
- ```SwLanguage```
- ```SwLicns```

**Result**
No duplicated descriptive values.
Updates to lookup data occur in one place.
Improved consistency and reporting accuracy.

## Normalization Summary

The Computer Inventory database:
- Uses atomic attributes and primary keys (1NF)
- Eliminates partial dependencies (2NF)
- Eliminates transitive dependencies through lookup tables (3NF)

This design supports:
-Accurate reporting
-Simplified maintenance
-Scalable growth of inventory data
- The schema is intentionally normalized to Third Normal Form (3NF), which is appropriate for an IT asset management and reporting system.
