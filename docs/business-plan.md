# Business Plan — Computer Inventory Tracking System
*TN Global Technologies (Fictional Company)* 

## 1. Company Overview

TN Global Technologies is a fictional international provider of enterprise IT hardware and lifecycle management services. The company supplies laptops, desktops, servers, and networking equipment to organizations worldwide and offers full lifecycle services including procurement, deployment, asset tracking, maintenance, and retirement.
To support these operations, TN Global Technologies requires a reliable and structured way to track its corporate IT assets across multiple departments and geographic locations. 
The SQL Inventory Database in this project represents an internal system designed for this purpose.

## 2. Purpose of the Inventory System

The IT Asset Inventory System is designed for the IT department of a mid-size to large organization. Its primary purpose is to provide a centralized and accurate record of all computer assets owned by the company.
This project focuses on end-user computing assets only (for example, laptops, desktops, and related peripherals). Server infrastructure, storage systems, and network equipment are intentionally out of scope to keep the data model focused and easier to understand.
The system tracks:

- Computer hardware details
  - Model number, manufacturer/vendor, serial number, acquisition date
  - Processor, memory, storage, and other key components
- Employee assignments
  - Which employee is currently using a particular workstation
  - Department and role information
- Software installed on each workstation
  - Applications installed
  - Associated software licenses
  - Ability to identify required upgrades or renewals

This information supports day-to-day IT operations, lifecycle management, compliance, and reporting.

## 3. Business Advantages

The inventory system provides several operational benefits for TN Global Technologies’ IT and asset management teams:  
a. Faster vendor support and warranty service
When a workstation malfunctions, technicians can quickly retrieve key details such as serial number, model, and acquisition date. This enables faster communication with hardware vendors and speeds up warranty or repair processes.

b. Improved lifecycle planning
Hardware specifications such as CPU, RAM, and storage help determine whether a device can be upgraded or whether it should be replaced. This ensures employees have equipment that matches their workload and reduces downtime.

c. Easier device identification and maintenance scheduling
Knowing which employee uses a specific device allows IT teams to easily locate workstations for scheduled upgrades, security patches, or maintenance. This minimizes disruption and improves long-term productivity.

d. Better software license tracking and compliance
Tracking installed applications per computer helps ensure:
  - Licenses are properly assigned
  - Software does not exceed licensed quantities
  - Outdated or vulnerable applications are identified
  - Compliance requirements are met
This reduces financial and security risks.

## 4. Intended Users of the System
The computer inventory database is used by:

**IT Support Technicians**
For troubleshooting, repairs, upgrades, and device assignment.

**Asset Management Teams**
For lifecycle tracking, procurement planning, and audits.

**Security and Compliance Teams**
For validating software installations and ensuring systems meet internal and external standards.

**Department Managers**
For tracking allocated equipment and planning future needs.

## 5. System Scope (High-Level)

The scope of the SQL project includes:
- Tracking  end-user devices (laptops, desktops)
- Defining key entities (Computers, Employees, Departments, Hardware Details, Software Installations, Vendors)
- Structuring the database using relational principles and normalization
- Creating an ER diagram
- Implementing the schema using SQL scripts
- Loading sample data
- Demonstrating common SQL queries relevant to real IT operations
- Providing basic documentation and references

This system is not intended to replace full CMDB or enterprise asset tools but serves as a solid instructional example of a relational inventory system.
- Does **not** track data center infrastructure such as servers, blade enclosures, SAN/NAS storage, or network switches.


## 6. Limitations / Not Included

To keep the project focused and instructional, the system does not include:
- Financial tracking (cost centers, depreciation, purchase orders)
- Network device inventory
- Automated discovery tools
- Complex stored procedures or ETL pipelines
- Integration with external systems

These can be added in future expansions.

## 7. Summary

The IT Asset Inventory System provides TN Global Technologies with a reliable framework for managing its IT assets. By centralizing hardware, software, and employee assignment information, the company can streamline support operations, improve lifecycle planning, maintain compliance, and support long-term efficiency.

This business plan sets the context for the SQL data model used in this GitHub project.
