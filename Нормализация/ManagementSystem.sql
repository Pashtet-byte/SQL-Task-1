CREATE DATABASE ManagementSystem;
GO

USE ManagementSystem;
GO

-- Создание таблицы Products
CREATE TABLE Products (
    ProdID INT NOT NULL PRIMARY KEY,
    Description NCHAR(50),
    UnitPrice MONEY,
    Weight NUMERIC(18, 0)
);
GO

-- Создание таблицы Customers
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

-- Создание таблицы Employees
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

-- Создание таблицы Orders
CREATE TABLE Orders (
    OrderID INT NOT NULL PRIMARY KEY,
    CustomerNo INT,
    OrderDate DATETIME,
    EmployedID INT,
    FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo),
    FOREIGN KEY (EmployedID) REFERENCES Employees(EmployedID)
);
GO

-- Создание таблицы OrderDetails
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

-- Вставка тестовых данных в таблицу Products
INSERT INTO Products (ProdID, Description, UnitPrice, Weight) VALUES
(1, N'Ноутбук Dell XPS 13', 999.99, 1200),
(2, N'Смартфон Samsung Galaxy S21', 799.99, 169),
(3, N'Наушники Sony WH-1000XM4', 349.99, 254),
(4, N'Планшет iPad Air', 599.99, 458),
(5, N'Монитор LG 27GL850', 449.99, 5100);
GO

-- Вставка тестовых данных в таблицу Customers
INSERT INTO Customers (CustomerNo, FName, LName, MName, Address1, Address2, City, Phone, DateInSystem) VALUES
(1, N'Иван', N'Петров', N'Сергеевич', N'ул. Ленина, д. 15', N'кв. 42', N'Москва', N'+7-495-123-45-67', '20240115'),
(2, N'Мария', N'Сидорова', N'Александровна', N'пр. Мира, д. 28', N'офис 305', N'Санкт-Петербург', N'+7-812-987-65-43', '20240220'),
(3, N'Алексей', N'Козлов', N'Дмитриевич', N'ул. Гагарина, д. 7', N'', N'Новосибирск', N'+7-383-456-78-90', '20240310'),
(4, N'Екатерина', N'Николаева', N'Владимировна', N'бульвар Победы, д. 33', N'кв. 18', N'Екатеринбург', N'+7-343-111-22-33', '20240128');
GO

-- Вставка тестовых данных в таблицу Employees
INSERT INTO Employees (EmployedID, FName, LName, MName, Salary, PriceSalary, HireDate, TerminatorDate, ManagerEmqID) VALUES
(1, N'Анна', N'Смирнова', N'Олеговна', 75000.00, 15000.00, '20230115', NULL, NULL),
(2, N'Дмитрий', N'Васильев', N'Игоревич', 65000.00, 12000.00, '20230320', NULL, 1),
(3, N'Ольга', N'Павлова', N'Сергеевна', 70000.00, 13000.00, '20230210', NULL, 1),
(4, N'Сергей', N'Федоров', N'Анатольевич', 60000.00, 10000.00, '20230615', '20240501', 2);
GO

-- Вставка тестовых данных в таблицу Orders
INSERT INTO Orders (OrderID, CustomerNo, OrderDate, EmployedID) VALUES
(1, 1, '2024-05-01', 2),
(2, 2, '2024-05-02', 3),
(3, 3, '2024-05-03', 2),
(4, 4, '2024-05-04', 3),
(5, 1, '2024-05-05', 2);
GO

-- Вставка тестовых данных в таблицу OrderDetails
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


-- Пример использования представления
SELECT * FROM vw_OrderSummary ORDER BY OrderTotal DESC;
GO