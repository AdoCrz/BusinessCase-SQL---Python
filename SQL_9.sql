-- ¿Qué porcentaje de las ventas se ve afectado por aquellas órdenes devueltas y canceladas?

SELECT * FROM Sales; 
SELECT * FROM [Order Status]; 


SELECT 
    id_status, 
    cantidad_vendida, 
    ROUND((cantidad_vendida / CAST(total_cantidad_vendida AS decimal)) * 100, 2) AS porcentaje
FROM (
    SELECT 
        id_status, 
        SUM(quantity) AS cantidad_vendida, 
        (SELECT SUM(quantity) FROM Sales) AS total_cantidad_vendida
    FROM 
        Sales
    GROUP BY 
        id_status
) AS subquery;

