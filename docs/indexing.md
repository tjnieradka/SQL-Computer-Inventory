# Indexing and Basic Optimization

This document provides a high-level overview of indexing and basic
optimization concepts as applied in the
**TN Global Technologies – Computer Inventory** database.

The goal is to demonstrate practical understanding rather than
deep DBA-level tuning.

---

## Why Indexes Matter

Indexes help SQL Server locate rows more efficiently, reducing the
need to scan entire tables during queries.

They are especially useful for:
- JOIN conditions
- WHERE clause filters
- Sorting and grouping operations

---

## Clustered Index

**Key Characteristics**
- Defines the physical order of rows in a table
- One clustered index per table
- Typically created on the primary key

**Example**
- `CompID` on the `Computer` table

Clustered indexes work well for:
- Range queries
- Frequently sorted columns

---

## Nonclustered Index

**Key Characteristics**
- Separate structure from the table data
- Improves search performance
- Multiple nonclustered indexes allowed per table

**Example Use Cases**
- Searching by serial number
- Filtering by status or asset tag

---

## Other Optimization Concepts (High-Level)

The following concepts are acknowledged but not deeply implemented
in this project:

- SQL Server statistics  
  - Help the query optimizer choose efficient execution plans  
  - Automatically maintained by SQL Server

- Avoiding `SELECT *`  
  - Improves performance and clarity  
  - Reduces unnecessary data retrieval

- Appropriate data types  
  - Smaller data types reduce storage and improve performance

- Indexing with care  
  - Too many indexes can slow down inserts and updates  
  - Indexes should support real query patterns

---

## Scope Note

This project demonstrates **foundational indexing concepts**
appropriate for analysts, systems administrators, and EAM-related roles,
rather than advanced database tuning.
