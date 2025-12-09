# Business Rules — IT Asset Inventory System
*TN Global Technologies (Fictional Company)*

These business rules define how computer assets, employees, hardware components, and software installations are managed within the IT Asset Inventory System. 
The goal is to ensure consistent data entry, reliable reporting, and clear relationships between assets and users.

---

## 1. Employees and Device Assignment

**1. Every employee must be assigned at least one computer.**  
(A workstation must always have an owner.)

**2. Some employees may have multiple devices, such as a laptop and desktop.**

**3. A computer can only be assigned to one employee at a time.**  
(No shared ownership in this version of the model.)

**4. When an employee changes departments, their assigned devices remain tied to that employee until reassigned.**

----

## 2. Computer Assets

**5. The system tracks only end-user computing devices, such as laptops, desktops, and optionally peripherals.**  
(Servers, networking equipment, and storage systems are intentionally out of scope.)

**6. Each computer must have a unique serial number.**

**7. Each computer must have a recorded vendor/manufacturer (e.g., Dell, Lenovo, HP).**

**8. Every computer must include key hardware specifications, such as:**  
    - Processor  
    - Memory (RAM)  
    - Storage capacity  
    - Model information  
    (Additional components may be tracked as required.)  

**9. A computer’s hardware can be upgraded over time (e.g., memory or storage), and the updated component values must be reflected in the database.**

**10. Computers may exist in different lifecycle states (e.g., active, in repair, retired).**
(Lifecycle state attribute optional for phase 1.)  

---

## 3. Vendors

**11. Computers must be purchased from approved vendors only.**  

**12. Vendor information must include contact details for support escalation.**  

**13. When a computer is under warranty, the vendor is responsible for major repairs not performed by internal IT technicians.**  

---

## 4. Software and Licensing

**14. Each software application can only be installed once on one system in this simplified model.**  
(No site licenses or multi-install rules in this version.)

**15. The system tracks which software applications are installed on each computer.**   
Licensing models (per-user, per-device, subscription-based, etc.) are outside the scope of this project.  

**16. Standard software is installed on all computers, but specialized applications are installed based on department or job function.**  

**17. When an employee receives a new device, specialized applications must be re-installed on the new computer, as they follow the device.**

---

## 5. Upgrades and Maintenance

**18. The IT department periodically reviews hardware standards to determine:**  
- Which machines need upgrades  
- Which should be replaced  
- Which hardware components are no longer adequate  

**19. Inventory information from the database shall be used to support upgrade decisions, warranty checks, and vendor support requests.**  

**20. The IT department must maintain accurate asset data so that devices can be located quickly for maintenance or software updates.**  

----

## 6. Data Integrity Rules (Essential for SQL)

**21. Every computer must belong to one department through its assigned employee.**  

**22. Every software installation must reference both a valid computer and a valid software record.**  

**23. Deleting an employee record must not automatically delete assigned devices.**  
(Devices must first be reassigned or retired.)

**24. Computer serial numbers, software names, and vendor names should not be duplicated unless explicitly allowed.**

---

## 7. Future Enhancements (Not Implemented in Phase 1)
These rules may be added later but are excluded to keep the model simple:  
- Tracking monitors, docking stations, and peripherals  
- Lease vs. owned assets  
- Device lifecycle history (repairs, upgrades over time)  
- Software license expiration dates  
- Automated discovery tools  
- Multi-user shared devices  
- Data center hardware, VMs, servers, networking equipment  

---

## Summary

These business rules provide the foundation for the relational database structure used in the IT Asset Inventory System. 
They define how employees, devices, software, and vendors relate to one another, and guide consistent data modeling throughout the project.
