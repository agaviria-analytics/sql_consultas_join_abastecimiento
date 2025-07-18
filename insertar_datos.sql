SELECT * FROM movimientos_stock;
SELECT * FROM productos;
SELECT * FROM stock_inicial

INSERT INTO productos (id_producto, nombre_producto, categoria, precio_unitario) VALUES
(1, 'Arroz Diana 500g', 'Granos', 2500.00),
(2, 'Aceite Premier 1L', 'Aceites', 8500.00),
(3, 'Frijol Rojo 500g', 'Granos', 3200.00),
(4, 'Sal Refina 1kg', 'Condimentos', 1900.00),
(5, 'Azúcar Incauca 1kg', 'Dulces', 4100.00),
(6, 'Atún Van Camp´s', 'Enlatados', 5800.00),
(7, 'Pasta Doria 250g', 'Pastas', 2400.00),
(8, 'Galletas Festival', 'Snacks', 3800.00),
(9, 'Lentejas 500g', 'Granos', 3000.00),
(10, 'Café Águila Roja 250g', 'Bebidas', 9200.00);

INSERT INTO stock_inicial (id_producto, cantidad_inicial) VALUES
(1, 30),
(2, 20),
(3, 25),
(4, 40),
(5, 35),
(6, 15),
(7, 50),
(8, 60),
(9, 20),
(10, 10);

INSERT INTO movimientos_stock (id_movimiento, id_producto, tipo_movimiento, cantidad, fecha_movimiento) VALUES
(1, 1, 'salida', 10, '2025-07-01'),
(2, 2, 'salida', 5, '2025-07-02'),
(3, 3, 'entrada', 10, '2025-07-03'),
(4, 3, 'salida', 5, '2025-07-05'),
(5, 4, 'salida', 10, '2025-07-05'),
(6, 5, 'salida', 30, '2025-07-06'),
(7, 6, 'entrada', 10, '2025-07-07'),
(8, 6, 'salida', 5, '2025-07-08'),
(9, 7, 'salida', 20, '2025-07-08'),
(10, 9, 'salida', 18, '2025-07-09'),
(11, 10, 'entrada', 5, '2025-07-10');