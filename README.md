# 🧾 Proyecto SQL – Control de Abastecimiento

Este proyecto simula un sistema básico de abastecimiento para una bodega, usando **SQL Server**.

Permite calcular el **stock actual** de productos a partir del inventario inicial y los movimientos registrados (entradas y salidas). También identifica productos con **bajo stock** mediante alertas SQL, lo cual resulta útil para la toma de decisiones en entornos de logística o inventario.

---

## 📁 Estructura del proyecto

- `estructura_tablas.sql`: Define las 3 tablas principales (`productos`, `stock_inicial`, `movimientos_stock`).
- `insertar_datos.sql`: Inserta productos, cantidades iniciales y movimientos simulados.
- `consultas.sql`: Realiza consultas SQL para calcular stock actual y detectar alertas.
- `consultas_sql_varias.sql`: Contiene otras consultas complementarias para practicar.

---

## 🧠 Conceptos aplicados

- Claves primarias y foráneas (`PRIMARY KEY`, `FOREIGN KEY`)
- `JOIN` y `LEFT JOIN` para unir tablas relacionadas
- Agrupaciones con `GROUP BY`
- Condicionales con `CASE WHEN` dentro de funciones agregadas
- Filtros con `WHERE` y subconsultas para generar alertas
- Organización y exportación de resultados

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
### 🚨 2. Alerta de productos con bajo stock (menor a 10 unidades)
```
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
### 🧩 Consultas complementarias

Estas consultas se encuentran en el archivo consultas_sql_varias.sql y permiten explorar otras operaciones básicas y útiles en SQL Server:

### 🔍 Filtrar productos por categoría
SELECT * 
FROM productos 
WHERE categoria = 'Granos';

### 🔍 Ordenar productos por nombre
SELECT * 
FROM productos 
ORDER BY nombre_producto;

### 🔍 Mostrar solo nombre y categoría
SELECT nombre_producto, categoria 
FROM productos;

### 🔍 Consultar movimientos de tipo 'salida'
SELECT * 
FROM movimientos_stock 
WHERE tipo_movimiento = 'salida';

### 🔍 Detectar productos sin movimientos (LEFT JOIN)
SELECT p.nombre_producto, m.id_movimiento
FROM productos p
LEFT JOIN movimientos_stock m ON p.id_producto = m.id_producto;

📌 Resultado esperado

Con estas consultas se puede monitorear el estado del inventario, identificar necesidades de reposición y practicar conceptos clave de SQL para aplicaciones reales en logística, inventario o abastecimiento.

💡 Autor

Héctor Alejandro – Analista de Datos en formación
Este proyecto hace parte de mi portafolio profesional. Puedes ver más en:
🔗 agaviria-analytics.github.io

