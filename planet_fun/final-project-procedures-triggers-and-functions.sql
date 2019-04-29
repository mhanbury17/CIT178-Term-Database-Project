---------------- Final Project Procedures ----------------

--STORED PROCEDURE THAT RETRIEVES AND DISPLAYS DATA
/*
USE Planet_Fun;
GO
CREATE PROC spEmployees
AS
SELECT * FROM Staff
ORDER BY LastName;
GO
EXEC spEmployees;
*/
--STORED PROCEDURE THAT TAKES 1 OR MORE INPUT PARAMETERS AND RETRIEVES RESULTS BASED ON THE VALUE
/*
USE Planet_Fun
GO
CREATE PROC spGetEmployee
	@EmployeeID int
AS
BEGIN
	SELECT * FROM Staff
	WHERE StaffID = @EmployeeID
END
GO
EXEC spGetEmployee 3
*/
--STORED PROCEDURE THAT TAKES 1 OR MORE INPUT PARAMETERS AND INCLUDES 1 OR MORE OUTPUT PARAMETERS
/*
USE Planet_Fun;
GO
CREATE PROC spStaffContact
	@StaffID int,
	@FirstName nvarchar(20) OUTPUT,
	@LastName nvarchar(30) OUTPUT,
	@Phone nvarchar(15) OUTPUT
AS
SELECT @FirstName = FirstName, @LastName = LastName, @Phone = Phone
FROM Staff
WHERE StaffID = @StaffID;
GO
--RUN
DECLARE @FirstName nvarchar(20);
DECLARE @LastName nvarchar(30);
DECLARE @Phone nvarchar(15);
EXEC spStaffContact 1, @FirstName
OUTPUT, @LastName OUTPUT, @Phone OUTPUT;
SELECT @FirstName AS 'First Name', @LastName AS 'Last Name', @Phone AS 'Phone';
*/
--STORED PROCEDURE THAT INCLUDES A RETURN VALUE
/*
USE Planet_Fun;
GO
CREATE PROC spStaffCount
AS
DECLARE @StaffCount int;
SELECT @StaffCount = COUNT(*)
FROM Staff 
RETURN @StaffCount;
GO

DECLARE @StaffCount int;
EXEC @StaffCount = spStaffCount;
PRINT 'There are ' + CONVERT(varchar, @StaffCount) + ' staff members in your database';
GO
*/

---------------- Final Project User Defined Functions ----------------

--CREATES FUNCTION
/*
USE Planet_Fun;
GO
CREATE FUNCTION fnGetProduct
	(@ProductName nvarchar(50) = '%')
	RETURNS int
BEGIN
	RETURN (SELECT ProductID FROM Products
WHERE ProductName LIKE @ProductName);
END;
*/
--USES FUNCTION
/*
USE Planet_Fun;
GO
SELECT ProductID, ProductDescription, UnitPrice
FROM Products
WHERE ProductID = dbo.fnGetProduct('Hus%');

USE Planet_Fun;
GO
CREATE FUNCTION fnProducts
	(@ProductName nvarchar(50) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Products WHERE ProductName LIKE @ProductName);
GO
SELECT * FROM dbo.fnProducts('%e%');
*/

-------------------- Final Project Triggers --------------------

----CREATE ARCHIVE TABLE BY COPYING ORDERS TABLE WITHOUT ANY ROWS
/*
USE Planet_Fun;
GO
SELECT * INTO OrdersArchive
FROM Orders
WHERE 1=0;
*/
----UPDATE OrdersArchive TABLE AND ADD ACTIVITY COLUMN FOR STATUS
/*
ALTER TABLE OrdersArchive
ADD Activity varchar(50);
GO
*/
----CREATE INSERT TRIGGER
/*
CREATE TRIGGER OrdersArchive_INSERT ON Orders
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @OrderID int
		DECLARE @StaffID int
		DECLARE @OrderDate date
		DECLARE @ShippedDate date
		DECLARE @SupplierID int
		DECLARE @ShipperID int
	
	SELECT @OrderID = INSERTED.OrderID,
		   @StaffID = INSERTED.StaffID,
		   @OrderDate = INSERTED.OrderDate,
		   @SupplierID = INSERTED.SupplierID,
		   @ShipperID = INSERTED.ShipperID
	FROM INSERTED

INSERT INTO OrdersArchive VALUES(
	@OrderID,
	@StaffID,
	@OrderDate,
	@ShippedDate,
	@SupplierID,
	@ShipperID,
	'Inserted')
END
GO
*/
----ADD ROW INTO ORDERS TO TEST INSERT TRIGGER
/*
USE Planet_Fun;
INSERT INTO Orders VALUES(6, 90500, '2019-03-15', '2019-03-16',5000,410);
GO
*/
----VIEW DATA IN ORDERS ARCHIVE
/*
SELECT*FROM OrdersArchive;
GO
*/
----CREATE DELETE TRIGGER
/*
CREATE TRIGGER OrdersArchive_Delete ON Orders
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @OrderID int
		DECLARE @StaffID int
		DECLARE @OrderDate date
		DECLARE @ShippedDate date
		DECLARE @SupplierID int
		DECLARE @ShipperID int

	SELECT @OrderID = DELETED.OrderID,
		   @StaffID = DELETED.StaffID,
		   @OrderDate = DELETED.OrderDate,
		   @SupplierID = DELETED.SupplierID,
		   @ShipperID = DELETED.ShipperID
	FROM DELETED

INSERT INTO OrdersArchive VALUES(
	@OrderID,
	@StaffID,
	@OrderDate,
	@ShippedDate,
	@SupplierID,
	@ShipperID,
	'Deleted')
END
GO
*/
----DELETE ROW FROM ORDERS TO TEST DELETE TRIGGER
/*
DELETE FROM Customers WHERE CustomerID = 9;
GO
*/
----VIEW DATA IN ORDERS ARCHIVE
/*
SELECT*FROM OrdersArchive;
GO
*/
----CREATE UPDATE TRIGGER
/*
CREATE TRIGGER OrdersArchive_Update ON Orders
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
		DECLARE @OrderID int
		DECLARE @StaffID int
		DECLARE @OrderDate date
		DECLARE @ShippedDate date
		DECLARE @SupplierID int
		DECLARE @ShipperID int
	
	SELECT @OrderID = INSERTED.OrderID,
		   @StaffID = INSERTED.StaffID,
		   @OrderDate = INSERTED.OrderDate,
		   @SupplierID = INSERTED.SupplierID,
		   @ShipperID = INSERTED.ShipperID
	FROM INSERTED

INSERT INTO OrdersArchive VALUES(
	@OrderID,
	@StaffID,
	@OrderDate,
	@ShippedDate,
	@SupplierID,
	@ShipperID,
	'Updated')
END
GO
*/
----INSERT THEN UPDATE NEW ROW
/*
INSERT INTO Orders VALUES(6, 90500, '2019-03-15', '2019-03-16',5000,410);
GO
UPDATE Orders 
SET OrderDate = '2019-03-14'
WHERE OrderID = 6;
GO
*/
-- view data in customer archive
/*
SELECT * FROM OrdersArchive;
*/