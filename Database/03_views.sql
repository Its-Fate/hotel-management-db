USE HotelManagement
GO

-- Create a view to dynamically calculate Employees' age
CREATE VIEW EmployeeWithAge AS
SELECT *,
    -- Calculate the year difference between this year and the Employee's year of birth
    DATEDIFF(YEAR, DateOfBirth, GETDATE())
        - CASE 
            -- If we have not yet reahced the Employee's birthday this year, subtract 1
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, DateOfBirth, GETDATE()), DateOfBirth) > GETDATE()
            THEN 1 ELSE 0 
          END AS Age
FROM Employee;
GO

-- Create a view to dynamically calculate the monthly revenue
CREATE VIEW MonthlyHotelRevenue AS
SELECT
    YEAR(p.PaymentDate) AS Year,
    MONTH(p.PaymentDate) AS Month,
    h.HotelName,
    SUM(p.Amount) AS TotalRevenue,
    COUNT(DISTINCT rg.GuestID) AS NumberOfGuests
FROM Payment p JOIN RoomGuest rg ON p.PaymentID = rg.PaymentID
JOIN Room r ON rg.RoomID = r.RoomID
JOIN Hotel h ON r.HotelID = h.HotelID
GROUP BY YEAR(p.PaymentDate), MONTH(p.PaymentDate), h.HotelName;
GO

-- Create a view to analyze the activity of Room Types per Hotel
CREATE VIEW RoomTypeActivity AS
SELECT 
    h.HotelID,
    h.HotelName,
    rt.RoomTypeID,
    rt.TypeName,
    COUNT(rg.RoomID) AS HotelReservations,
    CASE 
        WHEN COUNT(rg.RoomID) >= 2 THEN 1 
        ELSE 0
    END AS Active
FROM Hotel h
CROSS JOIN RoomType rt
LEFT JOIN Room r ON h.HotelID = r.HotelID AND rt.RoomTypeID = r.RoomTypeID
LEFT JOIN RoomGuest rg ON r.RoomID = rg.RoomID
GROUP BY h.HotelID, h.HotelName, rt.RoomTypeID, rt.TypeName;
GO
-- Check the results
SELECT * FROM RoomTypeActivity;
GO