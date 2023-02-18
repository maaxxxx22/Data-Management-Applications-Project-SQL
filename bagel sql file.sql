CREATE TABLE Bagel_Orders_1NF
(
OrderId INT NOT NULL AUTO_INCREMENT, 
BagelId INT NOT NULL, 
OrderDate DATE NOT NULL,
CustomerFirstName NVARCHAR(50) NULL, 
CustomerLastName NVARCHAR(50) NULL, 
CustomerAddress1 NVARCHAR(50) NULL, 
CustomerAddress2 NVARCHAR(50) NULL, 
CustomerCity NVARCHAR(50) NULL, 
CustomerState CHAR(2) NULL, 
CustomerZip CHAR(6) NULL, 
CustomerPhone CHAR(10) NULL, 
DeliveryFee DECIMAL(2,2) NULL,
BagelName CHAR(75) NOT NULL, 
Description CHAR(250) NULL, 
Price DECIMAL(2,2) NULL, 
Quantity INT NOT NULL,
SpecialHandlingNotes CHAR(250) NULL,
CONSTRAINT PK_Bagel_Orders_1NF PRIMARY KEY (OrderID, BagelID)
);

USE test1;

CREATE TABLE Bagel_Order_2NF
(
OrderId INT NOT NULL AUTO_INCREMENT, 
OrderDate DATE NOT NULL,
CustomerFirstName NVARCHAR(50) NULL, 
CustomerLastName NVARCHAR(50) NULL, 
CustomerAddress1 NVARCHAR(50) NULL, 
CustomerAddress2 NVARCHAR(50) NULL, 
CustomerCity NVARCHAR(50) NULL, 
CustomerState CHAR(2) NULL, 
CustomerZip CHAR(6) NULL, 
CustomerPhone CHAR(10) NULL, 
DeliveryFee DECIMAL(2,2) NULL,
SpecialHandlingNotes CHAR(250) NULL,
CONSTRAINT PK_Bagel_Order_2NF PRIMARY KEY (OrderID)
);

SELECT * FROM Bagel_Order_2NF;

CREATE TABLE Bagel_2NF
(
BagelId INT NOT NULL, 
BagelName CHAR(75) NOT NULL, 
Description CHAR(250) NULL, 
Price DECIMAL(2,2) NULL, 
CONSTRAINT PK_Bagel_2NF PRIMARY KEY (BagelID)
);


CREATE TABLE Bagel_LineItem_2NF
(
OrderId INT NOT NULL AUTO_INCREMENT, 
BagelId INT NOT NULL, 
Quantity INT NOT NULL,
CONSTRAINT FK_Bagel_LineItem_2NF_Order FOREIGN KEY (OrderId) REFERENCES Bagel_Order_2NF(OrderId),
CONSTRAINT FK_Bagel_LineItem_2NF_Bagel FOREIGN KEY (BagelId) REFERENCES Bagel_2NF(BagelId),
CONSTRAINT PK_Bagel_LineItem_2NF PRIMARY KEY (OrderId, BagelId)
);


CREATE TABLE Customer_3NF
(
CustomerId INT NOT NULL,
CustomerFirstName NVARCHAR(50) NULL, 
CustomerLastName NVARCHAR(50) NULL, 
CustomerAddress1 NVARCHAR(50) NULL, 
CustomerAddress2 NVARCHAR(50) NULL, 
CustomerCity NVARCHAR(50) NULL, 
CustomerState CHAR(2) NULL, 
CustomerZip CHAR(6) NULL, 
CustomerPhone CHAR(10) NULL, 
CONSTRAINT PK_Customer_3NF PRIMARY KEY (CustomerId)
);

CREATE TABLE Bagel_Order_3NF
(
OrderId INT NOT NULL AUTO_INCREMENT, 
CustomerId INT NOT NULL,
OrderDate DATE NOT NULL,
DeliveryFee DECIMAL(2,2) NULL,
SpecialHandlingNotes CHAR(250) NULL,
CONSTRAINT FK_Order_Customer_3NF FOREIGN KEY (CustomerId) REFERENCES Customer_3NF(CustomerId),
CONSTRAINT PK_Bagel_Order_3NF PRIMARY KEY (OrderID)
);


CREATE TABLE Bagel_3NF
(
BagelId INT NOT NULL, 
BagelName CHAR(75) NOT NULL, 
Description CHAR(250) NULL, 
Price DECIMAL(2,2) NULL, 
CONSTRAINT PK_Bagel_3NF PRIMARY KEY (BagelID)
);


CREATE TABLE Bagel_LineItem_3NF
(
OrderId INT NOT NULL AUTO_INCREMENT, 
BagelId INT NOT NULL, 
Quantity INT NOT NULL,
CONSTRAINT FK_Bagel_LineItem_3NF_Order FOREIGN KEY (OrderId) REFERENCES Bagel_Order_3NF(OrderId),
CONSTRAINT FK_Bagel_LineItem_3NF_Bagel FOREIGN KEY (BagelId) REFERENCES Bagel_2NF(BagelId),
CONSTRAINT PK_Bagel_LineItem_3NF PRIMARY KEY (OrderId, BagelId)
);

CREATE TABLE Bagel_LineItem_3NF
(
OrderId INT NOT NULL AUTO_INCREMENT, 
BagelId INT NOT NULL, 
Quantity INT NOT NULL,
CONSTRAINT FK_Bagel_LineItem_3NF_Order FOREIGN KEY (OrderId) REFERENCES Bagel_Order_3NF(OrderId),
CONSTRAINT FK_Bagel_LineItem_3NF_Bagel FOREIGN KEY (BagelId) REFERENCES Bagel_3NF(BagelId),
CONSTRAINT PK_Bagel_LineItem_3NF PRIMARY KEY (OrderId, BagelId)
);