-- ¿Existe alguna tendencia de ventas en función del día de la semana?
SELECT 
DATENAME(WEEKDAY,date_sale) AS [Day], 
SUM(quantity) AS Quantity
FROM Sales 
GROUP BY DATENAME(WEEKDAY,date_sale);
