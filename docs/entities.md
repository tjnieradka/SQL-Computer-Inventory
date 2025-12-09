# Entities and Relationships — IT Asset Inventory System
*TN Global Technologies (Fictional Company)*

This document describes the main entities used in the IT Asset Inventory System and how they relate to each other.  
It is a **simplified, tentative model** for a learning project. The exact fields implemented in SQL are defined in `sql/02-create-tables.sql`.

---

## 1. Employee

**Purpose**  
Represents an individual employee who uses one or more company-owned computers.

**Core Attributes (current simplified version):**
- EmployeeID (PK)
- FirstName
- LastName
- DepartmentID (FK → Department)

### Possible Future Attributes *(not implemented in this version)*
- JobTitle  
- EmployeeNumber  
- Status (Active / Inactive)  
- LocationID  

**Key Points**
- Each employee is assigned at least one computer.
- Some employees may have multiple computers.

**Relationships**
- One **Department** → Many **Employees**
- One **Employee** → Many **Computers**

---

## 2. Department

**Purpose**  
Represents an organizational unit such as IT, Finance, Sales, or HR.

**Core Attributes (current simplified version):**
- DepartmentID (PK)
- DepartmentName

### Possible Future Attributes *(not implemented in this version)*
- CostCenter  
- Description  

**Key Points**
- Used to group employees and devices for organizational reporting.

**Relationships**
- One **Department** → Many **Employees**

---

## 3. Computer

**Purpose**  
Represents an end-user computing device assigned to an employee (desktop or laptop).

**Scope Note**  
This system models **end-user devices** only. Servers, storage systems, and network infrastructure are out of scope.

**Core Attributes (current simplified version):**
- ComputerID (PK)
- SerialNumber  
- DeviceType (Laptop, Desktop, etc.)
- Model  
- ManufacturerID (FK → Vendor)
- Processor  
- RAMGB  
- StorageGB  
- OperatingSystem  
- EmployeeID (FK → Employee)

### Possible Future Attributes *(not implemented in this version)*
- AssetTag  
- PurchaseDate  
- WarrantyEndDate  
- ComputerName / Hostname  
- Status (Active / InRepair / Retired)

**Key Points**
- Each computer is assigned to exactly one employee at a time.
- Serial numbers must be unique.
- Hardware specs can be updated if upgrades occur.

**Relationships**
- One **Employee** → Many **Computers**
- One **Vendor** → Many **Computers**
- One **Computer** → Many **SoftwareInstallations**

---

## 4. Vendor

**Purpose**  
Represents the manufacturer or supplier of computers.

**Core Attributes (current simplified version):**
- VendorID (PK)
- VendorName

### Possible Future Attributes *(not implemented in this version)*
- SupportPhone  
- SupportEmail  
- WebsiteURL  

**Key Points**
- Used to track manufacturers for reporting and warranty inquiries.

**Relationships**
- One **Vendor** → Many **Computers**

---

## 5. Software

**Purpose**  
Represents an application or software package that may be installed on computers.

**Core Attributes (current simplified version):**
- SoftwareID (PK)
- SoftwareName

### Possible Future Attributes *(not implemented in this version)*
- Version  
- Category (Office, Development, Security, etc.)  
- IsStandardInstall (Yes / No)

**Key Points**
- Software may be standard for all users or specialized for certain roles.
- Licensing models are out of scope for this project.

**Relationships**
- One **Software** → Many **SoftwareInstallations**

---

## 6. SoftwareInstallation (Linking Entity)

**Purpose**  
Represents the installation of a specific software product on a specific computer.  
Implements the many-to-many relationship between Computers and Software.

**Core Attributes (current simplified version):**
- SoftwareInstallationID (PK)  
  *(or composite PK: ComputerID + SoftwareID depending on final design)*
- ComputerID (FK → Computer)
- SoftwareID (FK → Software)

### Possible Future Attributes *(not implemented in this version)*
- InstallDate  
- InstalledBy  
- Notes  

**Key Points**
- Tracks which applications are installed on each device.
- Used for inventory, audit, and maintenance planning.

**Relationships**
- One **Computer** → Many **SoftwareInstallations**
- One **Software** → Many **SoftwareInstallations**

---

## 7. Relationship Summary (High-Level)

- **Department (1)** → **Employee (N)**  
- **Employee (1)** → **Computer (N)**  
- **Vendor (1)** → **Computer (N)**  
- **Computer (1)** → **SoftwareInstallation (N)**  
- **Software (1)** → **SoftwareInstallation (N)**  

This structure supports common IT asset questions such as:
- Which computers belong to which employees?
- What hardware does each computer have?
- What software is installed on each device?
- Which vendor provided which equipment?

---

> **Note:**  
> This document is conceptual. 

