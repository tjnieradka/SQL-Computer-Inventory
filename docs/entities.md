# Entities and Relationships — IT Asset Inventory System
*TN Global Technologies (Fictional Company)*

This document describes the main entities used in the IT Asset Inventory System and how they relate to each other.  
It is a **simplified, tentative model** for a learning project. The exact fields implemented in SQL are defined in `sql/02-create-tables.sql`.

---

## 1. Employee

**Purpose**  
Represents an individual employee within TN Global Technologies who may be assigned one or more company-owned computers.
---

### Core Attributes
- EmpID (PK)
- EmpFirst
- EmpLast
- EmpPositionID (FK → EmpPosition)
- EmpOfficeID (FK → EmpOffice)
- EmpStatusID (FK → EmpStatus)
---

### Relationships
- One **EmpPosition** → Many **Employees**
- One **EmpOffice** → Many **Employees**
- One **EmpStatus** → Many **Employees**
- One **Employee** → Many **Computers**

---

### Notes
- Employee status, position, and office are modeled as lookup tables to ensure consistency and support reporting.
- Each employee may be assigned zero or more computers.

## 2. EmpPosition

**Purpose**  
Defines the job position or role assigned to an employee.
---
### Core Attributes
- EmpPositionID (PK)
- PositionName

### Relationships
- One EmpPosition → Many Employees

### Notes
- Implemented as a lookup table to ensure consistent use of position names.
- Supports reporting and filtering by employee role.
---
## 3. EmpOffice

**Purpose**  
Represents a physical or organizational office location where employees are assigned.

### Core Attributes
- EmpOfficeID (PK)
- OfficeName

### Relationships
- One EmpOffice → Many Employees

### Notes
- Used to group employees by office for administrative and reporting purposes.
---
## 4. EmpStatus

**Purpose**  
Defines the current employment status of an employee.

### Core Attributes
- EmpStatusID (PK)
- StatusName

### Relationships
- One EmpStatus → Many Employees

### Notes
- Typical status values include Active, Inactive, or On Leave.
- Modeled as a lookup table to maintain data consistency.
---

## 5. Computer

**Purpose**
Represents a physical computer asset owned by TN Global Technologies and managed as part of the computer inventory system.

### Core Attributes
- CompID (PK)
- VenID (FK → Vendor)
- CompTypeID (FK → CompType)
- CompProcID (FK → CompProcessor)
- CompRAMID (FK → CompRAM)
- CompStatusID (FK → CompStatus)
- EmpID (FK → Employee)
- CompAssetTag
- CompSerial
- CompAcquired
- CompModel

### Relationships
- One Vendor → Many Computers
- One CompType → Many Computers
- One CompProcessor → Many Computers
- One CompRAM → Many Computers
- One CompStatus → Many Computers
- One Employee → Many Computers

### Notes
- Each computer is associated with a single vendor, hardware configuration, and lifecycle status.
- Employee assignment is modeled directly on the Computer entity to represent the current assigned user.
- Hardware attributes are normalized into lookup tables to ensure consistency and simplify reporting.
---

## 4. Vendor

**Purpose**  
Represents the manufacturer or supplier of computers.

**Core Attributes (current simplified version):**
- VenID (PK)
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
- SwID (PK)
- SwTitle
- SwVer
- SwSerial

### Possible Future Attributes *(not implemented in this version)*
- Category (Office, Development, Security, etc.)  
- IsStandardInstall (Yes / No)

**Key Points**
- Software may be standard for all users or specialized for certain roles.
- Licensing models are out of scope for this project.

**Relationships**
- One **Software** → Many **SoftwareInstallations**

---

## 6. Computer_Software (Linking Entity)

**Purpose**  
Represents the installation of a specific software product on a specific computer.  
Implements the many-to-many relationship between Computers and Software.

**Core Attributes (current simplified version):**
- SoftwareInstallationID (PK)  
  *(or composite PK: CompID + SwID depending on final design)*
- CompID (FK → Computer)
- SwID (FK → Software)

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
- **Computer (1)** → **Computer_Software (N)**  
- **Software (1)** → **Computer_Software (N)**  

This structure supports common IT asset questions such as:
- Which computers belong to which employees?
- What hardware does each computer have?
- What software is installed on each device?
- Which vendor provided which equipment?

---

> **Note:**  
> This document is conceptual. 

