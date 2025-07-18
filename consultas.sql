CREATE DATABASE abastecimiento_db;
GO

USE abastecimiento_db;
GO

CREATE TABLE productos(
	id_producto INT PRIMARY KEY,
	nombre_producto NVARCHAR(100),
	categoria NVARCHAR(50)
);

CREATE TABLE stock_inicial(
	id_producto INT,
	cantidad_inicial INT,
	FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE movimientos_stock(
	id_movimiento INT PRIMARY KEY,
	id_producto INT,
	tipo_movimiento NVARCHAR(10), --'Entrada' o 'salida'
	cantidad INT,
	fecha_movimiento DATE,
	FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);

ALTER TABLE productos
ADD precio_unitario DECIMAL(10,2);