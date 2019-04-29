/*
	CREATE TABLES FOR "Planet_Fun" DATABASE

USE Planet_Fun;
CREATE TABLE Staff(
	StaffID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	Title varchar(20) NOT NULL,
	BirthDate date NOT NULL,
	HireDate date NOT NULL,
	Address varchar(50) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(10) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Phone varchar(15) NOT NULL,
	Email varchar(30),
	PRIMARY KEY(StaffID)
);
CREATE TABLE Territories(
	TerritoryID int NOT NULL,
	TerritoryDescription varchar(50) NOT NULL,
	PRIMARY KEY(TerritoryID)
);
CREATE TABLE Products(
	ProductID int NOT NULL,
	ProductName varchar(30) NOT NULL,
	ProductDescription varchar(50),
	QuanityPerUnit int NOT NULL,
	UnitPrice money NOT NULL,
	PRIMARY KEY(ProductID)
);
CREATE TABLE Attractions(
	AttractionID int NOT NULL,
	AttractionName varchar(30) NOT NULL,
	Price money NOT NULL,
	TotalPlays int,
	TotalRevenue money,
	TotalPayout int,
	AttractionCost money NOT NULL,
	PRIMARY KEY(AttractionID)
);
CREATE TABLE Suppliers(
	SupplierID int NOT NULL,
	CompanyName varchar(30) NOT NULL,
	Address varchar(50) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(10) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Country varchar(20) NOT NULL,
	Phone varchar(15),
	PRIMARY KEY(SupplierID)
);
CREATE TABLE Funcards(
	FuncardID int NOT NULL,
	CardType varchar(20) NOT NULL,
	CreditsRemaining money,
	Tickets int,
	DateIssued date,
	OverallCredits int,
	Registered varchar(10) NOT NULL,
	CustomerID int NOT NULL,
	PRIMARY KEY(FuncardID)
);
CREATE TABLE Customers(
	CustomerID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	Phone varchar(15),
	Email varchar(30),
	PRIMARY KEY(CustomerID)
);

ADD FOREIGN CONSTRAINTS TO "Planet_Fun" DATABASE

*/
