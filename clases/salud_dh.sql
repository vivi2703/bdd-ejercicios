SHOW DATABASES;

CREATE DATABASE salud_dh;
USE salud_dh;

CREATE TABLE paciente (
id INT NOT NULL auto_increment,
nombre varchar(45),
apellido varchar(45),
id_salud INT,
PRIMARY KEY(id)
);
SELECT * FROM paciente;

CREATE TABLE especialidad(
id_especialidad INT NOT NULL auto_increment,
nombre VARCHAR(100),
PRIMARY KEY (id_especialidad)
);
SELECT * FROM paciente;

CREATE TABLE medico(
id INT NOT NULL auto_increment,
nutricula INT NOT NULL UNIQUE,
nombre VARCHAR(45),
apellido VARCHAR(45)
);

CREATE TABLE medico(
id INT NOT NULL auto_increment,
dia_turno DATETIME,
id_medico INT

);