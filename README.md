# 🧾 Proyecto SQL – Control de Abastecimiento

Este proyecto simula un sistema básico de abastecimiento para una bodega, usando **SQL Server**.

Permite calcular el **stock actual** de productos a partir del inventario inicial y los movimientos registrados (entradas y salidas). También identifica productos con **bajo stock** mediante alertas SQL, lo cual resulta útil para la toma de decisiones en entornos de logística o inventario.

---

## 📁 Estructura del proyecto

- `estructura_tablas.sql`: Define las 3 tablas principales (productos, stock inicial, movimientos).
- `insertar_datos.sql`: Inserta productos, cantidades iniciales y movimientos simulados.
- `consultas.sql`: Realiza consultas SQL para calcular stock actual y detectar alertas.

---

## 🧠 Conceptos aplicados

- Claves primarias y foráneas (`PRIMARY KEY`, `FOREIGN KEY`)
- `JOIN` y `LEFT JOIN` para unir tablas relacionadas
- Agrupaciones con `GROUP BY`
- Condicionales con `CASE WHEN` dentro de funciones agregadas
- Filtros con `WHERE` y subconsultas para generar alertas

---

## 🧪 Consultas destacadas

### 📊 1. Stock actual por producto

Calcula el stock real considerando movimientos históricos:

```sql
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
GROUP BY p.id_producto, p.nombre_producto, s.cantidad_inicial;

```
# 🧩Conceptos aplicados: JOIN, LEFT JOIN, GROUP BY, CASE WHEN, SUM

### 🚨2.Alerta de productos con bajo stock (menor a 10 unidades)

```sql
SELECT *
FROM (
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
) AS inventario
WHERE stock_actual < 10;

```
### 📌Muestra únicamente los productos con menos de 10 unidades disponibles en stock.