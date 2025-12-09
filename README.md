# SQL-Computer-Inventory
A fictional IT Asset &amp; Computer Inventory Database — designed to demonstrate SQL relational modeling, data normalization, and practical query skills.

## Overview

This repository contains a complete SQL portfolio project centered around a fictional IT Asset Inventory System. The goal is to demonstrate practical SQL abilities relevant to systems administration, IT asset management, reporting, and analytical work — including:

- Designing a simple but realistic relational data model
- Writing business rules and identifying key entities
- Creating an ER Diagram
- Implementing SQL tables and sample data
- Querying the database using JOINs, aggregations, and data formatting
- Demonstrating indexing and other basic optimization concepts
- Including reference SQL scripts for schema inspection and database maintenance

This project emphasizes clear explanations, practical examples, and intermediate-level SQL concepts — the level expected from a Systems Analyst, Reporting Analyst, or IT professional working with SQL for data insights.

## Technology Stack

This project was developed using the following tools and technologies:
- Microsoft SQL Server Express 2022 — database engine used for creating and testing the inventory system
- SQL Server Management Studio (SSMS) 20.2.1 — primary environment for writing and executing SQL scripts
- Transact-SQL (T-SQL) — SQL dialect used for schema definitions, queries, and reference scripts
- **Draw.io (diagrams.net) — used to create the Entity–Relationship (ER) diagram**
- Windows 11 environment — the platform the database is running on
- GitHub — version control and project hosting
- Markdown — for structured documentation

## Repository Structure
<PRE>
SQL-Computer-Inventory/
│
├── README.md
│
├── docs/
│   ├── business-plan.md
│   ├── business-rules.md
│   ├── entities.md
│   ├── er-diagram.png
│   ├── normalization.md
│   └── glossary.md (optional)
│
├── sql/
│   ├── 01-create-database.sql
│   ├── 02-create-tables.sql
│   ├── 03-insert-sample-data.sql
│   ├── 04-drop-tables.sql
│   ├── 05-drop-database.sql
│   ├── reference/
│   │   ├── get-table-schema.sql
│   │   ├── get-primary-keys.sql
│   │   ├── get-foreign-keys.sql
│   │   ├── list-tables.sql
│   │   └── sample-index-creation.sql
│   └── queries/
│       ├── join-examples.md
│       ├── aggregation-examples.md
│       ├── search-formatting.md
│       ├── duplicates.md
│       └── reporting-views.sql
│
└── output/
    ├── sample-query-results/
    └── schema-diagram.png
</PRE>

## Project Goals

This portfolio project demonstrates the following:

1. Relational database design
- Define business needs
- Identify entities and relationships
- Apply 1NF, 2NF, and 3NF
- Produce an ER Diagram

2. SQL DDL (Data Definition Language)
- Create database and tables
- Add constraints (PK, FK, unique keys)
- Understand table relationships

3. SQL DML (Data Manipulation Language)
- Insert sample records
- Query using JOINs and filtering
- Perform aggregations (COUNT, SUM, GROUP BY)
- Detect duplicates
- Format data (CAST, CONVERT, string manipulation)

4. Practical analysis-style SQL
- Find computers without assigned users
- Identify outdated assets
- Count computers by model, OS, or department
- Generate simple reporting views

5. Basic optimization concepts
(Not at DBA level — just what an analyst or systems admin should understand.)

- Why indexes matter
- Clustered vs non-clustered indexes
- How indexes improve search performance
- Understanding SQL Server statistics at a high level

## Database Scenario (Summary)

A fictional company needs to track:
- Computers (laptops, desktops, thin clients)
- Users (employees and contractors)
- Departments
- Hardware models and vendors
- Computer assignments (who uses which device)

The database supports:
- Inventory auditing
- Tracking device lifecycle
- Reporting device allocation
- Identifying unused or retired equipment

Full details are in:
`docs/business-plan.md`

Included Learning Materials
- Normalization (1NF / 2NF / 3NF)
  - You’ll find short, memorable explanations in docs/normalization.md.
- Indexing (Beginner-Friendly Explanation)
  - Indexes are like a book’s index:
  - They help SQL Server locate rows faster, instead of scanning the entire table.
  - Two types covered:
    - **Clustered Index**
      - Defines the physical order of rows.
      - One per table.
      - Usually created on the Primary Key
      - Best for columns frequently used in sorting or ranges
      - Example: ComputerID

    - **Nonclustered Index**
      - Separate structure from the table
      - Speeds up search conditions
      - Best for columns used in WHERE or JOIN
      - Example: SerialNumber search

  - Other optimization topics (high-level only):
    - SQL Server statistics
      - Help the engine pick optimal query plans
      - Automatically maintained
    - Avoiding SELECT *
    - Using appropriate data types
    - Adding indexes only where necessary
      - Too many can hurt performance

## Query Examples

The sql/queries/ directory includes practical examples such as:

**INNER JOIN**
- Find assigned computers and their users.

**LEFT JOIN**
- Find computers without assigned users.

**Aggregations**
- Count computers by department, OS, or status.

**Detect duplicates**
- Identify duplicate serial numbers (common issue in asset data).

**Formatting**
- Converting datetime to readable formats
- Extracting year or month
- Converting numeric values to strings

**Reporting Views**
- Simple reusable views for dashboards or scripts.

## Reference SQL Scripts

Inside sql/reference/ you'll find DBA-lite utilities such as:

- List all tables
- View table schema
- List primary and foreign keys
- Drop or rebuild the database
- Sample indexing scripts

## Future Enhancements

Planned improvements:
- Add stored procedures (optional; not required for core project)
- Add more complex reporting examples
- Add Power BI dashboards using this SQL dataset
- Add sample CSV export/import workflow
- Improve sample data volume for indexing demo

## About This Project

This project draws on my prior SQL training and practical experience using SQL for reporting, data extraction, and asset analysis in enterprise environments. The core relational design is adapted from a final SQL project I completed during formal coursework, updated with improved structure, modern best practices, and expanded documentation.

It forms part of my ongoing development in:

- SQL data modeling
- Data analysis and reporting
- Systems and inventory administration
- Building a technical portfolio on GitHub

I previously completed a Python open-data analysis project and am now expanding into SQL and Power BI portfolio examples.

## References

This project is based on publicly available SQL Server documentation and online learning resources, including:

Microsoft Learn — SQL Server Documentation
https://learn.microsoft.com/sql

Microsoft Learn — T-SQL Language Reference
https://learn.microsoft.com/sql/t-sql

Microsoft Learn — Information about databases
https://learn.microsoft.com/sql/relational-databases

Microsoft Learn — Query Performance and Indexing
https://learn.microsoft.com/sql/relational-databases/sql-server-index-design-guide

W3Schools SQL Reference (Syntax Quick Reference)
https://www.w3schools.com/sql


## Feedback / Questions

If you have suggestions for improvements or want to discuss the design, feel free to open an issue or comment.

