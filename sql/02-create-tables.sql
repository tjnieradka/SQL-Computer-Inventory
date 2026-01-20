/* ============================================================
   Create Tables for ComputerInventory Database
   TN Global Technologies (Fictional)
   ============================================================ */

USE ComputerInventory;
GO

/* ============================================================
   Lookup Tables – Employee Domain
   ============================================================ */

CREATE TABLE EmpStatus (
    EmpStatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName  VARCHAR(50) NOT NULL
);

CREATE TABLE EmpOffice (
    EmpOfficeID INT IDENTITY(1,1) PRIMARY KEY,
    OfficeName  VARCHAR(100) NOT NULL
);

CREATE TABLE EmpPosition (
    EmpPositionID INT IDENTITY(1,1) PRIMARY KEY,
    PositionName  VARCHAR(100) NOT NULL
);

GO

/* ============================================================
   Lookup Tables – Computer Hardware Domain
   ============================================================ */

CREATE TABLE CompStatus (
    CompStatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName   VARCHAR(50) NOT NULL
);

CREATE TABLE CompType (
    CompTypeID   INT IDENTITY(1,1) PRIMARY KEY,
    CompTypeName VARCHAR(50) NOT NULL
);

CREATE TABLE CompRAM (
    CompRAMID INT IDENTITY(1,1) PRIMARY KEY,
    RAMGB     INT NOT NULL
);

CREATE TABLE CompProcessor (
    CompProcID        INT IDENTITY(1,1) PRIMARY KEY,
    CompProcNumber    VARCHAR(50),
    CompProcName      VARCHAR(100),
    CompProcSpeedGHz  DECIMAL(4,2)
);

CREATE TABLE CompHDD (
    CompHDDID    INT IDENTITY(1,1) PRIMARY KEY,
    DriveType    VARCHAR(50) NOT NULL,
    DriveSizeGB  INT NOT NULL
);

GO

/* ============================================================
   Lookup Tables – Software Domain
   ============================================================ */

CREATE TABLE SwStatus (
    SwStatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName VARCHAR(50) NOT NULL
);

CREATE TABLE SwLanguage (
    SwLangID  INT IDENTITY(1,1) PRIMARY KEY,
    LangCode  VARCHAR(20) NOT NULL
);

CREATE TABLE SwLicns (
    SwLicnsID   INT IDENTITY(1,1) PRIMARY KEY,
    LicenseName VARCHAR(100) NOT NULL
);

GO

/* ============================================================
   Core Reference Tables
   ============================================================ */

CREATE TABLE Vendor (
    VenID       INT IDENTITY(1,1) PRIMARY KEY,
    VenName     VARCHAR(150) NOT NULL,
    VenAddr     VARCHAR(200),
    VenCity     VARCHAR(100),
    VenProv     VARCHAR(100),
    VenCountry  VARCHAR(100),
    VenPost     VARCHAR(20),
    VenPhone    VARCHAR(50),
    VenFax      VARCHAR(50),
    VenEmail    VARCHAR(150),
    VenHW       BIT NOT NULL,
    VenSW       BIT NOT NULL
);

GO

/* ============================================================
   Core Identity Tables
   ============================================================ */

CREATE TABLE Employee (
    EmpID         INT IDENTITY(1,1) PRIMARY KEY,
    EmpFirst      VARCHAR(100) NOT NULL,
    EmpLast       VARCHAR(100) NOT NULL,
    EmpPositionID INT NOT NULL,
    EmpOfficeID   INT NOT NULL,
    EmpStatusID   INT NOT NULL,

    CONSTRAINT FK_Employee_Position
        FOREIGN KEY (EmpPositionID) REFERENCES EmpPosition(EmpPositionID),

    CONSTRAINT FK_Employee_Office
        FOREIGN KEY (EmpOfficeID) REFERENCES EmpOffice(EmpOfficeID),

    CONSTRAINT FK_Employee_Status
        FOREIGN KEY (EmpStatusID) REFERENCES EmpStatus(EmpStatusID)
);

GO

CREATE TABLE Software (
    SwID        INT IDENTITY(1,1) PRIMARY KEY,
    VenID       INT NOT NULL,
    SwLangID    INT NOT NULL,
    SwLicnsID   INT NOT NULL,
    SwStatusID  INT NOT NULL,
    SwTitle     VARCHAR(150) NOT NULL,
    SwVer       VARCHAR(50),
    SwSerial    VARCHAR(150),

    CONSTRAINT FK_Software_Vendor
        FOREIGN KEY (VenID) REFERENCES Vendor(VenID),

    CONSTRAINT FK_Software_Language
        FOREIGN KEY (SwLangID) REFERENCES SwLanguage(SwLangID),

    CONSTRAINT FK_Software_License
        FOREIGN KEY (SwLicnsID) REFERENCES SwLicns(SwLicnsID),

    CONSTRAINT FK_Software_Status
        FOREIGN KEY (SwStatusID) REFERENCES SwStatus(SwStatusID)
);

GO

CREATE TABLE Computer (
    CompID        INT IDENTITY(1,1) PRIMARY KEY,
    VenID         INT NOT NULL,
    CompTypeID    INT NOT NULL,
    CompProcID    INT NOT NULL,
    CompRAMID     INT NOT NULL,
    CompStatusID  INT NOT NULL,
    EmpID         INT NULL,
    CompAssetTag  VARCHAR(100) NOT NULL,
    CompSerial    VARCHAR(100),
    CompAcquired  DATE,
    CompModel     VARCHAR(150),

    CONSTRAINT FK_Computer_Vendor
        FOREIGN KEY (VenID) REFERENCES Vendor(VenID),

    CONSTRAINT FK_Computer_Type
        FOREIGN KEY (CompTypeID) REFERENCES CompType(CompTypeID),

    CONSTRAINT FK_Computer_Processor
        FOREIGN KEY (CompProcID) REFERENCES CompProcessor(CompProcID),

    CONSTRAINT FK_Computer_RAM
        FOREIGN KEY (CompRAMID) REFERENCES CompRAM(CompRAMID),

    CONSTRAINT FK_Computer_Status
        FOREIGN KEY (CompStatusID) REFERENCES CompStatus(CompStatusID),

    CONSTRAINT FK_Computer_Employee
        FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

GO

/* ============================================================
   Associative Tables
   ============================================================ */

CREATE TABLE Computer_HDD (
    ComputerHDDID INT IDENTITY(1,1) PRIMARY KEY,
    CompID        INT NOT NULL,
    CompHDDID     INT NOT NULL,
    CompDriveSlot TINYINT NOT NULL,

    CONSTRAINT FK_ComputerHDD_Computer
        FOREIGN KEY (CompID) REFERENCES Computer(CompID),

    CONSTRAINT FK_ComputerHDD_HDD
        FOREIGN KEY (CompHDDID) REFERENCES CompHDD(CompHDDID)
);

GO

CREATE TABLE Computer_Software (
    SwID   INT NOT NULL,
    CompID INT NOT NULL,

    CONSTRAINT PK_Computer_Software
        PRIMARY KEY (SwID, CompID),

    CONSTRAINT FK_CS_Software
        FOREIGN KEY (SwID) REFERENCES Software(SwID),

    CONSTRAINT FK_CS_Computer
        FOREIGN KEY (CompID) REFERENCES Computer(CompID)
);

GO
