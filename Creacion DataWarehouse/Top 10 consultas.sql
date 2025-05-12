
-- 1. Top 10 productos más vendidos por cantidad
SELECT 
    dp.Nombre_Producto,
    dp.Tipo_Producto,
    SUM(fv.Cantidad_Vendida) AS Total_Vendido
FROM Fact_Ventas fv
JOIN Dim_Productos dp ON fv.ID_Producto = dp.ID_Producto
GROUP BY dp.Nombre_Producto, dp.Tipo_Producto
ORDER BY Total_Vendido DESC
LIMIT 10;

-- 2. Ventas totales por cliente
SELECT 
    dc.Nombre_Cliente,
    SUM(fv.Total_Venta) AS Total_Gastado
FROM Fact_Ventas fv
JOIN Dim_Clientes dc ON fv.ID_Cliente = dc.ID_Cliente
GROUP BY dc.Nombre_Cliente
ORDER BY Total_Gastado DESC
LIMIT 10;

-- 3. Ventas totales por rubro de producto
SELECT 
    dp.Tipo_Producto,
    SUM(fv.Total_Venta) AS Total_Venta
FROM Fact_Ventas fv
JOIN Dim_Productos dp ON fv.ID_Producto = dp.ID_Producto
GROUP BY dp.Tipo_Producto
ORDER BY Total_Venta DESC;

-- 4. Ventas mensuales
SELECT 
    dt.Año,
    dt.Mes,
    SUM(fv.Total_Venta) AS Total_Mensual
FROM Fact_Ventas fv
JOIN Dim_Tiempo dt ON fv.Fecha_ID = dt.Fecha_ID
GROUP BY dt.Año, dt.Mes
ORDER BY dt.Año, dt.Mes;

-- 5. Promedio de ticket por cliente
SELECT 
    dc.Nombre_Cliente,
    COUNT(*) AS Cantidad_Tickets,
    ROUND(AVG(fv.Total_Venta), 2) AS Promedio_Ticket
FROM Fact_Ventas fv
JOIN Dim_Clientes dc ON fv.ID_Cliente = dc.ID_Cliente
GROUP BY dc.Nombre_Cliente
ORDER BY Promedio_Ticket DESC
LIMIT 10;

-- 6. Top 5 proveedores por volumen de ventas
SELECT 
    dpv.Nombre_Proveedor,
    SUM(fv.Total_Venta) AS Total_Ventas
FROM Fact_Ventas fv
JOIN Dim_Proveedores dpv ON fv.ID_Proveedor = dpv.ID_Proveedor
GROUP BY dpv.Nombre_Proveedor
ORDER BY Total_Ventas DESC
LIMIT 5;

-- 7. Productos con mayor ingreso (total vendido * precio unitario)
SELECT 
    dp.Nombre_Producto,
    SUM(fv.Total_Venta) AS Total_Ingresado
FROM Fact_Ventas fv
JOIN Dim_Productos dp ON fv.ID_Producto = dp.ID_Producto
GROUP BY dp.Nombre_Producto
ORDER BY Total_Ingresado DESC
LIMIT 10;

-- 8. Clientes más frecuentes (por cantidad de compras)
SELECT 
    dc.Nombre_Cliente,
    COUNT(*) AS Cantidad_Compras
FROM Fact_Ventas fv
JOIN Dim_Clientes dc ON fv.ID_Cliente = dc.ID_Cliente
GROUP BY dc.Nombre_Cliente
ORDER BY Cantidad_Compras DESC
LIMIT 10;

-- 9. Productos con mayor descuento aplicado acumulado
SELECT 
    dp.Nombre_Producto,
    SUM(fv.Descuento) AS Descuento_Total
FROM Fact_Ventas fv
JOIN Dim_Productos dp ON fv.ID_Producto = dp.ID_Producto
GROUP BY dp.Nombre_Producto
ORDER BY Descuento_Total DESC
LIMIT 10;

-- 10. Ventas promedio por trimestre
SELECT 
    dt.Año,
    dt.Trimestre,
    ROUND(AVG(fv.Total_Venta), 2) AS Promedio_Venta_Trimestral
FROM Fact_Ventas fv
JOIN Dim_Tiempo dt ON fv.Fecha_ID = dt.Fecha_ID
GROUP BY dt.Año, dt.Trimestre
ORDER BY dt.Año, dt.Trimestre;
