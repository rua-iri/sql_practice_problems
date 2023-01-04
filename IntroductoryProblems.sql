
#1 Which shippers do we have?
SELECT * FROM Shippers;

#2 Certain fields from Categories
SELECT CategoryName, Description FROM Categories;

#3 Sales Representatives
SELECT FirstName, LastName, HireDate FROM Employees WHERE Title="Sales Representative";

#4 Sales Representatives in the United States
SELECT FirstName, LastName, HireDate FROM Employees WHERE Title="Sales Representative" AND Country="USA";

#5 Orders placed by specific EmployeeID
SELECT OrderID, OrderDate FROM Orders WHERE EmployeeID=5;

#6 Suppliers and ContactTitles
SELECT SupplierID, ContactName, ContactTitle 
FROM Suppliers
WHERE ContactTitle != "Marketing Manager";

#7 Products with "queso" in ProductName
SELECT ProductID, ProductName
FROM Products
WHERE ProductName LIKE "%queso%";

#8 Orders Shipping to France or Belgium
SELECT OrderId, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry="France" OR ShipCountry="Belgium";

#9 Orders Shipping to any country in Latin America
SELECT OrderId, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry IN ("Brazil", "Mexico", "Argentina", "Venezuela");

#10 Employees, in order of age
SELECT FirstName, LastName, Title, BirthDate
FROM Employees
ORDER BY BirthDate ASC;

#11 Showing only the Date with a DateTime field
SELECT FirstName, LastName, Title, CONVERT(BirthDate, date)
FROM Employees
ORDER BY BirthDate ASC;

#12 Employees full name
SELECT FirstName, LastName, 
CONCAT(FirstName, " ", LastName) AS FullName
FROM Employees;

#13 OrderDetails amount per line item
SELECT OrderID, ProductID, UnitPrice, Quantity,
(UnitPrice * Quantity) AS TotalPrice
FROM OrderDetails;

#14 How many customers?
SELECT COUNT(CustomerID) AS TotalCustomers
FROM Customers;

#15 When was the first order?
SELECT OrderDate AS FirstOrder
FROM Orders
ORDER BY OrderDate ASC
LIMIT 1;

#16 Countries where there are customers
SELECT DISTINCT Country
FROM Customers
ORDER BY Country ASC;

#17 Contact titles for customers
SELECT ContactTitle, 
COUNT(ContactTitle) AS TotalContactTitle
FROM Customers
GROUP BY ContactTitle
ORDER BY TotalContactTitle DESC;

#18 Products with associated supplier names
SELECT Products.ProductID, Products.ProductName, Suppliers.CompanyName
FROM Products
INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID;

#19 Orders and the Shipper that was used
SELECT OrderID, CONVERT(OrderDate, date) AS OrderDate, CompanyName
FROM Orders
INNER JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE OrderID < 10300
ORDER BY OrderID ASC;



