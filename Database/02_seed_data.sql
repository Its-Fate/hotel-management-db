USE HotelManagement
GO

SET IDENTITY_INSERT Amenity ON;
INSERT INTO Amenity (AmenityID,AmenityName) 
	VALUES (1, 'WiFi'),
	(2, 'MiniBar'),
	(3, 'Wardrobe'),
	(4, 'TeaMaker'),
	(5, 'Microwave'),
	(6, 'IronAndIroningBoard'),
	(7, 'Balcony'),
	(8, 'SoundSystem'),
	(9, 'DisposableSlippers'),
	(10, 'SmokeSensor');
SET IDENTITY_INSERT Amenity OFF;

SET IDENTITY_INSERT Country ON;
INSERT INTO Country (CountryID, CountryName) 
	VALUES (1, 'Iran'),
	(2, 'Cyprus'),
	(3, 'Saudi Arabia'),
	(4, 'Pakistan'),
	(5, 'Azerbaijan'),
	(6, 'Armenia'),
	(7, 'Oman'),
	(8, 'Turkey'),
	(9, 'Turkmenistan'),
	(10, 'Kazakhstan');
SET IDENTITY_INSERT Country OFF;

SET IDENTITY_INSERT City ON;
INSERT INTO City(CityID, CityName,CountryID) 
	VALUES (1, 'Tehran',1),
	(2, 'Rasht',1),
	(3, 'Larnaca',2),
	(4, 'Riyadh',3),
	(5, 'Lahore',4),
	(6, 'Baku',5),
	(7, 'Yerevan',6),
	(8, 'Muscat',7),
	(9, 'Istanbul',8),
	(10, 'Ankara',8),
	(11, 'Ashgabat',9),
	(12, 'Astana',10);
SET IDENTITY_INSERT City OFF;

SET IDENTITY_INSERT Hotel ON;
INSERT INTO Hotel(HotelID, HotelName,Address,PostalCode,StarNum,TelephoneNum,CityID)
	VALUES(1, 'Ferdosi','Saadatabad_Behrud_Square_33rd_Street','54320',4,'40201030',1),
	(2, 'Azadi','SaadatAbad_NoorollahiSt_EvinHotelSt_AzadiHotelSt','76540',3,'30183000',1),
	(3, 'Esteghlal','EsteghlalSt_EsteghlalParsianHotelSt','44330',5,'42531111',2),
	(4, 'HOMA','ZafarSt_KhodamiSt_EramSt_Shiva','45463',5,'45566464',3),
	(5, 'Asaareh','Lavizan_FarshadiSt_TajrlooSt','48901',4,'89970080',4),
	(6, 'Shian','FerdowsiSt_KoshkMisriSt_friend','23111',4,'35884523',5),
	(7, 'Diamond','Greenhouse_ShirinSt_ZanbakSt','24432',2,'24939700',6),
	(8, 'Star','PalestineSt_KetabhiSt','86994',3,'12321648',7),
	(9, 'Part','Buzan_StJ','49331',4,'97784435',8),
	(10, 'Freinds','DastghayibBlvd_Dastghayib_4thSt','22435',4,'35886490',10),
	(11, 'Peace','TekyeandChamanBoulevard','97990',3,'78502011',9);
SET IDENTITY_INSERT Hotel OFF;

SET IDENTITY_INSERT Department ON;
INSERT INTO Department(DepartmentID, DepartmentName,TelephoneNumber,Location,HotelID) 
	VALUES (1, 'FrontOffice','42539554','Ground floor in front of the entrance door',1),
	(2, 'FrontOffice','40000554','Ground floor on the right',2),
	(3, 'FrontOffice','47532114','Floor -1 facing the elevator door',5),
	(4, 'FrontOffice','61000876','Ground floor',3),
	(5, 'Housekeeping','70109053','Floor -1 right',3),
	(6, 'Housekeeping','40162001','First floor',2),
	(7, 'Food & Beverage','10038511','Ground floor on the right',7),
	(8, 'Food & Beverage','61000511','Ground floor on the right',3),
	(9, 'Food & Beverage','65738881','Ground floor on the left',8),
	(10, 'Food & Beverage','79057511','fifth floor on the right',4),
	(11, 'Food & Beverage','45738000','Floor -1 facing the elevator door',1),
	(12, 'Engineering','63456789','Floor -1',1),
	(13, 'Engineering','15312789','Floor -1_next to the Housekeeping',3),
	(14, 'Engineering','53327111','First floor on the right',9),
	(15, 'Security','11001252','First floor on the right',10),
	(16, 'Security','00891876','First floor on the left',3),
	(17, 'Security','24871432','sixth floor on the left',2),
	(18, 'Security','45870009','fifth floor facing the elevator door',6),
	(19, 'Public Relations','60001288','3rd floor, left side, next to the bathroom',3),
	(20, 'Public Relations','43555588','Ground floor , left side, next to the bathroom',1),
	(21, 'Procurement','00985567','First floor on the right',5),
	(22, 'Procurement','42111297','First floor',7),
	(23, 'Spa & Wellness','23126547','fifth floor',3),
	(24, 'Human Resources','30006544','First floor in front of the entrance door',3),
	(25, 'Human Resources','34225426','Ground floor  facing the elevator door',10),
	(26, 'Human Resources','38543544','First floor',9),
	(27, 'Kitchen','8760554','Floor -1 left side',6),
	(28, 'Kitchen','4253765','Ground floor, next to the Food & Beverage',8);
SET IDENTITY_INSERT Department OFF;

SET IDENTITY_INSERT Guest ON;
INSERT INTO Guest(GuestID, FirstName,LastName,Email,PhoneNumber,NationalID)
	VALUES(1, 'Reza','Saharkhizan','reza27s@gmail.com','09370476948','1234'),
	(2, 'Nahid','Shokranifar','nsokranifar29@gmail.com','09984531221','2345'),
	(3, 'Mohaddeseh','Amirkhani','mo65am@gmail.com','09376579087','6443'),
	(4, 'Benyamin','Marefat','beny84m@gmail.com','09123661206','7654'),
	(5, 'Aida','Moghaddasi','aidamoghassi2005@gmail.com','09167123121','8543'),
	(6, 'Fatemeh','Akbari','fakbari23@gmail.com','09904341890','2348'),
	(7, 'Ali','Hosseini','alihoss659h@gmail.com','09112345445','7754'),
	(8, 'Faezeh','Shahverdi','6512fshah@gmail.com','09168481788','2433'),
	(9, 'Afsaneh','Naseri','naseri1975@gmail.com','09112454821','8076'),
	(10, 'Mona','Ghasemi','monaaa34gh@gmail.com','09112498221','1002'),
	(11, 'Mahan','Samadi','mahansamadi67@gmail.com','09129941761','4327');
SET IDENTITY_INSERT Guest OFF;

SET IDENTITY_INSERT Payment ON;
INSERT INTO Payment(PaymentID, PaymentDate,Amount,Method)
	VALUES(1, '2025-01-12', 3500000, 'Card'),
	(2, '2025-02-03', 4500000, 'Cash'),
	(3, '2025-03-18', 2750000, 'other'),
	(4, '2025-04-22', 9800000, 'Online'),
	(5, '2025-05-10', 1500000, 'Card'),
	(6, '2025-06-05', 5200000, 'Online'),
	(7, '2025-07-19', 8900000, 'other'),
	(8, '2025-08-14', 3300000, 'Cash'),
	(9, '2025-09-01', 1200000, 'Card'),
	(10, '2025-10-27', 7600000, 'Card');
SET IDENTITY_INSERT Payment OFF;

SET IDENTITY_INSERT Service ON;
INSERT INTO Service(ServiceID, ServiceName, Description, ServiceStatus, CostPerSession, DepartmentID)
VALUES
(1, 'VIP Room Reservation', 'Booking special and luxury rooms', 'Active', 3500000, 4),
(2, 'VIP Room Reservation', 'Booking special and luxury rooms', 'Active', 2000000, 3),
(3, 'Express Laundry', 'Quick laundry service for guests clothes', 'Active', 400000, 6),
(4, 'Lobby Café', 'Serving drinks and snacks in the lobby', 'Active', 500000, 11),
(5, 'Lobby Café', 'Serving drinks and snacks in the lobby', 'Maintenance', 300000, 7),
(6,'Equipment Inspection', 'Checking and repairing room devices', 'Active', 150000, 14),
(7, 'Night Security Patrol', 'Night-time security checks and patrols', 'Active', 200000, 18),
(8, 'Night Security Patrol', 'Night-time security checks and patrols', 'Active', 200000, 12),
(9, 'Night Security Patrol', 'Night-time security checks and patrols', 'Active', 200000, 16),
(10, 'Emergency Electrical Support', 'Immediate electrical problem solving', 'Maintenance', 50000, 13),
(11, 'Night Security Patrol', 'Night-time security checks and patrols', 'Inactive', 150000, 17),
(12, 'Travel Consultation', 'Providing information and city tours', 'Inactive', 1000000, 20),
(13, 'Express Laundry', 'Quick laundry service for guests clothes', 'Active', 1200000, 5),
(14, 'Food Quality Control', 'Checking freshness and quality of ingredients', 'Active', 50000, 22),
(15, 'Relaxing Massage', '45-minute relaxation massage', 'Maintenance', 1200000, 23),
(16, 'Staff Training', 'Short training courses for hospitality staff', 'Active', 5000000, 25),
(17, 'Chefs Special', 'Preparing special dishes upon guest request', 'Inactive', 3500000, 7),
(18, 'Chefs Special', 'Preparing special dishes upon guest request', 'Inactive', 2300000, 9);
SET IDENTITY_INSERT Service OFF;

SET IDENTITY_INSERT Employee ON;
INSERT INTO Employee(EmployeeID, FirstName, LastName, NationalID, DateOfBirth, Gender, Email, PhoneNumber, Degree, BaseSalary)
VALUES
(1,'Ahmad','Mohseni','5678','1990-01-01','Male','ahmad1990m@gmail.com','09612345421','Bachelor',10000000),
(2,'Ali','Mohsenpoor','7654','1990-01-01','Male','Ali1990m@gmail.com','09612345422','Bachelor',12000000),
(3,'Reza','Moradi','1838','1985-01-01','Male','rezamoradi12@gmail.com','09915651406','Diploma',9000000),
(4,'Zahra','Safari','3569','2005-01-01','Female','z2005safari@gmail.com','09370649037','Diploma',8000000),
(5,'Amir','Mosaei','7085','1990-01-01','Male','Amir1990mmmmm@gmail.com','09612345423','Bachelor',18000000),
(6,'Negar','Hosseini','1572','2000-01-01','Female','neg1122ar@gmail.com','09043635300','Diploma',9000000),
(7,'Ali','Pashayi','6643','1992-01-01','Male','pashali23@gmail.com','09112346556','Masters',22000000),
(8,'Safar','Mohseni','3407','1990-01-01','Male','Safar1880m@gmail.com','09612345450','Bachelor',15000000),
(9,'Motahare','Saeedi','2348','1970-01-01','Female','saeedi@gmail.com','09123342112','Diploma',8000000),
(10,'Alireza','Mahmoodi','9743','1990-01-01','Male','Alireza1770m@gmail.com','09612345460','Bachelor',13000000),
(11,'Samin','Motahar','0876','1990-01-01','Male','Samin19880m@gmail.com','09612345470','Bachelor',14400000),
(12,'Sara','Barzegar','3469','1997-01-01','Female','sarab342@gmail.com','09214564398','Diploma',10000000),
(13,'Ramezan','Sahari','8630','1990-01-01','Male','Ramezan1678m@gmail.com','09612345480','Bachelor',17000000),
(14,'Saman','Qods','3333','1982-01-01','Male','s86qods@gmail.com','09121003212','Diploma',12000000),
(15,'Rahim','Akbarnezhad','8888','1977-01-01','Male','r77akbarnezhad@gmail.com','09128712341','Masters',25000000),
(16,'Mahmood','Hasani','7777','1967-01-01','Male','hasani67m@gmail.com','09113236543','Masters',30000000),
(17,'Azadeh','Mirzayi','6666','1990-01-01','Female','Azadeh1990mmm@gmail.com','09612345490','Bachelor',13000000),
(18,'Somayyeh','Abedi','6644','1999-01-01','Female','abadi999@gmail.com','09214426557','Diploma',8000000),
(19,'Nika','Farokhi','3344','1990-01-01','Female','Farokhi1990nnm@gmail.com','09612345400','Bachelor',15000000),
(20,'Fariba','Yaser','2224','2001-01-01','Female','faribayaser@gmail.com','09112454879','Diploma',9000000);
SET IDENTITY_INSERT Employee OFF;

SET IDENTITY_INSERT JobRole ON;
INSERT INTO JobRole(RoleID, RoleName, WorkHours, OffDays, SalaryScale, Description, DepartmentID)
VALUES
(1, 'Receptionist', 8, 'Mon, Tue', 10.50, 'Guest reception and front desk management', 3),
(2, 'Receptionist', 8, 'Tue', 11.00, 'Guest reception and front desk management', 3),
(3, 'Housekeeper', 9, 'Wed, Thu', 12.00, 'Room cleaning and maintenance', 6),
(4, 'Housekeeper', 9, 'Fri, Thu', 13.25, 'Room cleaning and maintenance', 5),
(5, 'Waiter/Waitress', 7, 'Fri', 14.00, 'Food and beverage service for guests', 7),
(6, 'Waiter/Waitress', 9, 'Fri, Sat', 15.50, 'Food and beverage service for guests', 9),
(7, 'Waiter/Waitress', 6, 'Fri, Thu', 16.00, 'Food and beverage service for guests', 11),
(8, 'Maintenance Technician', 12, 'Mon, Wed', 17.20, 'Maintenance and repair of hotel equipment', 12),
(9, 'Maintenance Technician', 9, 'Mon, Fri', 18.00, 'Maintenance and repair of hotel equipment', 13),
(10, 'Maintenance Technician', 8, 'Sun, Thu', 18.50, 'Maintenance and repair of hotel equipment', 14),
(11, 'Security Guard', 12, 'Tue, Fri', 19.00, 'Ensuring guest and hotel security', 15),
(12, 'Security Guard', 12, 'Tue, Fri', 19.20, 'Ensuring guest and hotel security', 16),
(13, 'Security Guard', 12, 'Tue, Fri', 19.50, 'Ensuring guest and hotel security', 18),
(14, 'PR Manager', 9, 'Wed, Sun', 20.00, 'Managing public relations and hotel publicity', 20),
(15, 'Mover', 8, 'Mon, Tue', 11.50, 'Assisting guests with luggage', 2),
(16, 'Spa Therapist', 8, 'Thu, Sat', 12.75, 'Providing spa and wellness services', 23),
(17, 'HR Manager', 9, 'Sun', 13.50, 'Managing HR operations and staff', 24),
(18, 'HR Manager', 8, 'Tue, Wed', 14.25, 'Managing HR operations and staff', 25),
(19, 'Chef', 10, 'Fri', 15.00, 'Preparing and overseeing meals', 27),
(20, 'Chef', 9, 'Fri', 16.00, 'Preparing and overseeing meals', 28);
SET IDENTITY_INSERT JobRole OFF;

SET IDENTITY_INSERT RoomType ON;
INSERT INTO RoomType (RoomTypeID, TypeName, Description) VALUES
    (1, 'Single', 'Standard single bed room'),
    (2, 'Double', 'Double bed or twin beds'),
    (3, 'Triple', 'Three single beds'),
    (4, 'Suite', 'Luxury suite with separate living area');
SET IDENTITY_INSERT RoomType OFF;

SET IDENTITY_INSERT Room ON;
INSERT INTO Room(RoomID, RoomNumber, NumberOfBeds, CostPerNight, RoomStatus, RoomTypeID, HotelID)
VALUES
	(1, 101, 1, 1000000, 'Available', 1, 1),
	(2, 102, 2, 1500000, 'Occupied', 2, 2),
	(3, 103, 3, 2000000, 'Available', 3, 3),
	(4, 104, 2, 1800000, 'Maintenance', 2, 4),
	(5, 105, 1, 1200000, 'Available', 1, 5),
	(6, 106, 4, 2500000, 'Occupied', 4, 6),
	(7, 107, 3, 2100000, 'Available', 3, 7),
	(8, 108, 1, 1300000, 'Occupied', 1, 8),
	(9, 109, 1, 1100000, 'Occupied', 1, 9),
	(10, 110, 4, 3000000, 'Available', 4, 10),
	(11, 111, 2, 2700000, 'Maintenance', 2, 1),
	(12, 112, 3, 3200000, 'Occupied', 3, 2),
	(13, 113, 2, 3500000, 'Occupied', 2, 6),
	(14, 114, 3, 4000000, 'Available', 3, 10),
	(15, 115, 2, 1900000, 'Maintenance', 2, 3);
SET IDENTITY_INSERT Room OFF;

SET IDENTITY_INSERT Employment ON;
INSERT INTO Employment(EmploymentID, EmployeeID, HotelID, PositionAtHired, HireDate, EndDate) 
VALUES
(1, 1, 1, 12, '2025-01-01', NULL),
(2, 2, 2, 3, '2023-02-01', '2025-08-01'),
(3, 3, 3, 4, '2025-03-01', NULL),
(4, 4, 7, 5, '2025-04-01', NULL),
(5, 5, 8, 6, '2024-05-01', '2025-11-01'),
(6, 6, 1, 8, '2025-06-01', NULL),
(7, 7, 1, 12, '2022-07-01', '2025-10-01'),
(8, 8, 3, 9, '2024-08-01', '2025-12-01'),
(9, 9, 9, 10, '2025-09-01', NULL),
(10, 10, 10, 11, '2024-10-01', '2025-11-07');
SET IDENTITY_INSERT Employment OFF;


INSERT INTO RoomAmenity(RoomID,AmenityID) 
	VALUES
	(1, 2),	(1, 8),
	(2, 1),	(2, 3),
	(3, 1),	(3, 4),
	(4, 5),(4, 7),	
	(5, 6),(5, 4),
	(6, 7),(6, 9),
	(7, 8),
	(8, 1),	(8, 3),	(8, 9),(8, 10),
	(9, 1),(9, 6),
	(10, 4),(10, 3),(10, 2),
	(11, 5),(11, 2),
	(12, 6),
	(13, 7),(13, 10),
	(15, 5),(15, 7),
	(14, 8);


INSERT INTO RoomGuest(RoomID,GuestID,CheckInDate,CheckOutDate,ReservationDate,ReservationStatus,NumberOfGuests,PaymentID) 
	VALUES (1, 2, '2025-12-01', '2025-12-05', '2025-11-20', 'Booked', 2, 2),
	(2, 3, '2025-12-03', '2025-12-06', '2025-11-25', 'CheckedIn', 3,2),
	(3, 4, '2025-12-05', '2025-12-10', '2025-11-28', 'Cancelled', 2, 3),
	(4, 5, '2025-12-07', '2025-12-12', '2025-11-30', 'Booked', 2, 4),
	(5, 6, '2025-12-09', '2025-12-15', '2025-12-01', 'CheckedOut', 1, 5),
	(6, 7, '2025-12-11', '2025-12-16', '2025-12-03', 'Booked', 2, 6),
	(7, 8, '2025-12-13', '2025-12-18', '2025-12-05', 'CheckedIn', 2, 7),
	(8, 9, '2025-12-15', '2025-12-20', '2025-12-07', 'Cancelled', 3 , 8),
	(9, 10, '2025-12-17', '2025-12-22', '2025-12-09', 'Booked', 1, 9),
	(11, 2, '2025-12-19', '2025-12-24', '2025-12-11', 'CheckedOut', 3, 10);


INSERT INTO ServiceGuest(ServiceID,GuestID,UseDate,ReservationDate,PaymentID) 
	VALUES(11,1, '2025-12-02', '2025-11-25',2),
	(12,2, '2025-12-04', '2025-11-26',3),
	(13,3, '2025-12-06', '2025-11-28',4),
	(14,4, '2025-12-08', '2025-11-30',5),
	(15,5,'2025-12-10', '2025-12-01',6),
	(6, 6,'2025-12-12', '2025-12-03',7),
	(7,7, '2025-12-14', '2025-12-05',8),
	(8,8, '2025-12-16', '2025-12-07',9),
	(9,9, '2025-12-18', '2025-12-09',10),
	(10,10, '2025-12-20', '2025-12-11',1);
	
	
INSERT INTO DepartmentManager(EmploymentID, DepartmentID, Level, StartDate, EndDate)  
VALUES 
(1, 1, 1, '2025-01-01', NULL),
(2, 2, 2, '2025-02-01', '2025-08-01'),
(3, 5, 1, '2025-03-01', NULL),
(4, 7, 2, '2025-04-01', NULL),
(5, 9, 1, '2025-05-01', '2025-11-01'),
(6, 11, 1, '2025-06-01', NULL),
(7, 12, 2, '2025-07-01', '2025-11-05'),
(8, 13, 3, '2025-08-01', '2025-12-01'),
(9, 14, 1, '2025-09-01', NULL),
(10, 15, 2, '2025-10-01', '2025-12-11');


INSERT INTO ServiceEmployment(EmploymentID, ServiceID, ShiftDate, ShiftStart, ShiftEnd)
VALUES
-- Hotel 1 employees
(1, 8, '2025-12-01', '08:30:00', '16:30:00'),   -- Employee 1, Hotel 1
(6, 4, '2025-12-03', '09:00:00', '17:00:00'),   -- Employee 6, Hotel 1
(7, 12, '2025-12-05', '10:00:00', '18:00:00'),  -- Employee 7, Hotel 1
-- Hotel 2 employees
(2, 3, '2025-12-02', '08:00:00', '16:00:00'),   -- Employee 2, Hotel 2
-- Hotel 3 employees
(3, 1, '2025-12-04', '09:30:00', '17:30:00'),   -- Employee 3, Hotel 3
(8, 13, '2025-12-07', '08:00:00', '16:00:00'),  -- Employee 8, Hotel 3
-- Hotel 7 employees
(4, 5, '2025-12-06', '07:30:00', '15:30:00'),  -- Employee 4, Hotel 7
-- Hotel 8 employee
(5, 18, '2025-12-08', '08:00:00', '16:00:00'),   -- Employee 5, Hotel 8
-- Hotel 9 employee
(9, 6, '2025-12-09', '07:00:00', '15:00:00'),  -- Employee 9, Hotel 9
-- Hotel 10 employee
(10, 16, '2025-12-10', '09:00:00', '17:00:00'); -- Employee 10, Hotel 10
GO