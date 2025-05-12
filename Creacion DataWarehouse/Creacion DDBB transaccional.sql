CREATE DATABASE Perfumeria;
USE Perfumeria;

-- Tabla Proveedores
CREATE TABLE Proveedores (
    Clave_Proveedor INT PRIMARY KEY,
    Nombre_Proveedor VARCHAR(100),
    Direccion_Proveedor VARCHAR(100),
    Telefono_Proveedor VARCHAR(20),
    Email_Proveedor VARCHAR(100)
);

-- Tabla Productos
CREATE TABLE Productos (
    Clave_Producto INT PRIMARY KEY,
    Tipo_Producto VARCHAR (100),
    Nombre_Producto VARCHAR(100),
    Descripcion_Producto VARCHAR(255),
    FechaCad_Producto DATE,
    Precio_Vta_Unitario FLOAT
);

-- Tabla Clientes
CREATE TABLE Clientes (
    Clave_Cliente VARCHAR(20) PRIMARY KEY,
    Nombre_Cliente VARCHAR(100),
    Direccion_Cliente VARCHAR(100),
    Telefono_Cliente VARCHAR(20),
    Email_Cliente VARCHAR(100),
    Tipo_Cliente VARCHAR(50)
);

-- Tabla Compras
CREATE TABLE Compras (
    No_Compra INT PRIMARY KEY,
    Clave_Proveedor INT,
    Fecha_Compra DATE,
    Clave_producto INT,
    Cantidad_Compra INT,
    Precio_Compra FLOAT,
    Descuento_Compra FLOAT,
    Subtotal_Compra FLOAT,
    Cuota_IVA_Compra FLOAT,
    Total_Compra FLOAT,
    FOREIGN KEY (Clave_Proveedor) REFERENCES Proveedores(Clave_Proveedor),
    FOREIGN KEY (Clave_Producto) REFERENCES Productos(Clave_Producto)
);

-- Tabla Almacén
CREATE TABLE Almacen (
    Clave_Producto INT PRIMARY KEY,
    Nombre_Producto VARCHAR(100),
    Existencia_Almacen INT,
    FechaCad_producto DATE,
    No_Compra INT,
    Clave_Proveedor INT,
    FOREIGN KEY (Clave_Producto) REFERENCES Productos(Clave_Producto),
    FOREIGN KEY (No_Compra) REFERENCES Compras(No_Compra),
    FOREIGN KEY (Clave_Proveedor) REFERENCES Proveedores(Clave_Proveedor)
);

-- Tabla Ticket
CREATE TABLE Ticket (
    No_Ticket INT PRIMARY KEY,
    Fecha_Venta DATE,
    Nombre_Producto VARCHAR(100),
    Cantidad_Venta INT,
    Precio_Vta_Unit FLOAT,
    Descuento_Venta FLOAT,
    Subtotal_Venta FLOAT,
    Cuota_IVA_Venta FLOAT,
    Total_Venta FLOAT
);

-- Tabla Ventas
CREATE TABLE Ventas (
    No_Venta INT PRIMARY KEY,
    Fecha_Venta DATE,
    Clave_Producto INT,
    Cantidad_Venta INT,
    Precio_Vta_Unit FLOAT,
    Descuento_Venta FLOAT,
    Subtotal_Venta FLOAT,
    Cuota_IVA_Venta FLOAT,
    Total_Venta FLOAT,
    FOREIGN KEY (Clave_Producto) REFERENCES Productos(Clave_Producto)
);

-- Tabla Factura
CREATE TABLE Factura (
    No_Factura INT PRIMARY KEY,
    No_Ticket INT,
    Fecha_Factura DATE,
    Clave_Cliente VARCHAR(20),
    Clave_Producto INT,
    Cantidad_Venta INT,
    Precio_Vta_Unit FLOAT,
    Descuento FLOAT,
    Subtotal_Venta FLOAT,
    Cuota_IVA FLOAT,
    Total_Venta FLOAT,
    Clave_Proveedor INT,
    FOREIGN KEY (No_Ticket) REFERENCES Ticket(No_Ticket),
    FOREIGN KEY (Clave_Cliente) REFERENCES Clientes(Clave_Cliente),
    FOREIGN KEY (Clave_Producto) REFERENCES Productos(Clave_Producto),
    FOREIGN KEY (Clave_Proveedor) REFERENCES Proveedores(Clave_Proveedor)
);