-- QUERYS E-MARKET
USE DATABASE EMarket;
-- CATEGORIAS Y PRODUCTOS

SELECT * FROM categorias;

SELECT CategoriaNombre, Descripcion FROM categorias;

SELECT * FROM productos;

SELECT * FROM productos
WHERE Discontinuado = 1;

SELECT * FROM productos
WHERE ProveedorID = 8;

SELECT * FROM productos
WHERE PrecioUnitario BETWEEN 10 AND 22;

SELECT * FROM productos
WHERE UnidadesStock < NivelReorden;

SELECT * FROM productos
WHERE UnidadesStock < NivelReorden and UnidadesPedidas = 0;

-- CLIENTES

SELECT Contacto, Compania, Titulo, Pais FROM clientes;

SELECT * FROM clientes
WHERE Titulo = "owner";

SELECT * FROM clientes
WHERE Contacto LIKE "C%";

-- FACTURAS
	
SELECT * FROM facturas
ORDER BY FechaFactura;

SELECT * FROM facturas
WHERE PaisEnvio = "USA" AND EnvioVia != 3;

SELECT * FROM facturas
WHERE ClienteID = "gourl";

SELECT * FROM facturas
WHERE EmpleadoID in (2,3,5,8,9);

-- CONSULTAS QUERYS ML - PARTE II

SELECT * FROM productos
ORDER BY PrecioUnitario DESC;

SELECT * FROM productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

SELECT * FROM productos
ORDER BY UnidadesStock DESC
LIMIT 10;

-- FACTURA DETALLE

SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle;

SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle
ORDER BY Cantidad desc;

SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle
WHERE Cantidad between 50 AND 100
ORDER BY Cantidad desc;

SELECT FacturaID as NROFACTURA, ProductoID AS PRODUCTO, 
Cantidad * PrecioUnitario AS TOTAL FROM facturadetalle;

-- extras

SELECT * FROM clientes
WHERE Pais IN ("BRAZIL", "MEXICO") OR Titulo LIKE "sales%";

SELECT * FROM clientes
WHERE Compania LIKE "a%";

SELECT Ciudad, Contacto as "APELLIDO Y NOMBRE", Titulo AS Puesto FROM clientes
WHERE Ciudad = "MADRID";

SELECT * FROM facturas
WHERE facturaid between 10000 AND 10500;

SELECT * FROM facturas
WHERE (facturaid between 10000 AND 10500) or (ClienteID like "b%");

SELECT * FROM facturas
WHERE CiudadEnvio = "Vancouver" OR EnvioVia = 3;

SELECT EmpleadoID FROM empleados
WHERE Apellido = "BUCHANAN";

SELECT * FROM facturas
WHERE EmpleadoID = 5;

---------
SELECT * from productos p join categorias cat 
ON p.CategoriaID = cat.CategoriaID
join proveedores pr 
ON pr.ProveedorID = p.ProveedorID;






