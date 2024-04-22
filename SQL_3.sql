-- ¿Cuál es el cliente con más compras por país y por mes en el 2023? --
SELECT *  FROM Sales;
SELECT * FROM Customers;
SELECT * FROM Countries;

SELECT CR.country,
C.customer_name, 
MONTH(S.date_sale) AS [Month],
SUM(S.quantity) AS [Quantity]
FROM Countries AS CR
INNER JOIN Customers C ON CR.id_country = C.id_country
INNER JOIN Sales AS S ON C.id_customer = S.id_customer
GROUP BY CR.country, C.customer_name, MONTH(S.date_sale)
ORDER BY CR.country, [Month] DESC, [Quantity] DESC;
