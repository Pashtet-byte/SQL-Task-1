CREATE DATABASE ManagementSystem;
GO

USE ManagementSystem;
GO

-- �������� ������� Products
CREATE TABLE Products (
    ProdID INT NOT NULL PRIMARY KEY,
    Description NCHAR(50),
    UnitPrice MONEY,
    Weight NUMERIC(18, 0)
);
GO

-- �������� ������� Customers
CREATE TABLE Customers (
    CustomerNo INT NOT NULL PRIMARY KEY,
    FName NVARCHAR(50),
    LName NVARCHAR(50),
    MName NVARCHAR(50),
    Address1 NVARCHAR(100),
    Address2 NVARCHAR(100),
    City NVARCHAR(50),
    Phone NVARCHAR(20),
    DateInSystem DATETIME
);
GO

-- �������� ������� Employees
CREATE TABLE Employees (
    EmployedID INT NOT NULL PRIMARY KEY,
    FName NVARCHAR(50),
    LName NVARCHAR(50),
    MName NVARCHAR(50),
    Salary MONEY,
    PriceSalary MONEY,
    HireDate DATETIME,
    TerminatorDate DATETIME,
    ManagerEmqID INT,
    FOREIGN KEY (ManagerEmqID) REFERENCES Employees(EmployedID)
);
GO

-- �������� ������� Orders
CREATE TABLE Orders (
    OrderID INT NOT NULL PRIMARY KEY,
    CustomerNo INT,
    OrderDate DATETIME,
    EmployedID INT,
    FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo),
    FOREIGN KEY (EmployedID) REFERENCES Employees(EmployedID)
);
GO

-- �������� ������� OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    UnetItem INT NOT NULL,
    ProdID INT NOT NULL,
    Qty INT,
    UnitPrice MONEY,
    PRIMARY KEY (OrderID, UnetItem),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProdID) REFERENCES Products(ProdID)
);
GO

-- ������� �������� ������ � ������� Products
INSERT INTO Products (ProdID, Description, UnitPrice, Weight) VALUES
(1, N'������� Dell XPS 13', 999.99, 1200),
(2, N'�������� Samsung Galaxy S21', 799.99, 169),
(3, N'�������� Sony WH-1000XM4', 349.99, 254),
(4, N'������� iPad Air', 599.99, 458),
(5, N'������� LG 27GL850', 449.99, 5100);
GO

-- ������� �������� ������ � ������� Customers
INSERT INTO Customers (CustomerNo, FName, LName, MName, Address1, Address2, City, Phone, DateInSystem) VALUES
(1, N'����', N'������', N'���������', N'��. ������, �. 15', N'��. 42', N'������', N'+7-495-123-45-67', '20240115'),
(2, N'�����', N'��������', N'�������������', N'��. ����, �. 28', N'���� 305', N'�����-���������', N'+7-812-987-65-43', '20240220'),
(3, N'�������', N'������', N'����������', N'��. ��������, �. 7', N'', N'�����������', N'+7-383-456-78-90', '20240310'),
(4, N'���������', N'���������', N'������������', N'������� ������, �. 33', N'��. 18', N'������������', N'+7-343-111-22-33', '20240128');
GO

-- ������� �������� ������ � ������� Employees
INSERT INTO Employees (EmployedID, FName, LName, MName, Salary, PriceSalary, HireDate, TerminatorDate, ManagerEmqID) VALUES
(1, N'����', N'��������', N'��������', 75000.00, 15000.00, '20230115', NULL, NULL),
(2, N'�������', N'��������', N'��������', 65000.00, 12000.00, '20230320', NULL, 1),
(3, N'�����', N'�������', N'���������', 70000.00, 13000.00, '20230210', NULL, 1),
(4, N'������', N'�������', N'�����������', 60000.00, 10000.00, '20230615', '20240501', 2);
GO

-- ������� �������� ������ � ������� Orders
INSERT INTO Orders (OrderID, CustomerNo, OrderDate, EmployedID) VALUES
(1, 1, '2024-05-01', 2),
(2, 2, '2024-05-02', 3),
(3, 3, '2024-05-03', 2),
(4, 4, '2024-05-04', 3),
(5, 1, '2024-05-05', 2);
GO

-- ������� �������� ������ � ������� OrderDetails
INSERT INTO OrderDetails (OrderID, UnetItem, ProdID, Qty, UnitPrice) VALUES
(1, 1, 1, 1, 999.99),
(1, 2, 3, 1, 349.99),
(2, 1, 2, 2, 799.99),
(2, 2, 5, 1, 449.99),
(3, 1, 4, 1, 599.99),
(4, 1, 2, 1, 799.99),
(4, 2, 3, 2, 349.99),
(5, 1, 5, 3, 449.99);
GO


-- ������ ������������� �������������
SELECT * FROM vw_OrderSummary ORDER BY OrderTotal DESC;
GO