-- ========================
-- VISTAS CON JOINs ÚTILES
-- ========================

-- Vista ventas con clientes
CREATE OR REPLACE VIEW vw_ventas_con_clientes AS
SELECT f.*, c.Nombre_Cliente, c.Tipo_Cliente
FROM perfumeria.Factura f
JOIN perfumeria.Clientes c ON f.Clave_Cliente = c.Clave_Cliente;

-- Vista ventas con productos
CREATE OR REPLACE VIEW vw_ventas_con_productos AS
SELECT f.*, p.Nombre_Producto, p.Tipo_Producto
FROM perfumeria.Factura f
JOIN perfumeria.Productos p ON f.Clave_Producto = p.Clave_Producto;

-- Vista ventas con proveedores
CREATE OR REPLACE VIEW vw_ventas_con_proveedores AS
SELECT f.*, pr.Nombre_Proveedor
FROM perfumeria.Factura f
JOIN perfumeria.Proveedores pr ON f.Clave_Proveedor = pr.Clave_Proveedor;

-- Vista completa: cliente + producto + proveedor
CREATE OR REPLACE VIEW vw_ventas_completa AS
SELECT 
    f.*,
    c.Nombre_Cliente,
    c.Tipo_Cliente,
    p.Nombre_Producto,
    p.Tipo_Producto,
    pr.Nombre_Proveedor
FROM perfumeria.Factura f
JOIN perfumeria.Clientes c ON f.Clave_Cliente = c.Clave_Cliente
JOIN perfumeria.Productos p ON f.Clave_Producto = p.Clave_Producto
JOIN perfumeria.Proveedores pr ON f.Clave_Proveedor = pr.Clave_Proveedor;