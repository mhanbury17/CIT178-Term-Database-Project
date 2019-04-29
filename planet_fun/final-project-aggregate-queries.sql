/* 
--Count Number of Attractions in the Upstairs Arcade--

USE Planet_Fun;
SELECT COUNT(TerritoryID) AS [Total Attractions In Upper Arcade],
	SUM(TotalRevenue) AS [Total Upper Arcade Revenue]
FROM Attractions
WHERE TerritoryID = 230; 

--Average Attraction Cost--

USE Planet_Fun;
SELECT AVG(Price) AS [Average Attraction Price],
	MAX(Price) AS [Most Expensive Attraction Price],
	MIN(Price) AS [Least Expensive Attraction Price]
FROM Attractions;
*/

--Total Amount Spent By Registered Customers--

USE Planet_Fun;
SELECT COUNT(Customers.CustomerID) AS [Total Customers],
	SUM(Funcards.OverallCredits) AS [Total Customer Spendings]
FROM Funcards JOIN Customers ON Funcards.CustomerID = Customers.CustomerID
WHERE Registered = 'YES';

--Staff Orders and Cost--

USE Planet_Fun;
SELECT Staff.FirstName, Staff.LastName, COUNT(Orders.OrderID) AS [Staff Orders],
	SUM(OrderDetails.Quanity*Products.UnitPrice) AS [Order Cost]
FROM Orders JOIN Staff ON Orders.StaffID = Staff.StaffID
	JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
	JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Staff.FirstName, Staff.LastName;




