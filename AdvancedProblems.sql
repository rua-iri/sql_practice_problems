#32 High-value customers
SELECT Customers.CustomerID, Customers.CompanyName, Orders.OrderID, Orders.OrderDate,
SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalOrderAmount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
WHERE YEAR(Orders.OrderDate) = 2016
GROUP BY Customers.CustomerID, Customers.CompanyName, Orders.OrderID
HAVING SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) >= 10000
ORDER BY TotalOrderAmount DESC;

#33 High-value customers - total orders
SELECT Customers.CustomerID, Customers.CompanyName, 
SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalOrderAmount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
WHERE YEAR(Orders.OrderDate) = 2016
GROUP BY Customers.CustomerID, Customers.CompanyName
HAVING SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) >= 15000
ORDER BY TotalOrderAmount DESC;


#34 High-value customers - with discount
SELECT Customers.CustomerID, Customers.CompanyName, 
SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalOrderAmount,
SUM((OrderDetails.UnitPrice * OrderDetails.Quantity) * (1 - OrderDetails.Discount)) AS TotalsWithDiscount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
WHERE YEAR(Orders.OrderDate) = 2016
GROUP BY Customers.CustomerID, Customers.CompanyName
HAVING SUM((OrderDetails.UnitPrice * OrderDetails.Quantity) * (1 - OrderDetails.Discount)) >= 10000
ORDER BY TotalsWithDiscount DESC;


















