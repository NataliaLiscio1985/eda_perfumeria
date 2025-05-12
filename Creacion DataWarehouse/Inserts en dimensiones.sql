-- Insertar datos desde la base transaccional
INSERT INTO Dim_Clientes
SELECT DISTINCT
    Clave_Cliente,
    Nombre_Cliente,
    Tipo_Cliente,
    Direccion_Cliente,
    Telefono_Cliente,
    Email_Cliente
FROM perfumeria.Clientes;

INSERT INTO Dim_Productos
SELECT DISTINCT
    Clave_Producto,
    Nombre_Producto,
    Tipo_Producto,
    Descripcion_Producto,
    Precio_Vta_Unitario
FROM perfumeria.Productos;

INSERT INTO Dim_Proveedores
SELECT DISTINCT
    Clave_Proveedor,
    Nombre_Proveedor,
    Direccion_Proveedor,
    Telefono_Proveedor,
    Email_Proveedor
FROM perfumeria.Proveedores;

INSERT INTO Dim_Tiempo
SELECT DISTINCT
    YEAR(Fecha_Factura)*10000 + MONTH(Fecha_Factura)*100 + DAY(Fecha_Factura) AS Fecha_ID,
    Fecha_Factura,
    DAY(Fecha_Factura),
    MONTH(Fecha_Factura),
    YEAR(Fecha_Factura),
    QUARTER(Fecha_Factura)
FROM perfumeria.Factura;

INSERT INTO Fact_Ventas (
    ID_Venta, ID_Producto, ID_Cliente, Fecha_ID,
    Cantidad_Vendida, Precio_Unitario, Descuento, Total_Venta, ID_Proveedor
)
SELECT
    No_Factura,
    Clave_Producto,
    Clave_Cliente,
    YEAR(Fecha_Factura)*10000 + MONTH(Fecha_Factura)*100 + DAY(Fecha_Factura),
    Cantidad_Venta,
    Precio_Vta_Unit,
    Descuento,
    Total_Venta,
    Clave_Proveedor
FROM perfumeria.Factura;


