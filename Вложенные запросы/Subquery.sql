USE ShopsDB
GO

-- 1. �������� ���������� �� ���������� �������� ������ ������ � ������� ��������
SELECT 
    p.ProdID,
    p.Description,
    SUM(od.Qty) as TotalSoldUnits
FROM Products p
INNER JOIN OrderDetails od ON p.ProdID = od.ProdID
GROUP BY p.ProdID, p.Description
ORDER BY TotalSoldUnits DESC;

-- 2. ������� ����� ����� ������ �� ������� �� �������
SELECT 
    p.ProdID,
    p.Description,
    SUM(od.TotalPrice) as TotalSales
FROM Products p
INNER JOIN OrderDetails od ON p.ProdID = od.ProdID
GROUP BY p.ProdID, p.Description
ORDER BY TotalSales DESC;

-- 3. ������� ����� ���������� ������ �� ������� �� �����������
SELECT 
    e.EmployeeID,
    e.FName + ' ' + e.LName as EmployeeName,
    COUNT(o.OrderID) as TotalOrders
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FName, e.LName
ORDER BY TotalOrders DESC;

-- 4. ������� ���������� ������ �� �������
SELECT 
    c.City,
    COUNT(o.OrderID) as TotalSales
FROM Customers c
INNER JOIN Orders o ON c.CustomerNo = o.CustomerNo
GROUP BY c.City
ORDER BY TotalSales DESC;

-- 5. �������� ���� ������� �� ������� �� �����������
SELECT 
    c.CustomerNo,
    c.FName + ' ' + c.LName as CustomerName,
    o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerNo = o.CustomerNo
ORDER BY c.CustomerNo, o.OrderDate;

-- 6. ������� ��� �� ��������� ����� ����������� �����������
SELECT 
    e.FName + ' ' + e.LName as EmployeeName,
    c.FName + ' ' + c.LName as CustomerName,
    COUNT(o.OrderID) as OrdersCount
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
INNER JOIN Customers c ON o.CustomerNo = c.CustomerNo
GROUP BY e.EmployeeID, e.FName, e.LName, c.CustomerNo, c.FName, c.LName
ORDER BY EmployeeName, CustomerName;