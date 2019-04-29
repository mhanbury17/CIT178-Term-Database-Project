/* Final Project Views */
USE Planet_Fun;
GO
/*  VIEW #1  
------------------------UPDATABLE VIEW--------------------------------
CREATE VIEW ProductsAvailable AS
SELECT ProductID, ProductName, ProductDescription, UnitPrice
FROM Products; GO
-------------------------ORIGINAL DATA--------------------------------
SELECT * FROM Products;
-------------------------UPDATING PRICE-------------------------------
GO UPDATE Products
SET UnitPrice = 7.25 WHERE ProductID=2; GO
------------------------DISPLAY NEW DATA------------------------------
SELECT*FROM ProductsAvailable;
*//* VIEW #2
--------------------------CREATING VIEW-------------------------------
GO CREATE VIEW StaffOrders AS
SELECT Staff.StaffID, Staff.FirstName+' '+Staff.LastName AS [Staff Name], Staff.Title, OrderID, OrderDate
FROM Staff JOIN Orders ON Staff.StaffID = Orders.StaffID; GO
------------------USING THE VIEW TO DISPLAY THE DATA------------------
SELECT*FROM StaffOrders;
*//* VIEW #3
--------------------------CREATING VIEW-------------------------------
GO CREATE VIEW AttractionSummary AS
SELECT Attractions.AttractionID, Attractions.AttractionName, Attractions.TotalRevenue, TerritoryDescription
FROM Attractions JOIN Territories ON Attractions.TerritoryID = Territories.TerritoryID
WHERE TotalRevenue>0; GO
----------------USING THE VIEW TO DISPLAY THE DATA--------------------
SELECT*FROM AttractionSummary;
*//* VIEW #4
-------------------------CREATING VIEW--------------------------------
GO CREATE VIEW StaffSummary AS
SELECT Staff.StaffID, Staff.FirstName+' '+Staff.LastName AS [Name], Staff.Title,
	YEAR(GETDATE())-YEAR(Staff.BirthDate) AS RoughAge, TerritoryDescription
FROM Staff JOIN Territories ON Staff.TerritoryID = Territories.TerritoryID; GO
----------------USING THE VIEW TO DISPLAY THE DATA--------------------
SELECT*FROM StaffSummary;
*/
select*from StaffSummary;
select*from AttractionSummary