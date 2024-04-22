-- ¿Cuál es el producto más vendido por país y por mes en el 2023? --

SELECT *  FROM Sales;
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Countries;

SELECT CR.country,
P.product_name, 
MONTH(S.date_sale) AS [Month],
SUM(S.quantity) AS [Quantity]
FROM Countries AS CR
INNER JOIN Customers C ON CR.id_country = C.id_country
INNER JOIN Sales AS S ON C.id_customer = S.id_customer
INNER JOIN Products AS P ON S.id_product = P.id_product
GROUP BY CR.country, P.product_name, MONTH(S.date_sale)
ORDER BY CR.country, [Month] DESC, [Quantity] DESC;
