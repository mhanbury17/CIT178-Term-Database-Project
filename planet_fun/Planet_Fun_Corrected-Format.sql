USE Planet_Fun;
/*


	CREATE TABLES FOR PLANET FUN DATABASE


GO
CREATE TABLE Staff(
	StaffID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	Title varchar(20) NOT NULL,
	BirthDate date NOT NULL,
	HireDate date NOT NULL,
	Address varchar(50) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(20) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Phone varchar(15) NOT NULL,
	Email varchar(50),
	TerritoryID int NOT NULL,
	PRIMARY KEY(StaffID)
);
GO
CREATE TABLE Territories(
	TerritoryID int NOT NULL,
	TerritoryDescription varchar(50) NOT NULL,
	PRIMARY KEY(TerritoryID)
);
GO
CREATE TABLE Orders(
	OrderID int NOT NULL,
	StaffID int NOT NULL,
	OrderDate date NOT NULL,
	ShippedDate date NOT NULL,
	SupplierID int NOT NULL,
	ShipperID int NOT NULL,
	PRIMARY KEY(OrderID)
);
GO
CREATE TABLE OrderDetails(
	OrderID int NOT NULL,
	ProductID int NOT NULL,
	Quanity int NOT NULL
);
GO
CREATE TABLE Attractions(
	AttractionID int NOT NULL,
	AttractionName varchar(30),
	Price money NOT NULL,
	TotalPlays int,
	TotalRevenue money,
	TotalPayout int,
	AttractionCost money NOT NULL,
	TerritoryID int NOT NULL,
	PRIMARY KEY(AttractionID)
);
GO
CREATE TABLE Products(
	ProductID int NOT NULL,
	ProductName varchar(30) NOT NULL,
	ProductDescription varchar(50),
	QuanityPerUnit int NOT NULL,
	UnitPrice money NOT NULL,
	PRIMARY KEY(ProductID)
);
GO
CREATE TABLE Shippers(
	ShipperID int NOT NULL,
	CompanyName varchar(30) NOT NULL,
	ShipmentType varchar(20) NOT NULL,
	Phone varchar(15)
);
GO
CREATE TABLE Suppliers(
	SupplierID int NOT NULL,
	CompanyName varchar(30) NOT NULL,
	Address varchar(50) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(20) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Country varchar(15) NOT NULL,
	Phone varchar(15) NOT NULL,
	PRIMARY KEY(SupplierID)
);
GO
CREATE TABLE SalesArchive(
	SaleID int NOT NULL,
	ProductID int NOT NULL,
	Quanity int NOT NULL,
	Price int NOT NULL,
	Funcard int NOT NULL,
	PRIMARY KEY(SaleID)
);
GO
CREATE TABLE Funcards(
	FuncardID int NOT NULL,
	CardType varchar(30) NOT NULL,
	CreditsRemaining money,
	Tickets int,
	DateIssued date,
	OverallCredits money,
	Registered varchar(10) NOT NULL,
	CustomerID int NOT NULL,
	PRIMARY KEY(FuncardID)
);
GO
CREATE TABLE Customers(
	CustomerID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	Phone varchar(15),
	Email varchar(30),
	PRIMARY KEY(CustomerID)
);


	ADD FORGOTTEN COLUMNS AND PRIMARY KEYS


GO
ALTER TABLE SalesArchive
DROP COLUMN Funcard
GO
ALTER TABLE SalesArchive
ADD FuncardID int NOT NULL
GO
ALTER TABLE Shippers
ADD PRIMARY KEY(ShipperID)


CREATE CONSTRAINTS FOR TABLES


GO
ALTER TABLE Staff WITH CHECK
ADD CONSTRAINT FK_StaffTerritories FOREIGN KEY(TerritoryID) REFERENCES Territories(TerritoryID)
ON UPDATE CASCADE
GO
ALTER TABLE Orders WITH CHECK
ADD CONSTRAINT FK_StaffOrders FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
ON UPDATE CASCADE
GO
ALTER TABLE Orders WITH CHECK
ADD CONSTRAINT FK_OrderSupplier FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID)
ON UPDATE CASCADE
GO
ALTER TABLE Orders WITH CHECK
ADD CONSTRAINT FK_OrderShipper FOREIGN KEY(ShipperID) REFERENCES Shippers(ShipperID)
ON UPDATE CASCADE
GO
ALTER TABLE OrderDetails WITH CHECK
ADD CONSTRAINT FK_OrderDetails FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
ON UPDATE CASCADE
GO
ALTER TABLE Attractions WITH CHECK
ADD CONSTRAINT FK_AttractionTerritories FOREIGN KEY(TerritoryID) REFERENCES Territories(TerritoryID)
ON UPDATE CASCADE
GO
ALTER TABLE SalesArchive WITH CHECK
ADD CONSTRAINT FK_SaleFuncard FOREIGN KEY(FuncardID) REFERENCES Funcards(FuncardID)
ON UPDATE CASCADE
GO
ALTER TABLE Funcards WITH CHECK
ADD CONSTRAINT FK_CustomerFuncard FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
ON UPDATE CASCADE
GO
ALTER TABLE SalesArchive WITH CHECK
ADD CONSTRAINT FK_ProductSale FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
ON UPDATE CASCADE
GO
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_ProductOrder FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
ON UPDATE CASCADE


	ADD INDICES


GO
CREATE INDEX idx_StaffTerritories ON Staff(TerritoryID);
GO
CREATE INDEX idx_StaffOrders ON Orders(StaffID);
GO
CREATE INDEX idx_OrderSupplier ON Orders(SupplierID);
GO
CREATE INDEX idx_OrderShipper ON Orders(ShipperID);
GO
CREATE INDEX idx_ProductOrder ON OrderDetails(ProductID);
GO
CREATE INDEX idx_OrderDetails ON OrderDetails(OrderID);
GO
CREATE INDEX idx_AttractionTerritories ON Attractions(TerritoryID);
GO
CREATE INDEX idx_ProductSales ON SalesArchive(ProductID);
GO
CREATE INDEX idx_SaleFuncard ON SalesArchive(FuncardID);
GO
CREATE INDEX idx_CustomerFuncard ON Funcards(CustomerID);


	OTHER CHANGES


GO
ALTER TABLE SalesArchive
DROP COLUMN Price
ALTER TABLE Products
ADD Tickets int
ALTER TABLE Products
ADD Credits money
*/