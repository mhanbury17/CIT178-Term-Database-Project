USE Planet_Fun;
/*

	INSERT INFORMATION FROM EXCEL TABLES

	--TABLES WITHOUT FOREIGN KEYS--

--TERRITORIES TABLE
INSERT INTO Territories VALUES(100,'Owners Office')
INSERT INTO Territories VALUES(210,'Arcade Counter')
INSERT INTO Territories VALUES(220,'Arcade Stock')
INSERT INTO Territories VALUES(230,'Arcade Game Area')
INSERT INTO Territories VALUES(240,'Arcade Basement')
INSERT INTO Territories VALUES(310,'Bowling Counter')
INSERT INTO Territories VALUES(320,'Front Office')
--PRODUCTS TABLE
INSERT INTO Products VALUES(1,'Bear','Soft 12-inch bear',4,16.00,300,NULL)
INSERT INTO Products VALUES(2,'Sucker','1-inch multi-flavor suckers',12,6.50,20,NULL)
INSERT INTO Products VALUES(3,'Fake Mustache','Fur-mustache',35,4.75,10,NULL)
INSERT INTO Products VALUES(4,'Playstation 4','Gaming Console',1,299.99,80000,NULL)
INSERT INTO Products VALUES(5,'Speaker','Sound Playing Device',4,40.00,4000,NULL)
INSERT INTO Products VALUES(6,'Rhino Pearl','2"-4" Pin, 15lbs',1,120.00,NULL,140.00)
INSERT INTO Products VALUES(7,'Hustle INK','2"-4" Pin, 15lbs',1,90.00,NULL,120.00)
INSERT INTO Products VALUES(8,'Tropical Pink/Blue','2"-4" Pin, 12lbs',1,68.00,NULL,80)
INSERT INTO Products VALUES(9,'Black Widow','2"-4" Pin, 16lbs',1,210.00,NULL,240.00)
--SHIPPERS TABLE
INSERT INTO Shippers VALUES(410,'UPS','Ground','(612)435-9768')
INSERT INTO Shippers VALUES(411,'USPS','Ground','(453)234-1764')
INSERT INTO Shippers VALUES(412,'FedEx','Air','(156)176-4613')
INSERT INTO Shippers VALUES(413,'KSS Enterprises','Ground','(345)653-4567')
INSERT INTO Shippers VALUES(414,'Odoyall','Overseas','(515)254-2456')
--SUPPLIERS TABLE
INSERT INTO Suppliers VALUES(5000,'Amusement Central','5421 Rafilia Strt','Wasau','WI','53005','U.S.','(274)894-3154')
INSERT INTO Suppliers VALUES(5001,'Entertainment Express','1244 Holiday Ave','Houston','TX','77019','U.S.','(281)168-3444')
INSERT INTO Suppliers VALUES(5002,'Drunswick','234 Beretta Ave','Los Angeles','CA','90031','U.S.','(213)464-1384')
INSERT INTO Suppliers VALUES(5003,'Samual & Brothers','213 Hung Waoi','Shanghai',NULL,NULL,'China','+86(214)1436-4263')
INSERT INTO Suppliers VALUES(5004,'Screwdriver Bowling','4545 Putnam','Columbus','OH','45830','U.S.','(614)438-1683')
--CUSTOMERS TABLE
INSERT INTO Customers VALUES(3071,'Danny','Biever','(952)234-8327','BusyBiever@outlook.com')
INSERT INTO Customers VALUES(3070,'Susan','Stuffer','(952)414-1243','Soccermom4343@gmail.com')
INSERT INTO Customers VALUES(3069,'Derek','Porterson','(952)245-6234','Portsale23@gmail.com')
INSERT INTO Customers VALUES(3068,'Erik','Moose','(952)176-4124','MooseMaster@yahoo.com')
INSERT INTO Customers VALUES(3067,'Elon','Musk','(952)513-5000','TeslaGuy@SpaceX.com')
INSERT INTO Customers VALUES(0,NULL,NULL,NULL,NULL)

	--TABLES WITH FOREIGN KEYS--

--STAFF TABLE
INSERT INTO Staff VALUES(90500,'Styles','Cadbury','Counter','05-23-2000','03-14-2016','883 Emerson Ave S','Bloomington','MN','55122','(952)368-3843','CadburyS@planetfun.com',310)
INSERT INTO Staff VALUES(90501,'Victor','Breedland','Counter','07-23-1969','10-27-1995','1789 Parnell Ave','Edina','MN','55343','(952)643-3698','BreedlandV@planetfun.com',310)
INSERT INTO Staff VALUES(90502,'Myles','Dice','General Manager','09-15-1972','06-25-1989','431 Morgan Ave S','Bloomington','MN','5512','(952)438-3867','DiceM@planetfun.com',320)
INSERT INTO Staff VALUES(90503,'David','Roarhaurdt','Owner','11-13-1948','06-16-1989','James Ave S','Bloomington','MN','5512','(952)312-8456','RoarhaurdtD@planetfun.com',100)
INSERT INTO Staff VALUES(90504,'Diva','Billiez','Shift Manager','12-23-1991','07-24-2007','678 Sherwood Ave','Edina','MN','55343','(952)135-1688','BilliezD@planetfun.com',210)
--ATTRACTIONS TABLE
INSERT INTO Attractions VALUES(1000,'Bumper Cars',4.00,1407,5628,0,35000,240)
INSERT INTO Attractions VALUES(1001,'Laser Tag',8.00,2344,18752,0,80000,240)
INSERT INTO Attractions VALUES(1002,'Escape Room',20.00,123,2460,0,7500,240)
INSERT INTO Attractions VALUES(1003,'Laser Maze',2.00,4321,8642,0,2500,240)
INSERT INTO Attractions VALUES(1004,'Whac-A-Mole',0.50,17891,8945.5,9877,1200,230)
--FUNCARDS TABLE
INSERT INTO Funcards VALUES(8003156,'Arcade',0.13,1447,'01-23-2019',40,'NO',0)
INSERT INTO Funcards VALUES(8003157,'Arcade',12.34,13,'02-10-2019',20,'NO',0)
INSERT INTO Funcards VALUES(8003158,'Arcade',47,0,'02-21-2019',50,'NO',0)
INSERT INTO Funcards VALUES(8003159,'GiftCard',100,0,'12-23-2018',100,'YES',3070)
INSERT INTO Funcards VALUES(8003160,'Arcade',0.01,22450,'02-1-2019',550,'YES',3071)
--ORDER DETAILS TABLE
INSERT INTO OrderDetails VALUES(1,6,1)
INSERT INTO OrderDetails VALUES(2,7,1)
INSERT INTO OrderDetails VALUES(3,8,1)
INSERT INTO OrderDetails VALUES(4,9,1)
INSERT INTO OrderDetails VALUES(5,1,10)
--ORDERS TABLE
INSERT INTO Orders VALUES(1,90501,'2/18/2019','2/19/2019',5002,410)
INSERT INTO Orders VALUES(2,90501,'2/18/2019','2/19/2019',5002,410)
INSERT INTO Orders VALUES(3,90501,'2/18/2019','2/19/2019',5002,410)
INSERT INTO Orders VALUES(4,90500,'2/14/2019','2/16/2019',5002,410)
INSERT INTO Orders VALUES(5,90500,'2/14/2019','2/15/2019',5000,410)
--SALES ARCHIVE TABLE
INSERT INTO SalesArchive VALUES(1,1,2,8003156)
INSERT INTO SalesArchive VALUES(2,1,1,8003157)
INSERT INTO SalesArchive VALUES(3,2,4,8003156)
INSERT INTO SalesArchive VALUES(4,3,10,8003156)
INSERT INTO SalesArchive VALUES(5,2,1,8003157)
*/