SELECT * FROM Sales;
SELECT * FROM Products;

SELECT TOP 1 P.product_name,
SUM(S.quantity) AS [Quantity Sold]
FROM Sales AS S
INNER JOIN Products AS P ON S.id_product = P.id_product
GROUP BY  P.product_name
ORDER BY [Quantity Sold] DESC;
