#20 Categories, and the total products in each category
SELECT CategoryName, COUNT(ProductID) AS TotalProducts
FROM Categories
JOIN Products
ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
ORDER BY TotalProducts DESC;

#21 Total customers per country/city
SELECT Country, City, COUNT(CustomerID) AS TotalCustomer
FROM Customers
GROUP BY City
ORDER BY TotalCustomer DESC;

#22 Products that need reordering
SELECT ProductID, ProductName, UnitsInStock, ReorderLevel
FROM Products
WHERE UnitsInStock < ReorderLevel;

#23 Products that need reordering continued
SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE (UnitsInStock + UnitsOnOrder) < ReorderLevel
AND Discontinued != 1;

#24 Customer list by region
SELECT CustomerID, CompanyName, Region
FROM Customers
ORDER BY 
CASE WHEN Region IS null THEN 1
ELSE 0
END, Region, CustomerID;

#25 High freight charges
SELECT ShipCountry, (SUM(Freight) / COUNT(ShipCountry)) as  AverageFreight
FROM Orders
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
LIMIT 3;

#26 High freight charges - 2015
SELECT ShipCountry, (SUM(Freight) / COUNT(ShipCountry)) as  AverageFreight
FROM Orders
WHERE YEAR(OrderDate)=2015
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
LIMIT 3;

#27 High freight charges with between
SELECT ShipCountry, AVG(freight) AS AverageFreight, OrderDate
FROM Orders
WHERE (OrderDate BETWEEN '2015-1-1' AND '2016-1-1')
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
LIMIT 3;

OrderID: 10807


#28 High freight charges - last year
SET @lastDate = (SELECT MAX(OrderDate) FROM Orders);

SELECT ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE OrderDate >= DATE_SUB(@lastDate, INTERVAL 1 YEAR)
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
LIMIT 3;


#29 Inventory List
SELECT Employees.EmployeeID, Employees.LastName, Orders.OrderID, Products.ProductName, OrderDetails.Quantity
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORDER BY Orders.OrderID, Products.ProductID;


#30 Customers with no orders
SELECT Customers.CustomerID, Orders.CustomerID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerID NOT IN (SELECT CustomerID FROM Orders);

#31 Customers with no orders for EmployeeID 4
SELECT DISTINCT Customers.CustomerID
FROM Customers
WHERE Customers.CustomerID 
NOT IN (SELECT CustomerID FROM Orders WHERE EmployeeID=4);




















