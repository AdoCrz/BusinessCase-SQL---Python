-- ¿Cuál es el promedio de cantidad de productos comprados por cliente?
SELECT * FROM Sales;
SELECT * FROM Customers;

SELECT C.customer_name,
AVG(S.quantity) AS [Average purchase]
FROM Sales AS S
INNER JOIN Customers AS C ON S.id_customer = C.id_customer
GROUP BY  C.customer_name
ORDER BY [Average purchase] DESC;
