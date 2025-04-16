
//ROLES
CREATE ROLE ADMINISTRADOR;
CREATE ROLE VENDEDOR;
CREATE ROLE CLIENTE;


//aSIGNAR ROLES
GRANT ADMINISTRADOR TO ADMINISTRADOR1;
GRANT VENDEDOR TO VENDEDOR1;
GRANT CLIENTE TO CLIENTE1;

//ADMINISTRADOR
GRANT ALL PRIVILEGES ON CLIENTE TO ADMINISTRADOR;
GRANT ALL PRIVILEGES ON PRODUCTO TO ADMINISTRADOR;
GRANT ALL PRIVILEGES ON CATEGORIA TO ADMINISTRADOR;
GRANT ALL PRIVILEGES ON BOLETA TO ADMINISTRADOR;
GRANT ALL PRIVILEGES ON DETALLE_VENTA TO ADMINISTRADOR;
GRANT ALL PRIVILEGES ON COMUNA TO ADMINISTRADOR;

//Vendedor
GRANT SELECT, INSERT, UPDATE ON PRODUCTO TO VENDEDOR;
GRANT SELECT, INSERT, UPDATE ON BOLETA TO VENDEDOR;
GRANT SELECT ON CLIENTE TO VENDEDOR;
GRANT SELECT ON DETALLE_VENTA TO VENDEDOR;

//Cliente
GRANT SELECT ON PRODUCTO TO CLIENTE;
GRANT SELECT ON BOLETA TO CLIENTE;




//Tabla comuna,solo va el dato de la comuna
CREATE TABLE COMUNA (
    id_comuna INT PRIMARY KEY,
    nombre_comuna VARCHAR(100)
);


CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    rut_cliente NUMBER(10),
    nombre_cliente VARCHAR(100),
    apellido_cliente VARCHAR(100),
    direccion_cliente VARCHAR(100),
    id_comuna INT,
    FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
);



CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(100),
    descripcion_categoria VARCHAR(255)
);
//Tabla producto,solo va el dato del producto(nombre y precio)
CREATE TABLE PRODUCTO (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    descripcion_producto VARCHAR(255),
    precio DECIMAL(10, 2),
    stock INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);






CREATE TABLE DETALLE_VENTA (
    id_detalle_venta INT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),//Crear un id venta especifico o no?
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE BOLETA (
    id_boleta INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    id_detalle_venta INT,
    FOREIGN KEY (id_detalle_venta) REFERENCES detalle_venta(id_detalle_venta),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);