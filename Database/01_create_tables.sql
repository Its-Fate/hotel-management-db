-- All tables are created first, followed by the application of Foreign Key constraints and Triggers for clarity.

USE HotelManagement

-- 1. Create entity tables
CREATE TABLE Country (
	CountryID INT IDENTITY PRIMARY KEY,
	CountryName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE City (
	CityID INT IDENTITY PRIMARY KEY,
	CityName NVARCHAR(50) NOT NULL,
	CountryID INT NOT NULL
);

CREATE TABLE Hotel (
	HotelID INT IDENTITY PRIMARY KEY,
	HotelName VARCHAR(50) NOT NULL,
	Address NVARCHAR(100) NOT NULL UNIQUE,
	PostalCode NVARCHAR(10) NOT NULL UNIQUE,
	StarNum TINYINT NOT NULL CHECK (StarNum BETWEEN 1 AND 5),
	TelephoneNum VARCHAR(15) NOT NULL,
	CityID INT NOT NULL
);

CREATE TABLE RoomType (
    RoomTypeID INT IDENTITY PRIMARY KEY,
    TypeName NVARCHAR(20) NOT NULL UNIQUE,   -- 'Single', 'Double', 'Triple', 'Suite'
    Description NVARCHAR(100) NULL,
);

CREATE TABLE Room (
	RoomID INT IDENTITY PRIMARY KEY,
	RoomNumber INT NOT NULL,
	NumberOfBeds TINYINT NOT NULL CHECK (NumberOfBeds BETWEEN 1 AND 8),
	CostPerNight DECIMAL(10,2) NOT NULL,
	RoomStatus VARCHAR(15) NOT NULL CHECK (RoomStatus IN ('Available', 'Occupied', 'Maintenance')),
	RoomTypeID INT NOT NULL,
	HotelID INT NOT NULL,
	CONSTRAINT UQ_HotelID_RoomNumber UNIQUE (HotelID, RoomNumber)
);

CREATE TABLE Amenity (
	AmenityID INT IDENTITY PRIMARY KEY,
	AmenityName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Guest (
	GuestID INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL UNIQUE,
	PhoneNumber VARCHAR(15) NOT NULL UNIQUE,
	NationalID VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Payment (
	PaymentID INT IDENTITY PRIMARY KEY,
	PaymentDate DATE NOT NULL,
	Amount DECIMAL(10,2) NOT NULL,
	Method NVARCHAR(20) NOT NULL CHECK (Method IN ('Cash','Card','Online','Other'))
);

CREATE TABLE Service (
	ServiceID INT IDENTITY PRIMARY KEY,
	ServiceName NVARCHAR(100) NOT NULL,
	Description NVARCHAR(200),
	ServiceStatus NVARCHAR(15) NOT NULL CHECK (ServiceStatus IN ('Active', 'Inactive', 'Maintenance')),
	CostPerSession DECIMAL(10,2) NOT NULL,
	DepartmentID INT NOT NULL,
	CONSTRAINT UQ_DepartmentID_ServiceName UNIQUE (DepartmentID, ServiceName)
);

CREATE TABLE Employee (
	EmployeeID INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	NationalID VARCHAR(20) NOT NULL UNIQUE,
	DateOfBirth DATE NOT NULL,
	Gender VARCHAR(15) NOT NULL CHECK (Gender IN ('Male', 'Female', 'Other')),
	Email VARCHAR(50) NOT NULL UNIQUE,
	PhoneNumber VARCHAR(15) NOT NULL UNIQUE,
	Degree VARCHAR(50) NULL,
	BaseSalary DECIMAL(10,2) NOT NULL
);

CREATE TABLE JobRole (
	RoleID INT IDENTITY PRIMARY KEY,
	RoleName VARCHAR(30) NOT NULL,
	WorkHours TINYINT NOT NULL,
	OffDays VARCHAR(10) NOT NULL CHECK (
		OffDays LIKE '%Mon%' OR
		OffDays LIKE '%Tue%' OR
		OffDays LIKE '%Wed%' OR
		OffDays LIKE '%Thu%' OR
		OffDays LIKE '%Fri%' OR
		OffDays LIKE '%Sat%' OR
		OffDays LIKE '%Sun%'
	),
	SalaryScale DECIMAL(4,2) NOT NULL CHECK (SalaryScale BETWEEN 1.00 AND 20.00),
	Description VARCHAR(200),
	DepartmentID INT NOT NULL
);

CREATE TABLE Department (
	DepartmentID INT IDENTITY PRIMARY KEY,
	DepartmentName VARCHAR(50) NOT NULL,
	TelephoneNumber VARCHAR(15) NOT NULL,
	Location VARCHAR(100) NOT NULL,
	HotelID INT NOT NULL
);

CREATE TABLE Employment (
	EmploymentID INT IDENTITY PRIMARY KEY,
	EmployeeID INT NOT NULL,
	HotelID INT NOT NULL,
	PositionAtHired INT NOT NULL, -- FK to JobRole(RoleID)
	HireDate DATE NOT NULL,
	EndDate DATE,
	CHECK (EndDate IS NULL OR EndDate > HireDate)
);
GO

-- 2. Create relationship tables
CREATE TABLE RoomAmenity (
	RoomID INT NOT NULL,
	AmenityID INT NOT NULL,
	PRIMARY KEY(RoomID, AmenityID)
);

CREATE TABLE RoomGuest (
	RoomID INT NOT NULL,
	GuestID INT NOT NULL,
	CheckInDate DATE NOT NULL,
	CheckOutDate DATE NOT NULL,
	ReservationDate DATE NOT NULL,
	ReservationStatus VARCHAR(20) NOT NULL CHECK (ReservationStatus IN ('Booked', 'CheckedIn', 'CheckedOut', 'Cancelled')),
	NumberOfGuests TINYINT NOT NULL,
	PaymentID INT,
	PRIMARY KEY (RoomID, CheckInDate)
);

CREATE TABLE ServiceGuest (
	ServiceID INT NOT NULL,
	GuestID INT NOT NULL,
	UseDate DATE NOT NULL,
	ReservationDate DATE NOT NULL,
	PaymentID INT NOT NULL,
	PRIMARY KEY (ServiceID, GuestID, UseDate)
);

CREATE TABLE DepartmentManager (
	EmploymentID INT NOT NULL,
	DepartmentID INT NOT NULL,
	Level TINYINT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE,
	PRIMARY KEY (EmploymentID, DepartmentID, StartDate)
);

CREATE TABLE ServiceEmployment (
	EmploymentID INT NOT NULL,
	ServiceID INT NOT NULL,
	ShiftDate DATE NOT NULL,
	ShiftStart TIME NOT NULL,
	ShiftEnd TIME NOT NULL,
	PRIMARY KEY (EmploymentID, ShiftDate, ShiftStart),
	CHECK (ShiftStart < ShiftEnd)
);
GO

-- 3. Foreign Keys
ALTER TABLE City
ADD CONSTRAINT FK_City_Country 
	FOREIGN KEY (CountryID) REFERENCES Country(CountryID);

ALTER TABLE Hotel
ADD CONSTRAINT FK_Hotel_City
	FOREIGN KEY (CityID) REFERENCES City(CityID);

ALTER TABLE Room
ADD CONSTRAINT FK_Room_Hotel
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
	CONSTRAINT FK_Room_RoomType 
	FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID);

ALTER TABLE Service
ADD CONSTRAINT FK_Service_Department
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

ALTER TABLE JobRole
ADD CONSTRAINT FK_JobRole_Department
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

ALTER TABLE Department
ADD CONSTRAINT FK_Department_Hotel
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID);

ALTER TABLE RoomAmenity
ADD CONSTRAINT FK_RoomAmenity_Room
	FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
	CONSTRAINT FK_RoomAmenity_Amenity
	FOREIGN KEY (AmenityID) REFERENCES Amenity(AmenityID);

ALTER TABLE RoomGuest
ADD CONSTRAINT FK_RoomGuest_Room
	FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
	CONSTRAINT FK_RoomGuest_Guest
	FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
	CONSTRAINT FK_RoomGuest_Payment
	FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);

ALTER TABLE ServiceGuest
ADD CONSTRAINT FK_ServiceGuest_Service
	FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
	CONSTRAINT FK_ServiceGuest_Guest
	FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
	CONSTRAINT FK_ServiceGuest_Payment
	FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);

ALTER TABLE DepartmentManager
ADD CONSTRAINT FK_DepartmentManager_Employment
	FOREIGN KEY (EmploymentID) REFERENCES Employment(EmploymentID),
	CONSTRAINT FK_DepartmentManager_Department
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

ALTER TABLE ServiceEmployment
ADD CONSTRAINT FK_ServiceEmployment_Service
	FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
	CONSTRAINT FK_ServiceEmployment_Employement
	FOREIGN KEY (EmploymentID) REFERENCES Employment(EmploymentID);

ALTER TABLE Employment
ADD CONSTRAINT FK_Employment_Employee
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	CONSTRAINT FK_Employment_Hotel
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
	CONSTRAINT FK_Employment_JobRole
	FOREIGN KEY (PositionAtHired) REFERENCES JobRole(RoleID);
GO

-- 4. Triggers (also the answer to the question 3 in General Questions)
CREATE TRIGGER trg_HotelMatch
ON DepartmentManager
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM inserted i, Employment e, Department d
        WHERE i.EmploymentID = e.EmploymentID
          AND i.DepartmentID = d.DepartmentID
          AND e.HotelID <> d.HotelID
    )
    BEGIN
        ROLLBACK;
    END
END;
GO

CREATE TRIGGER trg_ServiceEmployment_HotelMatch
ON ServiceEmployment
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM inserted i, Employment e, Service s, Department d
        WHERE i.EmploymentID = e.EmploymentID
          AND i.ServiceID = s.ServiceID
          AND s.DepartmentID = d.DepartmentID
          AND e.HotelID <> d.HotelID
    )
    BEGIN
        ROLLBACK;
    END
END;
GO