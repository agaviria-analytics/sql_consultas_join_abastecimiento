SELECT * FROM movimientos_stock;
SELECT * FROM productos;
SELECT * FROM stock_inicial

--Ver solo columnas especificas
SELECT nombre_producto,categoria FROM productos;

--Filtrar por categoria 'Granos'
SELECT * FROM productos
WHERE categoria = 'Granos';

--Ordenar resultados por 'nombre_producto'
SELECT * FROM productos
ORDER BY nombre_producto;

--Contar cuantos registros hay
SELECT COUNT(*) FROM productos;

-- Filtrar productos con más de 20 unidades en stock inicial
SELECT *
FROM stock_inicial
WHERE cantidad_inicial >= 20;

-- Ver solo productos que tienen movimientos registrados
SELECT DISTINCT p.nombre_producto
FROM productos p
INNER JOIN movimientos_stock m ON p.id_producto = m.id_producto;

-- Consultar movimientos tipo 'salida' con cantidad mayor a 5
SELECT *
FROM movimientos_stock
WHERE tipo_movimiento = 'salida' AND cantidad > 5;

--Consultar movimientos de tipo 'salida'
SELECT * 
FROM movimientos_stock 
WHERE tipo_movimiento = 'salida';

-- Detectar productos sin movimientos (LEFT JOIN)
SELECT p.nombre_producto, m.id_movimiento
FROM productos p
LEFT JOIN movimientos_stock m ON p.id_producto = m.id_producto;
