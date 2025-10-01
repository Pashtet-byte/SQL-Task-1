USE ShopsDB
GO

-- 1. �������� ���������� �� ���������� �������� ������ ������ � ������� ��������
SELECT 
    Products.ProdID, 
    [Description], 
    SUM(Qty) AS TotalQty, 
    SUM(TotalPrice) AS TotalSold
FROM Products
INNER JOIN OrderDetails
    ON Products.ProdID = OrderDetails.ProdID
GROUP BY Products.ProdID, [Description]
ORDER BY TotalQty DESC;

-- 2. ������� ����� ���� ������ �� ������� �� �������
SELECT 
    Products.ProdID, 
    [Description], 
    SUM(TotalPrice) AS TotalSales
FROM Products
INNER JOIN OrderDetails
    ON Products.ProdID = OrderDetails.ProdID
GROUP BY Products.ProdID, [Description]
ORDER BY TotalSales DESC;

-- 3. ������� ����� ���������� ������ �� ������� �� �����������
SELECT 
    Employees.EmployeeID,
    Employees.FName, 
    Employees.LName, 
    Employees.MName,
    COUNT(Orders.OrderID) AS TotalOrders,
    SUM(OrderDetails.TotalPrice) AS TotalSales
FROM Employees
LEFT JOIN Orders
    ON Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN OrderDetails
    ON Orders.OrderID = OrderDetails.OrderID
GROUP BY 
    Employees.EmployeeID,
    Employees.FName, 
    Employees.LName, 
    Employees.MName
ORDER BY TotalSales DESC;

-- 4. ������� ���������� ������ �� �������
SELECT 
    Customers.City,
    COUNT(Orders.OrderID) AS TotalOrders,
    SUM(OrderDetails.TotalPrice) AS TotalSales
FROM Customers
LEFT JOIN Orders
    ON Customers.CustomerNo = Orders.CustomerNo
LEFT JOIN OrderDetails
    ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Customers.City
ORDER BY TotalSales DESC;

-- 5. �������� ���� ������� �� ������� �� �����������
SELECT 
    Customers.CustomerNo,
    Customers.FName, 
    Customers.LName, 
    Customers.MName,
    Orders.OrderDate,
    OrderDetails.TotalPrice
FROM Customers
INNER JOIN Orders
    ON Customers.CustomerNo = Orders.CustomerNo
INNER JOIN OrderDetails
    ON Orders.OrderID = OrderDetails.OrderID
ORDER BY Customers.CustomerNo, Orders.OrderDate;

-- 6. ������� ��� �� ��������� ����� ����������� �����������
SELECT 
    Employees.FName AS EmployeeFirstName,
    Employees.LName AS EmployeeLastName,
    Employees.MName AS EmployeeMiddleName,
    Customers.FName AS CustomerFirstName,
    Customers.LName AS CustomerLastName,
    Customers.MName AS CustomerMiddleName,
    Customers.City,
    Orders.OrderDate,
    SUM(OrderDetails.TotalPrice) AS OrderTotal
FROM Employees
INNER JOIN Orders
    ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Customers
    ON Orders.CustomerNo = Customers.CustomerNo
INNER JOIN OrderDetails
    ON Orders.OrderID = OrderDetails.OrderID
GROUP BY 
    Employees.FName, Employees.LName, Employees.MName,
    Customers.FName, Customers.LName, Customers.MName,
    Customers.City, Orders.OrderDate
ORDER BY Employees.LName, Customers.LName;