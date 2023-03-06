CREATE DATABASE universo_lector;
USE universo_lector;

CREATE TABLE autor(
id INT NOT NULL auto_increment,
nombre VARCHAR(50),
apellido VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE socio(
id INT NOT NULL auto_increment,
dni CHAR(8),
nombre VARCHAR(50),
apellido VARCHAR(50),
direccion VARCHAR(100),
localidad VARCHAR(50),
PRIMARY KEY(id)
);

CREATE TABLE editorial(
id INT NOT NULL auto_increment,
razon_social VARCHAR(100),
telefono VARCHAR(100),
PRIMARY KEY(id)
);

CREATE TABLE libro(
id INT NOT NULL auto_increment,
ISBN VARCHAR(13),
titulo VARCHAR(200),
anio_escritura DATE,
anio_edicion DATE,
id_autor INT NOT NULL,
id_editorial INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_autor) REFERENCES autor(id),
FOREIGN KEY (id_editorial) REFERENCES editorial(id)
);

CREATE TABLE telefono_socio(
id INT NOT NULL auto_increment,
nro_telefono CHAR(10),
id_socio INT,
PRIMARY KEY (id),
FOREIGN KEY (id_socio) REFERENCES socio(id)
);

CREATE TABLE prestamo(
id INT NOT NULL auto_increment,
fecha_prestamo DATE,
fecha_tope DATE,
fecha_devolucion DATE,
id_socio INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_socio) REFERENCES socio(id)
);

CREATE TABLE copia(
id INT NOT NULL auto_increment,
deteriorado TINYINT,
id_libro INT NOT NULL, 
PRIMARY KEY(id),
FOREIGN KEY (id_libro) REFERENCES libro(id)
);

CREATE TABLE prestamo_copia(
id INT NOT NULL auto_increment,
id_prestamo INT NOT NULL,
id_copia INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_prestamo) REFERENCES prestamo(id),
FOREIGN KEY (id_copia) REFERENCES copia(id)
);

SELECT * FROM socio;

INSERT INTO socio
VALUES(0,"30000000","PATRICIA","JOHNSON", "28 MySQL Boulevard", "QLD"),
(default,"29888004","LINDA","WILLIAMS", "23 Workhaven Lane", "Alberta"),
(default,"25000004","BARBARA","JONES", "1411 Lillydale Drive", "QLD"),
(default,"23139094","ROBIN","HAYES", "262 A Corua (La Corua) Parkway", "Dhaka");

SELECT * FROM telefono_socio;

ALTER TABLE telefono_socio
MODIFY nro_telefono VARCHAR(50);

INSERT INTO telefono_socio
VALUES(default,"54911-45636453", 1);

SELECT * FROM socio;

INSERT INTO telefono_socio
VALUES(default,"54-11-47867654", 2),
(default,"11498-2173", 3),
(default,"2645887755", 4);

INSERT INTO autor
VALUES(default, "J. K.", "Rowling");

INSERT INTO editorial
VALUES (default, "Bloomsbury Publishing", "54911564874"),
(default, "Scholastic", "223483646"),
(default, "Pottermore Limited", "5694839582"),
(default, "Editorial Salamandra ", "011-239-2343");

INSERT INTO libro
VALUES (DEFAULT, "9781907545009", "Harry Potter y la piedra filosofal", "1997/01/01", "1997/01/01", 1, 4),
(DEFAULT, "9789878000114", "Harry Potter Y La Camara Secreta ", "2020/01,01", "2020/01/01", 1, 4);

select * FROM LIBRO;

INSERT INTO copia
VALUES(DEFAULT, 0, 1),
(DEFAULT, 0, 1),
(DEFAULT, 0, 2);

INSERT INTO prestamo
VALUES(default, "2020/01/01", "2020/01/07", "2020/01/07", 1),
(default, "2020/01/07", "2020/01/15", "2020/01/14", 1),
(default, "2020/03/04", "2020/03/08", "2020/03/11", 2);

select * FROM prestamo;

INSERT INTO prestamo_copia
VALUES(DEFAULT, 1, 1),
(DEFAULT, 2, 2),
(DEFAULT, 3, 1),
(DEFAULT, 3, 3);

DELETE FROM socio
WHERE id=4;

select * FROM socio;

UPDATE socio
set nombre="Camila",
apellido="Patiño"
WHERE id=3;











