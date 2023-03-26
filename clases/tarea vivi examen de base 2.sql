CREATE DATABASE DHAlmundo;
-- CRETE SCHEMA DHAlmundo;
-- SHOW TABLES FROM DHAlmundo; 

-- CREATE DATABASE preguntados;
-- DROP DATABASE preguntados;

USE DHAlmundo;

/* Crear tabla de clientes */
DROP TABLE clientes;
CREATE TABLE clientes (
	nombre VARCHAR(45),
    apellido VARCHAR(45),
    edad INT,
    sexo VARCHAR(1),
    nombre_hotel VARCHAR(50)
);

/* Meter informacion a la tabla de clientes */
-- INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);
INSERT INTO clientes (nombre, apellido, edad, sexo) VALUES ('Pedro', 'Rodriguez', 30, 'M');
INSERT INTO clientes (nombre, apellido, edad, sexo) VALUES ('Veronica', 'Vila', 25, 'F');

/* listar todos los clientes */
/*Listar nombre , apellidos, */
SELECT nombre, apellido FROM clientes;
SELECT * FROM clientes;
SELECT * FROM clientes WHERE edad > 25;
SELECT * FROM clientes WHERE nombre = 'Pedro';
SELECT * FROM clientes WHERE nombre = 'Juan';

/*Lista*/
DROP TABLE hoteles; 
CREATE TABLE hoteles (
	nombre VARCHAR(50),
    direccion VARCHAR(50),
    cantidadHabitaciones INT
);
SELECT * FROM hoteles;
CREATE TABLE reservas (
	nombre_cliente VARCHAR(50),
    nombre_hotel VARCHAR(50)
);
/* Inserto valores a hoteles y reservas */
INSERT INTO hoteles (nombre, direccion, cantidadHabitaciones) VALUES ('MimiHotel', 'Yapeyu 2345', 73);
SELECT * FROM hoteles;
INSERT INTO reservas (nombre_cliente, nombre_hotel) VALUES ('Pedro', 'MimiHotel');
SELECT * FROM reservas;

SELECT * 
FROM reservas r 
INNER JOIN clientes c
	ON r.nombre_cliente = c.nombre
INNER JOIN hoteles h 
	ON r.nombre_hotel = h.nombre;

select * 
from hoteles 
where cantidadHabitaciones between 30 and 100;

/*Mostrar cuál ha sido el mayor importe facturado y llamarlo “Precio Mayor”,
también mostrar cuál es el total facturado y llamarlo “TOTAL”.
*/

select sum(precioTotal) as "Pecio Mayor" from pagos;

/*Listar las reservas que fueron realizadas el día 16/01/2022 entre las 15hs y las
21hs pertenecientes a la sucursal número 5*/ 

select * from reservas
where fechaRegistro between "2022-01-16 15:00:00" and "2022-01-16 21:00:00";

/*Mostrar el top 3 de reservas con mayor cantidad de vuelos.*/

select idRecerva, count(idVuelo) from vuelosxreserva
group by idRecerva
order by count(idVuelo) desc
limit 3;

/*Listar los 10 pagos de menor precio*/

select precioTotal from pagos
order by precioTotal
limit 10;

/*Listar todos los países ordenados alfabéticamente y con su nombre en
mayúsculas*/

select idpais, upper(nombre) from paises
order by nombre;

/*Mostrar todos las reservas de vuelos que sean de clase turista y el id de vuelo
sea 11 o 13.*/

select * from vuelosxrecerva
where idCategoriasVuelos = 2 and  idVuelos in (11, 13);

/*. Listar los usuarios que hayan realizado 2 reservas*/

select * from recervas
group by idCliente
having count(idreserva) = 2 ;

/*. Mostrar todos los vuelos que tengan como origen Italia o destino Jamaica*/

select * from vuelos
where origen = "italia" or destino = "jamaica";

/*. Mostrar todos los vuelos que tengan como destino Cuba y la cantidad de
pasajeros de primera clase sea menor o igual a 15 personas*/

select * from vuelos
where origen = "cuba" and cantidadPrimeraClase <= 15;

/*. Se desea conocer cuál es la cantidad de vuelos que tienen como origen México.*/

select * from vuelos
where origen = "mexico";

/*Se desea conocer cuál es la cantidad de reservas realizadas en la sucursal de
Mendoza por el cliente cuyo pasaporte es EC158846.*/


select count(idreserva) from recervas
where idSucursal = 1 and cliente = 13;


select * from clientes;

/*. Cual es el promedio de pasajeros de clase turista que tengan como destino
Jamaica*/

select idvuelo from vuelos
where destino = "jamaica";

/*. Cual es el monto total de los pagos realizados en efectivo.(campo:preciototal )*/

select sum(precioTotal) from pagos
where idMetodosPago = 1;

/* Mostrar el tercer importe de pagos realizado con menor valor*/

select * from pagos
order by precioTotal
limit 1
offset 2;

/* Se desea conocer la cantidad de reservas realizadas en Chile más
específicamente en el 'Santiago Hotel'*/

select count(idHotelesxreserva)* from hotelesxreserva
where idHoteles = 15;

/*Agregar al cliente Solari Carlos cuyo pasaporte es AR221422 , domiciliado en
calle Av.Libertad 451 de la ciudad de Córdoba-Argentina, teléfono móvil
+542645667714.*/

insert into (clientes)
values (default, "Carlos", "Solari", "AR221422", "Av.Libertad 451", "Cordoba", "+542645667714", 1);

/*Modificar el tipo de hospedaje de 'Pensión Completa' a 'Pensión Premium'*/

update tipohospedaje
set nombre = "Pencion Premium"
where id = 2;