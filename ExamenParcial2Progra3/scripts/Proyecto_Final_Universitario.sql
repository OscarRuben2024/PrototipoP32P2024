DROP DATABASE MibaseDeDatos;
CREATE DATABASE IF NOT EXISTS MiBaseDeDatos;
USE MiBaseDeDatos;

-- Tabla para almacenar información de clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para almacenar información de usuarios
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    nombre_completo VARCHAR(100),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(username)
);

-- Tabla para catálogo de productos
CREATE TABLE IF NOT EXISTS Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock INT,
    fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para catálogo de categorías
CREATE TABLE IF NOT EXISTS Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla para catálogo de proveedores
CREATE TABLE IF NOT EXISTS Proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla para almacenar registros de movimientos
CREATE TABLE IF NOT EXISTS Movimientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_movimiento ENUM('alta', 'baja', 'modificacion', 'consulta', 'eliminacion'),
    tabla_afectada VARCHAR(100),
    id_registro_afectado INT,
    fecha_movimiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);