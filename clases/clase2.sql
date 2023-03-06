--Crear una tabla
use esquema1;
create table tipo_cliente(
id_tipo_cliente int(6) primary key not null,
titulo varchar(20) not null
)
INSERT INTO tipo_cliente (id_tipo_cliente, titulo) VALUES (1,"cliente_tipo1");
SELECT * FROM tipo_cliente
INSERT INTO tipo_cliente (id_tipo_cliente, titulo) VALUES (2,"cliente_tipo2");
SELECT * FROM tipo_cliente