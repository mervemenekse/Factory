

USE FACTORY
GO

--*** Let's create 4 tables ***

CREATE TABLE Product
(
	ProductID VARCHAR(10) PRIMARY KEY NOT NULL,
	ProductName VARCHAR(20),
);
--*************************************************

CREATE TABLE Personal
(
	PersonalID INT PRIMARY KEY NOT NULL,
	Name VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL
);
--*************************************************

CREATE TABLE PersonalQuota
(
	PersonalID INT NOT NULL,
	ProductID VARCHAR(10) NOT NULL,
	TotalProduction INT
);
--*************************************************
CREATE TABLE AnnualProductQuota
(
	ProductID VARCHAR(20) PRIMARY KEY NOT NULL,
	AnnualExpectedQuota INT,
	CurrentQuota INT
);

