
-- Crear base de datos del DW desde cero
DROP DATABASE IF EXISTS DW_Perfumeria;
CREATE DATABASE DW_Perfumeria;
USE DW_Perfumeria;

-- Desactivar claves foráneas temporalmente
SET FOREIGN_KEY_CHECKS = 0;

-- Crear tablas de dimensiones
CREATE TABLE Dim_Clientes (
    ID_Cliente VARCHAR(20) PRIMARY KEY,
    Nombre_Cliente VARCHAR(100),
    Tipo_Cliente VARCHAR(50),
    Direccion VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Dim_Productos (
    ID_Producto INT PRIMARY KEY,
    Nombre_Producto VARCHAR(100),
    Tipo_Producto VARCHAR(100),
    Descripcion_Producto VARCHAR(255),
    Precio_Unitario FLOAT
);

CREATE TABLE Dim_Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    Nombre_Proveedor VARCHAR(100),
    Direccion_Proveedor VARCHAR(100),
    Telefono_Proveedor VARCHAR(20),
    Email_Proveedor VARCHAR(100)
);

CREATE TABLE Dim_Tiempo (
    Fecha_ID INT PRIMARY KEY,
    Fecha DATE,
    Dia INT,
    Mes INT,
    Año INT,
    Trimestre INT
);

-- Crear tabla de hechos
CREATE TABLE Fact_Ventas (
    ID_Venta INT PRIMARY KEY,
    ID_Producto INT,
    ID_Cliente VARCHAR(20),
    Fecha_ID INT,
    Cantidad_Vendida INT,
    Precio_Unitario FLOAT,
    Descuento FLOAT,
    Total_Venta FLOAT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Producto) REFERENCES Dim_Productos(ID_Producto),
    FOREIGN KEY (ID_Cliente) REFERENCES Dim_Clientes(ID_Cliente),
    FOREIGN KEY (Fecha_ID) REFERENCES Dim_Tiempo(Fecha_ID),
    FOREIGN KEY (ID_Proveedor) REFERENCES Dim_Proveedores(ID_Proveedor)
);

