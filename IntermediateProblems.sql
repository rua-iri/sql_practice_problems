#20 Categories, and the total products in each category
SELECT CategoryName, COUNT(ProductID) AS TotalProducts
FROM Categories
JOIN Products
ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
ORDER BY TotalProducts DESC;

#21 Total customers per country/city




