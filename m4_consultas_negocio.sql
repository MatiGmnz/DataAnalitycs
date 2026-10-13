USE ventas_tech_db;

-- Consulta 1 

SELECT MONTH(fecha_venta) AS mes_venta,
	SUM(cantidad * precio_unitario) AS total_facturado,
	COUNT(cantidad) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas GROUP BY MONTH(fecha_venta);

-- Consulta 2 

SELECT TOP 5 id_producto AS producto,
	SUM(cantidad) AS unidades_vendidas,
	SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas GROUP BY id_producto ORDER BY total_facturado DESC;

-- Consulta 3

SELECT id_cliente,
	COUNT(id_cliente) AS cantidad_pedidos,
	SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas GROUP BY id_cliente HAVING COUNT(id_cliente) > 1;

-- Consulta 4

SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) >= (
            SELECT AVG(total_mensual)
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS total_mensual
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS sub
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparativa_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- Hallazgos:

/*
1: El producto que generó mayor ingreso fue Laptop Pro 15 (id_producto = 1), 
que con 3 unidades vendidas se facturó $3600. 
A su vez, el producto más vendido fue el mouse inalámbrico (id_producto = 2) con 13 unidades vendidas.

2: Los clientes con mayor concentraciónd de facturación son el 1 (María López) que realizó 2 pedidos por un monto de $2640 
y el 5 (Laura Torres) 2 pedidos por un monto $2100.

3: En el mes de Marzo tuvo una facturación total de $6400 con 10 pedidos realizados.
*/
