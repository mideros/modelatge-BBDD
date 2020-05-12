-- 1.1.3 Consultas sobre una tabla
-- Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;
-- Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;
-- Lista todas las columnas de la tabla producto.
SELECT * FROM producto;
-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio AS euros , precio * 1.08 AS dolar FROM producto;
-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS nombre_de_producto, precio AS euros, precio * 1.08 AS dolares FROM producto;
-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER (nombre) AS nombre, precio FROM producto;
-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER (nombre) AS nombre, precio FROM producto;
-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre AS nombre_fabricante , UPPER(SUBSTR(nombre,1,2)) AS caracteres FROM fabricante;
-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio,0) AS precio FROM producto;
-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio,0) AS precio FROM producto;
-- Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante FROM producto;
-- Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;
-- Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre  FROM fabricante ORDER BY nombre ASC;
-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre  FROM fabricante ORDER BY nombre DESC;
-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 0, 5;
-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante LIMIT 3, 2;
-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 0,1;
-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 0,1;
-- Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante=2;
-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto WHERE precio <= 120; 
-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE precio >= 400; 
-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE not precio >= 400;
-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT * FROM producto WHERE  precio >= 80 AND precio <=300;
-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT * FROM producto WHERE  precio BETWEEN 60 AND 200;
-- Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT * FROM producto WHERE  precio >=200 AND codigo_fabricante =6;
-- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto WHERE codigo_fabricante =1 or codigo_fabricante =3 or codigo_fabricante= 5;
-- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto WHERE codigo_fabricante IN (1,3,5);
-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio * 100 AS centimos FROM producto;
-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante WHERE nombre LIKE "S%";
-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante WHERE nombre LIKE "%e";
-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante WHERE nombre LIKE "%w%";
-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE LENGTH(nombre)=4;
-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto	WHERE nombre LIKE "%portatil%";
-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre FROM producto	WHERE nombre LIKE "%monitor%" AND precio < 215;
-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio  FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

/* 1.1.4 Consultas multitabla (Composición interna)*/

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombreFabricante
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombreFabricante
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC;

-- Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo AS codigoProducto, producto.nombre AS nombreProducto,  fabricante.codigo AS codigoFabricante, fabricante.nombre AS nombreFabricante
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT  producto.nombre AS nombreProducto, producto.precio AS precioProducto, fabricante.nombre AS nombreFabricante
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC LIMIT 0,1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT  producto.nombre AS nombreProducto, producto.precio AS precioProducto, fabricante.nombre AS nombreFabricante
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC LIMIT 0,1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT *
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "lenovo";

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT *
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Crucial " AND producto.precio > 200;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT *
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Crucial " OR fabricante.nombre = "Hewlett-Packard" OR fabricante.nombre = "Seagate";

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Utilizando el operador IN.
SELECT *
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ("Crucial","Hewlett-Packard", "Seagate");

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT producto.nombre, producto.precio
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE "%e";

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre, producto.precio
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE "%w%";

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombreFabricante
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180 
ORDER BY producto.precio DESC, producto.nombre ASC;

-- Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT fabricante.codigo, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;


/*Consultas multitabla (Composición externa)*/

-- Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT fabricante.codigo AS codigoFabricante, fabricante.nombre AS nombreFabricante, producto.nombre AS nombreProducto
FROM producto
RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fabricante.codigo AS codigoFabricante, fabricante.nombre AS nombreFabricante, producto.nombre AS nombreProducto
FROM fabricante
LEFT JOIN producto ON  fabricante.codigo = producto.codigo_fabricante 
WHERE  producto.nombre is NULL;

-- ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta. 
-- R:// No pueden existir productos que no esten relacionados con el fabricante ya que  existe una relacion uno a muchos entre fabricante 
-- y productos genera una llave foranea dondse se especifica que no puede ser un valor nulo.

/*1.1.6 Consultas resumen*/

-- calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(codigo) FROM producto;
-- Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(codigo) FROM fabricante;
-- Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT(codigo_fabricante)) FROM producto;
-- Calcula la media del precio de todos los productos.
SELECT AVG(precio) FROM producto;
-- Calcula el precio más barato de todos los productos.
SELECT MIN(precio) FROM producto;
-- Calcula el precio más caro de todos los productos.
SELECT MAX(precio) FROM producto;
-- Lista el nombre y el precio del producto más barato.
SELECT nombre,MAX(precio) FROM producto;
-- Lista el nombre y el precio del producto más caro.
SELECT nombre,MIN(precio) FROM producto;
-- Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto;

-- Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(producto.codigo) 
FROM producto
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre ="Asus";

-- Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(producto.precio) 
FROM producto
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre ="Asus";

-- Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(producto.precio) 
FROM producto
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre ="Asus";

-- Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(producto.precio) 
FROM producto
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre ="Asus";

-- Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(producto.precio) 
FROM producto
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre ="Asus";

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(producto.precio) AS precioMaximo, MIN(producto.precio) AS precioMinimo, AVG(producto.precio) AS promedio, COUNT(producto.codigo) AS totalProductos 
FROM producto
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre ="Crucial";

-- Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT  fabricante.nombre, COUNT(producto.codigo) AS numProductos
FROM producto
RIGHT JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
ORDER BY numProductos DESC;

-- Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT fabricante.nombre, MAX(producto.precio) AS precioMaximo, MIN(producto.precio) AS precioMinimo, AVG(producto.precio) AS promedio
FROM fabricante
LEFT JOIN  producto ON  fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre;

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT producto.codigo_fabricante, MAX(producto.precio) AS precioMaximo, MIN(producto.precio) AS precioMinimo, AVG(producto.precio) AS promedio, COUNT(producto.codigo) AS cantidadProductos
FROM producto 
GROUP BY producto.codigo_fabricante
HAVING AVG(producto.precio) > 200;

-- Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT fabricante.nombre, MAX(producto.precio) AS precioMaximo, MIN(producto.precio) AS precioMinimo, AVG(producto.precio) AS promedio, COUNT(producto.codigo) AS cantidadProductos
FROM producto 
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
GROUP BY fabricante.nombre
HAVING AVG(producto.precio) > 200;

-- Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(codigo) AS totalProductos
FROM producto
WHERE precio >=180;

-- Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT fabricante.nombre, COUNT(producto.codigo) AS totalProducto
FROM producto 
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180
GROUP BY fabricante.nombre;

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT codigo_fabricante, AVG(precio) AS promedioPrecio
FROM producto
GROUP BY codigo_fabricante;

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT fabricante.nombre, AVG(producto.precio) AS promedio
FROM producto 
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
GROUP BY fabricante.nombre;

-- Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT fabricante.nombre, AVG(producto.precio) AS promedio
FROM producto 
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
GROUP BY fabricante.nombre
HAVING AVG(producto.precio) >=150;

-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre, COUNT(producto.codigo) AS cantidadProductos
FROM producto 
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
GROUP BY fabricante.nombre
HAVING COUNT(producto.codigo) >= 2;

-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT fabricante.nombre, COUNT(producto.codigo) AS total
FROM producto 
INNER JOIN fabricante ON  producto.codigo_fabricante = fabricante.codigo 
WHERE producto.precio >= 220
GROUP BY fabricante.nombre
ORDER BY total DESC;

-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT  f.nombre, (SELECT COUNT(p.codigo) 
FROM producto AS p 
WHERE p.codigo_fabricante = f.codigo AND p.precio >=220) AS cantidad
FROM fabricante AS f
GROUP BY f.codigo
ORDER BY cantidad DESC;

-- Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT fabricante.nombre
FROM fabricante
INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
HAVING SUM(producto.precio) > 1000;

-- Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
SELECT producto.nombre AS nombre_producto, MAX(producto.precio) AS precio, fabricante.nombre AS nombre_fabricante
FROM producto 
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
ORDER BY fabricante.nombre ASC;

/*Subconsultas (En la cláusula WHERE)*/

-- Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT producto.nombre, producto.codigo_fabricante
FROM producto 
WHERE producto.codigo_fabricante = (select fabricante.codigo from fabricante where fabricante.nombre = "lenovo")
GROUP BY producto.codigo;

-- Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * 
FROM producto 
WHERE producto.precio = (select MAX(producto.precio) FROM producto where producto.codigo_fabricante = (select fabricante.codigo from fabricante where fabricante.nombre = "lenovo"))
GROUP BY producto.codigo;

-- Lista el nombre del producto más caro del fabricante Lenovo.
SELECT producto.nombre 
FROM producto 
WHERE producto.precio = (select MAX(producto.precio) FROM producto where producto.codigo_fabricante = (select fabricante.codigo from fabricante where fabricante.nombre = "lenovo"))
GROUP BY producto.codigo;

-- Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT producto.nombre 
FROM producto 
WHERE producto.precio = (select MIN(producto.precio) FROM producto where producto.codigo_fabricante = (select fabricante.codigo from fabricante where fabricante.nombre = "Hewlett-Packard"))
GROUP BY producto.codigo;

-- Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT *
FROM producto 
WHERE producto.precio >= (select MAX(producto.precio) FROM producto where producto.codigo_fabricante = (select fabricante.codigo from fabricante where fabricante.nombre = "lenovo"))
GROUP BY producto.codigo;

-- Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
select * 
from producto
where producto.codigo_fabricante = (select fabricante.codigo from fabricante where fabricante.nombre = "Asus") 
and producto.precio > (select AVG(producto.precio) from producto );

/*1.1.7.2 Subconsultas con ALL y ANY */

-- Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT p.precio , p.nombre
FROM producto p
WHERE p.codigo = ALL (SELECT pr.codigo FROM producto pr WHERE pr.precio > p.precio);

-- Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT p.precio , p.nombre
FROM producto p
WHERE p.codigo = ALL (SELECT pr.codigo FROM producto pr WHERE pr.precio < p.precio);

-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT fabricante.nombre 
FROM fabricante
WHERE fabricante.codigo = ANY (SELECT producto.codigo_fabricante FROM producto);

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT fabricante.nombre 
FROM fabricante
WHERE fabricante.codigo != ALL (SELECT producto.codigo_fabricante FROM producto);

/*1.1.7.3 Subconsultas con IN y NOT IN*/

-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT fabricante.nombre 
FROM fabricante
WHERE fabricante.codigo IN (SELECT producto.codigo_fabricante FROM producto);

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT fabricante.nombre 
FROM fabricante
WHERE fabricante.codigo NOT IN (SELECT producto.codigo_fabricante FROM producto);

/*1.1.7.4 Subconsultas con EXISTS y NOT EXISTS */
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT fabricante.nombre 
FROM fabricante
WHERE EXISTS (SELECT producto.codigo_fabricante FROM producto WHERE producto.codigo_fabricante = fabricante.codigo);

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT fabricante.nombre 
FROM fabricante
WHERE NOT EXISTS (SELECT producto.codigo_fabricante FROM producto WHERE producto.codigo_fabricante = fabricante.codigo);

/*1.1.7.5 Subconsultas correlacionadas*/
-- Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT f.nombre, (SELECT MAX(p.precio) 
FROM producto AS p WHERE p.codigo_fabricante = f.codigo) AS precioMax
FROM fabricante AS f
GROUP BY f.codigo;

-- Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT p.nombre
FROM producto AS p 
WHERE p.precio >= ANY (SELECT AVG(pr.precio)  
FROM producto AS pr
INNER JOIN fabricante AS f ON f.codigo = pr.codigo_fabricante
group by pr.codigo_fabricante)
group by p.codigo_fabricante; 

-- Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre
FROM producto AS p 
WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante AS f WHERE f.nombre = "lenovo") 
HAVING MAX(p.precio); 

/*1.1.8 Subconsultas (En la cláusula HAVING)*/
-- Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT fa.nombre
FROM fabricante as fa 
INNER JOIN producto as pr on pr.codigo_fabricante = fa.codigo
WHERE fa.nombre != "lenovo"
group by fa.nombre
HAVING count(pr.codigo) = (SELECT Count(p.codigo)
FROM producto AS p 
INNER JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
WHERE f.nombre = "lenovo"); 