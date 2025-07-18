
--Consulta con JOIN + cálculo de stock actual
SELECT 
	p.id_producto,
	p.nombre_producto,
	s.cantidad_inicial,
	SUM(CASE WHEN m.tipo_movimiento ='entrada' THEN m.cantidad ELSE 0 END)AS total_entradas,
	SUM(CASE WHEN m.tipo_movimiento ='salida' THEN m.cantidad ELSE 0 END)AS total_salidas,
	(s.cantidad_inicial +
	SUM(CASE WHEN m.tipo_movimiento ='entrada' THEN m.cantidad ELSE 0 END)-
	SUM(CASE WHEN m.tipo_movimiento ='salida' THEN m.cantidad ELSE 0 END)) AS stock_actual
FROM productos p
JOIN stock_inicial s ON p.id_producto = s.id_producto
LEFT JOIN movimientos_stock m ON p.id_producto = m.id_producto
GROUP BY p.id_producto,p.nombre_producto,s.cantidad_inicial;

--Consulta de alerta por bajo stock
SELECT * 
FROM (
	--Consulta anterior anidada
	  SELECT 
        p.id_producto,
        p.nombre_producto,
        s.cantidad_inicial,
        SUM(CASE WHEN m.tipo_movimiento = 'entrada' THEN m.cantidad ELSE 0 END) AS total_entradas,
        SUM(CASE WHEN m.tipo_movimiento = 'salida' THEN m.cantidad ELSE 0 END) AS total_salidas,
        (s.cantidad_inicial + 
         SUM(CASE WHEN m.tipo_movimiento = 'entrada' THEN m.cantidad ELSE 0 END) - 
         SUM(CASE WHEN m.tipo_movimiento = 'salida' THEN m.cantidad ELSE 0 END)) AS stock_actual
    FROM productos p
    JOIN stock_inicial s ON p.id_producto = s.id_producto
    LEFT JOIN movimientos_stock m ON p.id_producto = m.id_producto
    GROUP BY p.id_producto, p.nombre_producto, s.cantidad_inicial
)AS inventario
WHERE stock_actual <10;