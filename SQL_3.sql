-- ¿Cuál es el cliente con más compras por país y por mes en el 2023? --
SELECT *  FROM Sales;
SELECT * FROM Customers;
SELECT * FROM Countries;



WITH RankedProducts AS (
    SELECT 
        C.country,
        CR.customer_name,
        MONTH(S.date_sale) AS sale_month,
        SUM(S.quantity) AS total_quantity,
        ROW_NUMBER() OVER (PARTITION BY C.country, MONTH(S.date_sale) ORDER BY SUM(S.quantity) DESC) AS rank
    FROM Countries AS C
    INNER JOIN Customers AS CR ON C.id_country = CR.id_country
    INNER JOIN Sales AS S ON CR.id_customer = S.id_customer
    GROUP BY C.country, MONTH(S.date_sale), CR.customer_name
)
SELECT country, sale_month, customer_name, total_quantity
FROM RankedProducts
WHERE rank = 1;

-- Para ver la lista completa

SELECT CR.country,
C.customer_name, 
MONTH(S.date_sale) AS [Month],
SUM(S.quantity) AS [Quantity]
FROM Countries AS CR
INNER JOIN Customers C ON CR.id_country = C.id_country
INNER JOIN Sales AS S ON C.id_customer = S.id_customer
GROUP BY CR.country, C.customer_name, MONTH(S.date_sale)
ORDER BY CR.country, [Month] DESC, [Quantity] DESC;
