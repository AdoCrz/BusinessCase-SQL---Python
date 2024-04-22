SELECT * FROM Sales;
SELECT * FROM Customers;
SELECT * FROM Regions;

SELECT 
R.continent,
AVG(S.quantity) AS [Avg quantity_sold]
FROM Regions AS R 
INNER JOIN Customers AS C ON R.id_region = C.id_region
INNER JOIN Sales AS S ON C.id_customer = S.id_customer
GROUP BY R.continent
ORDER BY  [AVG quantity_sold] ASC;

---- En caso de querer ver el promedio de ventas, ejecutar:

SELECT 
R.continent,
AVG(S.quantity*P.unit_price) AS [Avg quantity_sold]
FROM Regions AS R 
INNER JOIN Customers AS C ON R.id_region = C.id_region
INNER JOIN Sales AS S ON C.id_customer = S.id_customer
INNER JOIN Products AS P ON S.id_product = P.id_product
GROUP BY R.continent
ORDER BY  [Avg quantity_sold] ASC;
