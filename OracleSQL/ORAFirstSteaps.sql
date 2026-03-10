/*
Estructura de la base de datos para una agencia de viajes:

tienda(idTie, nombre, cp)
cliente(idCli, nombreCli, direccionCli, cp, tlfCli, tipo)
hotel(idHot, nombreHot, estrellas)
aeropuerto(idAer, ciudad, pais)vuelo(idVue, idAerOri, idAerDes, fecha, hora)
codigoPostal(cp, poblacion, provinciareservaHotel(idCli, idHot, idTie, fechaIni, fechaFin, habitacion, precio)
reservaVuelo(idCli, idVue, idTie, fecha, hora, precio, idAsiento)
*/


CREATE TABLE codigoPostal (
    cp VARCHAR(10) PRIMARY KEY,
    poblacion VARCHAR(20) not null,
    provincia VARCHAR(20) not null
);

CREATE TABLE tienda (
    idTie INT PRIMARY KEY,
    nombre VARCHAR(20) not null,
    cp VARCHAR(10) not null
);

CREATE TABLE cliente (
    idCli INT PRIMARY KEY,
    nombreCli VARCHAR(20) not null ,
    direccionCli VARCHAR(20) not null,
    cp VARCHAR(10) not null,
    tlfCli VARCHAR(20) not null,
    tipo VARCHAR(20) not null,
    constraint cp_cliente_fk foreign key (cp) references codigoPostal(cp),
    CONSTRAINT tipo_cliente_check CHECK (tipo IN ('NML', 'VIP')) /*garantiza que el tipo solo pueda ser 'NML' o 'VIP' */
);

CREATE TABLE hotel (
    idHot INT PRIMARY KEY,
    nombreHot VARCHAR(20) not null,
    estrellas INT
);

CREATE TABLE aeropuerto (
    idAer INT PRIMARY KEY,
    ciudad VARCHAR(20) not null,
    pais VARCHAR(20) not null
);

CREATE TABLE vuelo (
    idVue INT PRIMARY KEY,
    idAerOri INT,
    idAerDes INT,
    fecha DATE,
    FOREIGN KEY (idAerOri) REFERENCES aeropuerto(idAer),
    FOREIGN KEY (idAerDes) REFERENCES aeropuerto(idAer)
);

CREATE TABLE reservaHotel (
    idCli INT,
    idHot INT,
    idTie INT,
    fechaIni DATE,
    fechaFin DATE,
    habitacion VARCHAR(20) not null,
    precio DECIMAL(10, 2),
    PRIMARY KEY (idCli, idHot, idTie, fechaIni),
    FOREIGN KEY (idCli) REFERENCES cliente(idCli),
    FOREIGN KEY (idHot) REFERENCES hotel(idHot),
    FOREIGN KEY (idTie) REFERENCES tienda(idTie),
    constraint precio_reservaHotel_check CHECK (precio >= 0) /*garantiza que el precio no sea negativo */
);

CREATE TABLE reservaVuelo (
    idCli INT,
    idVue INT,
    idTie INT,
    fecha DATE,
    precio DECIMAL(10, 2),
    idAsiento VARCHAR(20) not null,
    PRIMARY KEY (idCli, idVue, idTie, fecha),
    FOREIGN KEY (idCli) REFERENCES cliente(idCli),
    FOREIGN KEY (idVue) REFERENCES vuelo(idVue),
    FOREIGN KEY (idTie) REFERENCES tienda(idTie),
    constraint precio_reservaVuelo_check CHECK (precio >= 0) /*garantiza que el precio no sea negativo */
);

INSERT INTO codigoPostal (cp, poblacion, provincia) VALUES('28001', 'Madrid', 'Madrid');
INSERT INTO codigoPostal (cp, poblacion, provincia) VALUES('08001', 'Barcelona', 'Barcelona');
INSERT INTO codigoPostal (cp, poblacion, provincia) VALUES('41001', 'Sevilla', 'Sevilla');

INSERT INTO tienda (idTie, nombre, cp) VALUES (1, 'Tienda A', '28001');
INSERT INTO tienda (idTie, nombre, cp) VALUES (2, 'Tienda B', '08001');
INSERT INTO tienda (idTie, nombre, cp) VALUES (3, 'Tienda C', '41001');

INSERT INTO cliente (idCli, nombreCli, direccionCli, cp, tlfCli, tipo) VALUES (1, 'Juan Pérez', 'Calle Mayor 1', '28001', '600123456', 'NML');
INSERT INTO cliente (idCli, nombreCli, direccionCli, cp, tlfCli, tipo) VALUES (2, 'María García', 'Avenida Central 5', '08001', '600654321', 'VIP');
INSERT INTO cliente (idCli, nombreCli, direccionCli, cp, tlfCli, tipo) VALUES (3, 'Carlos López', 'Plaza del Sol 3', '41001', '600987654', 'NML');

INSERT INTO hotel (idHot, nombreHot, estrellas) VALUES (1, 'Hotel Sol', 4);
INSERT INTO hotel (idHot, nombreHot, estrellas) VALUES (2, 'Hotel Luna', 5);
INSERT INTO hotel (idHot, nombreHot, estrellas) VALUES (3, 'Hotel Estrella', 3);

INSERT INTO aeropuerto (idAer, ciudad, pais) VALUES (1, 'Madrid', 'España');
INSERT INTO aeropuerto (idAer, ciudad, pais) VALUES (2, 'Barcelona', 'España');
INSERT INTO aeropuerto (idAer, ciudad, pais) VALUES (3, 'Sevilla', 'España');

INSERT INTO vuelo (idVue, idAerOri, idAerDes, fecha) VALUES (1, 1, 2, TO_DATE('2024-07-01', 'YYYY-MM-DD'));
INSERT INTO vuelo (idVue, idAerOri, idAerDes, fecha) VALUES (2, 2, 3, TO_DATE('2024-07-02', 'YYYY-MM-DD'));
INSERT INTO vuelo (idVue, idAerOri, idAerDes, fecha) VALUES (3, 3, 1, TO_DATE('2024-07-03', 'YYYY-MM-DD'));

INSERT INTO reservaHotel (idCli, idHot, idTie, fechaIni, fechaFin, habitacion, precio) VALUES (1, 1, 1, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Doble', 200.00);
INSERT INTO reservaHotel (idCli, idHot, idTie, fechaIni, fechaFin, habitacion, precio) VALUES (2, 2, 2, TO_DATE('2024-07-10', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Suite', 500.00);
INSERT INTO reservaHotel (idCli, idHot, idTie, fechaIni, fechaFin, habitacion, precio) VALUES (3, 3, 3, TO_DATE('2024-07-20', 'YYYY-MM-DD'), TO_DATE('2024-07-25', 'YYYY-MM-DD'), 'Individual', 100.00);

INSERT INTO reservaVuelo (idCli, idVue, idTie, fecha, precio, idAsiento) VALUES (1, 1, 1, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 150.00, '12A');
INSERT INTO reservaVuelo (idCli, idVue, idTie, fecha, precio, idAsiento) VALUES (2, 2, 2, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 200.00, '14B');
INSERT INTO reservaVuelo (idCli, idVue, idTie, fecha, precio, idAsiento) VALUES (3, 3, 3, TO_DATE('2024-07-03', 'YYYY-MM-DD'), 180.00, '16C');
INSERT INTO reservaVuelo (idCli, idVue, idTie, fecha, precio, idAsiento) VALUES (1, 2, 1, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 220.00, '18D');
INSERT INTO reservaVuelo (idCli, idVue, idTie, fecha, precio, idAsiento) VALUES (2, 3, 2, TO_DATE('2024-07-20', 'YYYY-MM-DD'), 250.00, '20E');

/*Sentencias de consulta para mostrar el contenido de cada una de las tablas después de la inserción de datos*/
SELECT idAer, ciudad, pais FROM aeropuerto;
SELECT idCli, nombreCli, direccionCli, cp, tlfCli, tipo FROM cliente;
SELECT poblacion, provincia FROM codigoPostal;
SELECT idHot, nombreHot, estrellas FROM hotel;
SELECT idCli, idHot, idTie, fechaIni, fechaFin, precio, habitacion FROM reservaHotel;
SELECT idCli, idVue, idTie, fecha, precio, idAsiento FROM reservaVuelo;

/*Sentencia de datos en la que se inserta una tupla que requiere valores anteiores en otras tablas, pero no existen*/
INSERT INTO reservaHotel (idCli, idHot, idTie, fechaIni, fechaFin, habitacion, precio) VALUES (4, 1, 1, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'Doble', 200.00); /*idCli 4 no existe*/

/*Sentencia de inserción de datos en la que se viole una restricción de tipo de cliente*/
INSERT INTO cliente (idCli, nombreCli, direccionCli, cp, tlfCli, tipo) VALUES (4, 'Ana Martínez', 'Calle Falsa 123', '28001', '600111222', 'PREMIUM'); /*tipo no permitido*/

/*Sentencia de inserción de datos en la que se viole una restricción de valor nulo*/
INSERT INTO hotel (idHot, nombreHot, estrellas) VALUES (4, NULL, 4); /*nombreHot no puede ser nulo*/

/*Sentencia de inserción de datos en la que se viole una restricción de precio no negativo*/
INSERT INTO reservaVuelo (idCli, idVue, idTie, fecha, precio, idAsiento) VALUES (4, 1, 1, TO_DATE('2024-08-01', 'YYYY-MM-DD'), -50.00, '22F'); /*precio no puede ser negativo*/

/*Sentencia en la que se crea un duplicado de tabla tienda con nombre tienda_copia*/
CREATE TABLE tienda_copia AS SELECT * FROM tienda;

/*sentencia para eliminar la tabla duplicada tienda_copia*/
DROP TABLE tienda_copia;

/*Sentencia para eliminar el contenido de cada una de las tablas sin eliminar la estructura de las mismas*/
DELETE FROM reservaVuelo;
DELETE FROM reservaHotel;
DELETE FROM vuelo;
DELETE FROM aeropuerto;
DELETE FROM hotel;
DELETE FROM cliente;
DELETE FROM tienda;
DELETE FROM codigoPostal;

/*Sentencia para eliminar cada una de las tablas de la base de datos*/
DROP TABLE reservaVuelo;
DROP TABLE reservaHotel;
DROP TABLE vuelo;
DROP TABLE aeropuerto;
DROP TABLE hotel;
DROP TABLE cliente;
DROP TABLE tienda;
DROP TABLE codigoPostal;
