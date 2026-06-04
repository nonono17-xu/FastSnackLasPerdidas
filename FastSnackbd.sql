DROP DATABASE IF EXISTS FastSnackbd;
CREATE DATABASE FastSnackbd;
USE FastSnackbd;

-- TABLA PERSONA
CREATE TABLE Persona (
    id_persona INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    PRIMARY KEY (id_persona)
);

-- TABLA CLIENTE
CREATE TABLE Cliente (
    id_cliente INT,
    direccion VARCHAR(150),
    PRIMARY KEY (id_cliente),
    CONSTRAINT fk_cliente_persona
        FOREIGN KEY (id_cliente)
        REFERENCES Persona(id_persona)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- TABLA PRODUCTO
CREATE TABLE Producto (
    id_producto INT,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    PRIMARY KEY (id_producto)
);

-- TABLA ESTADO PEDIDO
CREATE TABLE EstadoPedido (
    id_estado TINYINT,
    nombre_estado VARCHAR(30),
    PRIMARY KEY (id_estado)
);

-- TABLA PEDIDO
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_estado TINYINT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_pedido),

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_pedido_estado
        FOREIGN KEY (id_estado)
        REFERENCES EstadoPedido(id_estado)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- TABLA DETALLE DEL PEDIDO
CREATE TABLE PedidoProducto (
    id_pedido INT,
    id_producto INT,
    cantidad INT DEFAULT 1,

    PRIMARY KEY (id_pedido, id_producto),

    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES Pedido(id_pedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (id_producto)
        REFERENCES Producto(id_producto)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- ESTADOS DEL PEDIDO
INSERT INTO EstadoPedido VALUES
(1,'Pendiente'),
(2,'Preparando'),
(3,'Enviado'),
(4,'Entregado');

-- PRODUCTOS
INSERT INTO Producto VALUES
(1,'Hamburguesa',5.00),
(2,'Pizza',8.00),
(3,'Hot Dog',4.00),
(4,'Papas Fritas',3.00),
(5,'Gaseosa',2.00),
(6,'Combo',10.00);

-- CONSULTA PARA VER LOS PEDIDOS
SELECT
    pe.id_pedido AS 'ID Pedido',
    per.nombre AS 'Cliente',
    per.telefono AS 'Telefono',
    c.direccion AS 'Direccion',
    prod.nombre AS 'Producto',
    ep.nombre_estado AS 'Estado'
FROM Pedido pe
INNER JOIN Cliente c
    ON pe.id_cliente = c.id_cliente
INNER JOIN Persona per
    ON c.id_cliente = per.id_persona
INNER JOIN PedidoProducto pp
    ON pe.id_pedido = pp.id_pedido
INNER JOIN Producto prod
    ON pp.id_producto = prod.id_producto
INNER JOIN EstadoPedido ep
    ON pe.id_estado = ep.id_estado;
  SELECT * FROM Cliente;
  SELECT * FROM Persona;