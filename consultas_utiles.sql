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