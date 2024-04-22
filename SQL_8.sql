-- ¿Existe alguna tendencia de ventas en función del día de la semana?
SELECT 
DATENAME(WEEKDAY,date_sale) AS [Day], 
SUM(quantity) AS Quantity
FROM Sales 
GROUP BY DATENAME(WEEKDAY,date_sale);

-- Los días sábado es donde más cantdidad de producto se compra, mientras que el día en que menos se compra es vierens
