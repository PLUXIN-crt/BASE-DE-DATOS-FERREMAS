CREATE TABLE comuna (
    id_comuna INT PRIMARY KEY,
    nombre_comuna VARCHAR(100)
);

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    id_comuna INT,
    FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
);

