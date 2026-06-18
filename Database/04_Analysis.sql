USE HotelManagement;
GO

-- Part 1: Guest Spending Tiers (A, B, C)
SELECT 
	Guest.GuestID, 
	Guest.FirstName + ' ' + Guest.LastName AS FullName,
	COUNT(RoomGuest.CheckInDate) AS StayCount,
	SUM(Payment.Amount) AS TotalPayment,
	CASE
		WHEN SUM(Payment.Amount) >= 5000000 THEN 'A'
		WHEN SUM(Payment.Amount) >= 3000000 THEN 'B'
		ELSE 'C'
	END AS Rank
FROM Guest JOIN RoomGuest ON Guest.GuestID = RoomGuest.GuestID
JOIN Payment ON RoomGuest.PaymentID = Payment.PaymentID
GROUP BY Guest.GuestID, Guest.FirstName, Guest.LastName;

-- Part 2: Hotel Total Income and Total Guest Count
SELECT 
	Hotel.HotelID,
	Hotel.HotelName,
	SUM(Payment.Amount) AS TotalIncome,
	COUNT(DISTINCT RoomGuest.GuestID) AS GuestCount
FROM Hotel JOIN Room ON Hotel.HotelID = Room.HotelID
JOIN RoomGuest ON Room.RoomID = RoomGuest.RoomID
JOIN Payment ON RoomGuest.PaymentID = Payment.PaymentID
GROUP BY Hotel.HotelID, Hotel.HotelName;

-- Part 3: Room Type Popularity (Cheapest First)
SELECT 
	RoomType.RoomTypeID,
	RoomType.TypeName,
	MIN(Room.CostPerNight) AS CheapestAvailable,
	COUNT(RoomGuest.RoomID) AS ReservationCount
FROM RoomType LEFT JOIN Room ON RoomType.RoomTypeID = Room.RoomTypeID
LEFT JOIN RoomGuest ON RoomGuest.RoomID = Room.RoomID
GROUP BY RoomType.RoomTypeID, TypeName
ORDER BY CheapestAvailable ASC;

