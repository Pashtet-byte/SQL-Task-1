CREATE DATABASE ShopsDB    
ON							  
(
	NAME = 'ShopsDB',            
	FILENAME = 'C:\Users\Администратор\Pictures\ShopsDB.mdf', 
	SIZE = 10MB,                    
	MAXSIZE = 100MB,				
	FILEGROWTH = 10MB				
)
LOG ON						  
( 
	NAME = 'LogShopsDB',            
	FILENAME = 'C:\Users\Администратор\Pictures\LogShopsDB.ldf', 
	SIZE = 5MB,                        
	MAXSIZE = 50MB,                    
	FILEGROWTH = 5MB                   
)   
COLLATE Cyrillic_General_CI_AS

DROP TABLE Employees
GO

CREATE TABLE Employees                 
(                      
	EmployeedID int NOT NULL PRIMARY KEY,
	FName nvarchar(15) NOT NULL,   
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NOT NULL,
	Salary money NOT NULL,
	PriorSalary money NOT NULL,
	HireDate date NOT NULL,
	TerminationDate date NULL,
	ManagerEmpID int NULL,
);
GO

DROP TABLE Customer
GO

CREATE TABLE Customer
(
	CustomerNo int NOT NULL PRIMARY KEY IDENTITY(1,1),
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL
);
GO

DROP TABLE Orders
GO

CREATE TABLE Orders
( 
	OrderID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CustomerNo int NOT NULL 
		FOREIGN KEY REFERENCES Customer(CustomerNo),  -- связь с Customer
	EmployeeID int NOT NULL 
		FOREIGN KEY REFERENCES Employees(EmployeedID), -- ДОБАВЛЕНА связь с Employees
	OrderDate date NOT NULL,
	Goods varchar(30) NOT NULL 
);
GO

SELECT * FROM Employees;
SELECT * FROM Customer;
SELECT * FROM Orders;