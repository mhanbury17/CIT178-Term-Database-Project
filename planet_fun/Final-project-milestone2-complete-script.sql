USE [master]
GO
/****** Object:  Database [Planet_Fun]    Script Date: 2/22/2019 5:07:46 PM ******/
CREATE DATABASE [Planet_Fun]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Planet_Fun', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Planet_Fun.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Planet_Fun_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Planet_Fun_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Planet_Fun] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Planet_Fun].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Planet_Fun] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Planet_Fun] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Planet_Fun] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Planet_Fun] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Planet_Fun] SET ARITHABORT OFF 
GO
ALTER DATABASE [Planet_Fun] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Planet_Fun] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Planet_Fun] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Planet_Fun] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Planet_Fun] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Planet_Fun] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Planet_Fun] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Planet_Fun] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Planet_Fun] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Planet_Fun] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Planet_Fun] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Planet_Fun] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Planet_Fun] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Planet_Fun] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Planet_Fun] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Planet_Fun] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Planet_Fun] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Planet_Fun] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Planet_Fun] SET  MULTI_USER 
GO
ALTER DATABASE [Planet_Fun] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Planet_Fun] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Planet_Fun] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Planet_Fun] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Planet_Fun] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Planet_Fun] SET QUERY_STORE = OFF
GO
USE [Planet_Fun]
GO
/****** Object:  Table [dbo].[Attractions]    Script Date: 2/22/2019 5:07:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attractions](
	[AttractionID] [int] NOT NULL,
	[AttractionName] [varchar](30) NULL,
	[Price] [money] NOT NULL,
	[TotalPlays] [int] NULL,
	[TotalRevenue] [money] NULL,
	[TotalPayout] [int] NULL,
	[AttractionCost] [money] NOT NULL,
	[TerritoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/22/2019 5:07:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcards]    Script Date: 2/22/2019 5:07:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcards](
	[FuncardID] [int] NOT NULL,
	[CardType] [varchar](30) NOT NULL,
	[CreditsRemaining] [money] NULL,
	[Tickets] [int] NULL,
	[DateIssued] [date] NULL,
	[OverallCredits] [money] NULL,
	[Registered] [varchar](10) NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FuncardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/22/2019 5:07:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quanity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/22/2019 5:07:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ShippedDate] [date] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[ShipperID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/22/2019 5:07:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](30) NOT NULL,
	[ProductDescription] [varchar](50) NULL,
	[QuanityPerUnit] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Tickets] [int] NULL,
	[Credits] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesArchive]    Script Date: 2/22/2019 5:07:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesArchive](
	[SaleID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quanity] [int] NOT NULL,
	[FuncardID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 2/22/2019 5:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] NOT NULL,
	[CompanyName] [varchar](30) NOT NULL,
	[ShipmentType] [varchar](20) NOT NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2/22/2019 5:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[HireDate] [date] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Zipcode] [varchar](10) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](50) NULL,
	[TerritoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2/22/2019 5:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] NOT NULL,
	[CompanyName] [varchar](30) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Zipcode] [varchar](10) NOT NULL,
	[Country] [varchar](15) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Territories]    Script Date: 2/22/2019 5:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territories](
	[TerritoryID] [int] NOT NULL,
	[TerritoryDescription] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_AttractionTerritories]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_AttractionTerritories] ON [dbo].[Attractions]
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_CustomerFuncard]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_CustomerFuncard] ON [dbo].[Funcards]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_OrderDetails]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_OrderDetails] ON [dbo].[OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ProductOrder]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_ProductOrder] ON [dbo].[OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_OrderShipper]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_OrderShipper] ON [dbo].[Orders]
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_OrderSupplier]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_OrderSupplier] ON [dbo].[Orders]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_StaffOrders]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_StaffOrders] ON [dbo].[Orders]
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ProductSales]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_ProductSales] ON [dbo].[SalesArchive]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_SaleFuncard]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_SaleFuncard] ON [dbo].[SalesArchive]
(
	[FuncardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_StaffTerritories]    Script Date: 2/22/2019 5:07:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_StaffTerritories] ON [dbo].[Staff]
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attractions]  WITH CHECK ADD  CONSTRAINT [FK_AttractionTerritories] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Territories] ([TerritoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Attractions] CHECK CONSTRAINT [FK_AttractionTerritories]
GO
ALTER TABLE [dbo].[Funcards]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFuncard] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Funcards] CHECK CONSTRAINT [FK_CustomerFuncard]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrder] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_ProductOrder]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrderShipper] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shippers] ([ShipperID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrderShipper]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrderSupplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrderSupplier]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_StaffOrders] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_StaffOrders]
GO
ALTER TABLE [dbo].[SalesArchive]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SalesArchive] CHECK CONSTRAINT [FK_ProductSale]
GO
ALTER TABLE [dbo].[SalesArchive]  WITH CHECK ADD  CONSTRAINT [FK_SaleFuncard] FOREIGN KEY([FuncardID])
REFERENCES [dbo].[Funcards] ([FuncardID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SalesArchive] CHECK CONSTRAINT [FK_SaleFuncard]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_StaffTerritories] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Territories] ([TerritoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_StaffTerritories]
GO
USE [master]
GO
ALTER DATABASE [Planet_Fun] SET  READ_WRITE 
GO
