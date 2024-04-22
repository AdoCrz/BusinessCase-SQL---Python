-- ¿Cuál es el cliente con más compras durante el último trimestre del año 2023?
SELECT * FROM Sales;
SELECT * FROM Products;

SELECT TOP 1 C.customer_name,
SUM(S.quantity) AS [Quantity Sold]
FROM Sales AS S
INNER JOIN Customers AS C ON S.id_customer = C.id_customer
GROUP BY  C.customer_name
ORDER BY [Quantity Sold] DESC;
