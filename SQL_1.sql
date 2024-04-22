-- CREAR NUEVA BASE DE DATOS 

CREATE DATABASE BD_Rappi;
USE BD_Rappi;

-- ¿Cuál es la distribución geográfica de las ventas de productos Nike durante el último trimestre del año 2023? --

SELECT * FROM Products;
SELECT * FROM Sales;
SELECT * FROM Customers;
SELECT * FROM Regions;

SELECT 
R.continent,
SUM(S.quantity) AS [Distribution]
FROM Regions AS R 
INNER JOIN Customers AS C ON R.id_region = C.id_region
INNER JOIN Sales AS S ON C.id_customer = S.id_customer
GROUP BY R.continent
ORDER BY  [Distribution] DESC;

-- La sitribución se encuentra de la siguiente manera:
-- Australia	589
-- Asia	588
-- Africa	491
-- America	435
--Europe	274
