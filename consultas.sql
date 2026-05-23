---1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT codigo_oficina, ciudad from oficina;
+----------------+----------------------+
| codigo_oficina | ciudad               |
+----------------+----------------------+
| BCN-ES         | Barcelona            |
| BOS-USA        | Boston               |
| LON-UK         | Londres              |
| MAD-ES         | Madrid               |
| PAR-FR         | Paris                |
| SFC-USA        | San Francisco        |
| SYD-AU         | Sydney               |
| TAL-ES         | Talavera de la Reina |
| TOK-JP         | Tokyo                |
+----------------+----------------------+

--2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad, telefono from oficina where pais like 'Esp%';
+----------------------+----------------+
| ciudad               | telefono       |
+----------------------+----------------+
| Barcelona            | +34 93 3561182 |
| Madrid               | +34 91 7514487 |
| Talavera de la Reina | +34 925 867231 |
+----------------------+----------------+

--3. Devuelve un listado con el email, nombre, apellidos completos (Por ej. Fernandez Alonso, Mario Alfredo) de los empleados cuyo
--jefe tiene un código de jefe igual a 7.
SELECT email, nombre, concat(apellido1, apellido2) as 'apellidos', codigo_jefe from empleado where codigo_jefe = 7;
+--------------------------+---------+------------------+-------------+
| email                    | nombre  | apellidos        | codigo_jefe |
+--------------------------+---------+------------------+-------------+
| mlopez@jardineria.es     | Mariano | L?pezMurcia      |           7 |
| lcampoamor@jardineria.es | Lucio   | CampoamorMart?n  |           7 |
| hrodriguez@jardineria.es | Hilario | RodriguezHuertas |           7 |
+--------------------------+---------+------------------+-------------+

--4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT puesto, nombre, concat(apellido1, apellido2), email, codigo_jefe from empleado where codigo_jefe is null;
+------------------+--------+------------------------------+----------------------+-------------+
| puesto           | nombre | concat(apellido1, apellido2) | email                | codigo_jefe |
+------------------+--------+------------------------------+----------------------+-------------+
| Director General | Marcos | Maga?aPerez                  | marcos@jardineria.es |        NULL |
+------------------+--------+------------------------------+----------------------+-------------+

--5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT nombre, concat(apellido1, apellido2) as 'apellidos', puesto from empleado where puesto != 'Representante Ventas';
+----------+---------------+-----------------------+
| nombre   | apellidos     | puesto                |
+----------+---------------+-----------------------+
| Marcos   | Maga?aPerez   | Director General      |
| Ruben    | L?pezMartinez | Subdirector Marketing |
| Alberto  | SoriaCarrasco | Subdirector Ventas    |
| Maria    | Sol?sJerez    | Secretaria            |
| Carlos   | SoriaJimenez  | Director Oficina      |
| Emmanuel | Maga?aPerez   | Director Oficina      |
| Francois | Fignon        | Director Oficina      |
| Michael  | Bolton        | Director Oficina      |
| Hilary   | Washington    | Director Oficina      |
| Nei      | Nishikori     | Director Oficina      |
| Amy      | Johnson       | Director Oficina      |
| Kevin    | Fallmer       | Director Oficina      |
+----------+---------------+-----------------------+

--6. Devuelve un listado con el nombre de todos los clientes españoles.
SELECT nombre_cliente, pais from cliente where pais like 'Spain';
+--------------------------------+-------+
| nombre_cliente                 | pais  |
+--------------------------------+-------+
| Lasas S.A.                     | Spain |
| Beragua                        | Spain |
| Club Golf Puerta del hierro    | Spain |
| Naturagua                      | Spain |
| DaraDistribuciones             | Spain |
| Madrile?a de riegos            | Spain |
| Lasas S.A.                     | Spain |
| Camunas Jardines S.L.          | Spain |
| Dardena S.A.                   | Spain |
| Jardin de Flores               | Spain |
| Flores Marivi                  | Spain |
| Flowers, S.A                   | Spain |
| Naturajardin                   | Spain |
| Golf S.A.                      | Spain |
| Americh Golf Management SL     | Spain |
| Aloha                          | Spain |
| El Prat                        | Spain |
| Sotogrande                     | Spain |
| Vivero Humanes                 | Spain |
| Fuenla City                    | Spain |
| Jardines y Mansiones Cactus SL | Spain |
| Jardiner?as Mat?as SL          | Spain |
| Agrojardin                     | Spain |
| Top Campo                      | Spain |
| Jardineria Sara                | Spain |
| Campohermoso                   | Spain |
| Flores S.L.                    | Spain |
+--------------------------------+-------+

--7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT distinct estado from pedido;
+-----------+
| estado    |
+-----------+
| Entregado |
| Rechazado |
| Pendiente |
+-----------+

--8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá
--eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- Utilizando la función YEAR
SELECT distinct codigo_cliente, fecha_pago from pago where YEAR(fecha_pago) = 2008;
+----------------+------------+
| codigo_cliente | fecha_pago |
+----------------+------------+
|              1 | 2008-11-10 |
|              1 | 2008-12-10 |
|             13 | 2008-08-04 |
|             14 | 2008-07-15 |
|             26 | 2008-03-18 |
+----------------+------------+

-- Utilizando DATE_FORMAT
SELECT distinct codigo_cliente, fecha_pago from pago where DATE_FORMAT(fecha_pago, '%Y') = 2008;
+----------------+------------+
| codigo_cliente | fecha_pago |
+----------------+------------+
|              1 | 2008-11-10 |
|              1 | 2008-12-10 |
|             13 | 2008-08-04 |
|             14 | 2008-07-15 |
|             26 | 2008-03-18 |
+----------------+------------+

-- Sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT codigo_cliente, fecha_pago from pago where fecha_pago like '2008%';
+----------------+------------+
| codigo_cliente | fecha_pago |
+----------------+------------+
|              1 | 2008-11-10 |
|              1 | 2008-12-10 |
|             13 | 2008-08-04 |
|             14 | 2008-07-15 |
|             26 | 2008-03-18 |
+----------------+------------+

--9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido
--entregados a tiempo.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega > fecha_esperada;
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             9 |              1 | 2008-12-27     | 2008-12-28    |
|            13 |              7 | 2009-01-14     | 2009-01-15    |
|            16 |              7 | 2009-01-07     | 2009-01-15    |
|            17 |              7 | 2009-01-09     | 2009-01-11    |
|            18 |              9 | 2009-01-06     | 2009-01-07    |
|            22 |              9 | 2009-01-11     | 2009-01-13    |
|            28 |              3 | 2009-02-17     | 2009-02-20    |
|            31 |             13 | 2008-09-30     | 2008-10-04    |
|            32 |              4 | 2007-01-19     | 2007-01-27    |
|            38 |             19 | 2009-03-06     | 2009-03-07    |
|            39 |             19 | 2009-03-07     | 2009-03-09    |
|            40 |             19 | 2009-03-10     | 2009-03-13    |
|            42 |             19 | 2009-03-23     | 2009-03-27    |
|            43 |             23 | 2009-03-26     | 2009-03-28    |
|            44 |             23 | 2009-03-27     | 2009-03-30    |
|            45 |             23 | 2009-03-04     | 2009-03-07    |
|            46 |             23 | 2009-03-04     | 2009-03-05    |
|            49 |             26 | 2008-07-22     | 2008-07-30    |
|            55 |             14 | 2009-01-10     | 2009-01-11    |
|            60 |              1 | 2008-12-27     | 2008-12-28    |
|            68 |              3 | 2009-02-17     | 2009-02-20    |
|            92 |             27 | 2009-04-30     | 2009-05-03    |
|            96 |             35 | 2008-04-12     | 2008-04-13    |
|           103 |             30 | 2009-01-20     | 2009-01-24    |
|           106 |             30 | 2009-05-15     | 2009-05-20    |
|           112 |             36 | 2009-04-06     | 2009-05-07    |
|           113 |             36 | 2008-11-09     | 2009-01-09    |
|           114 |             36 | 2009-01-29     | 2009-01-31    |
|           115 |             36 | 2009-01-26     | 2009-02-27    |
|           123 |             30 | 2009-01-20     | 2009-01-24    |
|           126 |             30 | 2009-05-15     | 2009-05-20    |
|           128 |             38 | 2008-12-10     | 2008-12-29    |
+---------------+----------------+----------------+---------------+

--10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de
--entrega ha sido al menos dos días antes de la fecha esperada.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega <= fecha_esperada - 2;
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             2 |              5 | 2007-10-28     | 2007-10-26    |
|            24 |             14 | 2008-07-31     | 2008-07-25    |
|            30 |             13 | 2008-09-03     | 2008-08-31    |
|            36 |             14 | 2008-12-15     | 2008-12-10    |
|            53 |             13 | 2008-11-15     | 2008-11-09    |
|            89 |             35 | 2007-12-13     | 2007-12-10    |
|            91 |             27 | 2009-03-29     | 2009-03-27    |
|            93 |             27 | 2009-05-30     | 2009-05-17    |
+---------------+----------------+----------------+---------------+

-- Utilizando la función ADDDATE
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where DATE_ADD(fecha_entrega, INTERVAL 2 DAY) <= fecha_esperada;
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             2 |              5 | 2007-10-28     | 2007-10-26    |
|            24 |             14 | 2008-07-31     | 2008-07-25    |
|            30 |             13 | 2008-09-03     | 2008-08-31    |
|            36 |             14 | 2008-12-15     | 2008-12-10    |
|            53 |             13 | 2008-11-15     | 2008-11-09    |
|            89 |             35 | 2007-12-13     | 2007-12-10    |
|            91 |             27 | 2009-03-29     | 2009-03-27    |
|            93 |             27 | 2009-05-30     | 2009-05-17    |
+---------------+----------------+----------------+---------------+

-- Utilizando la función DATEDIFF
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             2 |              5 | 2007-10-28     | 2007-10-26    |
|            24 |             14 | 2008-07-31     | 2008-07-25    |
|            30 |             13 | 2008-09-03     | 2008-08-31    |
|            36 |             14 | 2008-12-15     | 2008-12-10    |
|            53 |             13 | 2008-11-15     | 2008-11-09    |
|            89 |             35 | 2007-12-13     | 2007-12-10    |
|            91 |             27 | 2009-03-29     | 2009-03-27    |
|            93 |             27 | 2009-05-30     | 2009-05-17    |
+---------------+----------------+----------------+---------------+

--11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT codigo_pedido, fecha_pedido, estado from pedido where estado like 'rechazado' and YEAR(fecha_pedido) = 2009;
+---------------+--------------+-----------+
| codigo_pedido | fecha_pedido | estado    |
+---------------+--------------+-----------+
|            14 | 2009-01-02   | Rechazado |
|            21 | 2009-01-09   | Rechazado |
|            25 | 2009-02-02   | Rechazado |
|            26 | 2009-02-06   | Rechazado |
|            40 | 2009-03-09   | Rechazado |
|            46 | 2009-04-03   | Rechazado |
|            65 | 2009-02-02   | Rechazado |
|            66 | 2009-02-06   | Rechazado |
|            74 | 2009-01-14   | Rechazado |
|            81 | 2009-01-18   | Rechazado |
|           101 | 2009-03-07   | Rechazado |
|           105 | 2009-02-14   | Rechazado |
|           120 | 2009-03-07   | Rechazado |
|           125 | 2009-02-14   | Rechazado |
+---------------+--------------+-----------+

--12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año
SELECT codigo_pedido, fecha_pedido, estado from pedido where estado like 'Entregado' and MONTH(fecha_pedido) = 1;
+---------------+--------------+-----------+
| codigo_pedido | fecha_pedido | estado    |
+---------------+--------------+-----------+
|             1 | 2006-01-17   | Entregado |
|            13 | 2009-01-12   | Entregado |
|            15 | 2009-01-09   | Entregado |
|            16 | 2009-01-06   | Entregado |
|            17 | 2009-01-08   | Entregado |
|            18 | 2009-01-05   | Entregado |
|            22 | 2009-01-11   | Entregado |
|            32 | 2007-01-07   | Entregado |
|            58 | 2009-01-24   | Entregado |
|            64 | 2009-01-24   | Entregado |
|            75 | 2009-01-11   | Entregado |
|            79 | 2009-01-12   | Entregado |
|            82 | 2009-01-20   | Entregado |
|            83 | 2009-01-24   | Entregado |
|            95 | 2008-01-04   | Entregado |
|           100 | 2009-01-10   | Entregado |
|           114 | 2009-01-15   | Entregado |
|           119 | 2009-01-10   | Entregado |
+---------------+--------------+-----------+

--13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor
SELECT id_transaccion, codigo_cliente, forma_pago, fecha_pago from pago where forma_pago like 'Paypal' and YEAR(fecha_pago) = 2008 order by fecha_pago desc; 
+----------------+----------------+------------+------------+
| id_transaccion | codigo_cliente | forma_pago | fecha_pago |
+----------------+----------------+------------+------------+
| ak-std-000002  |              1 | PayPal     | 2008-12-10 |
| ak-std-000001  |              1 | PayPal     | 2008-11-10 |
| ak-std-000014  |             13 | PayPal     | 2008-08-04 |
| ak-std-000015  |             14 | PayPal     | 2008-07-15 |
| ak-std-000020  |             26 | PayPal     | 2008-03-18 |
+----------------+----------------+------------+------------+

--14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas
--de pago repetidas.
SELECT distinct forma_pago from pago;
+---------------+
| forma_pago    |
+---------------+
| PayPal        |
| Transferencia |
| Cheque        |
+---------------+

--15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y
--que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, 
--mostrando en primer lugar los de mayor precio

SELECT codigo_producto, gama, cantidad_en_stock, precio_venta from producto where gama like 'Ornamentales' and cantidad_en_stock > 100 order by precio_venta desc;
+-----------------+--------------+-------------------+--------------+
| codigo_producto | gama         | cantidad_en_stock | precio_venta |
+-----------------+--------------+-------------------+--------------+
| OR-115          | Ornamentales |               120 |         7.00 |
| OR-116          | Ornamentales |               120 |         7.00 |
| OR-117          | Ornamentales |               120 |         7.00 |
| OR-118          | Ornamentales |               120 |         7.00 |
| OR-112          | Ornamentales |               120 |         5.00 |
| OR-125          | Ornamentales |               120 |         5.00 |
| OR-124          | Ornamentales |               120 |         5.00 |
| OR-123          | Ornamentales |               120 |         5.00 |
| OR-122          | Ornamentales |               120 |         5.00 |
| OR-121          | Ornamentales |               120 |         5.00 |
| OR-120          | Ornamentales |               120 |         5.00 |
| OR-119          | Ornamentales |               120 |         5.00 |
| OR-114          | Ornamentales |               120 |         5.00 |
| OR-113          | Ornamentales |               120 |         5.00 |
| OR-126          | Ornamentales |               120 |         5.00 |
+-----------------+--------------+-------------------+--------------+

--16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de
--empleado 11 o 30.
SELECT codigo_cliente, ciudad, codigo_empleado_rep_ventas from cliente where ciudad like 'Madrid' and (codigo_empleado_rep_ventas = 11 or codigo_empleado_rep_ventas = 30); 
+----------------+--------+----------------------------+
| codigo_cliente | ciudad | codigo_empleado_rep_ventas |
+----------------+--------+----------------------------+
|              7 | Madrid |                         11 |
|              8 | Madrid |                         11 |
|              9 | Madrid |                         11 |
|             10 | Madrid |                         11 |
|             11 | Madrid |                         11 |
|             15 | Madrid |                         30 |
|             18 | Madrid |                         30 |
+----------------+--------+----------------------------+

--17. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
SELECT c.nombre_cliente, e.nombre, concat(e.apellido1, e.apellido2) as 'apellidos' from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado;
+--------------------------------+-----------------+-------------------+
| nombre_cliente                 | nombre          | apellidos         |
+--------------------------------+-----------------+-------------------+
| GoldFish Garden                | Walter Santiago | SanchezLopez      |
| Gardening Associates           | Walter Santiago | SanchezLopez      |
| Gerudo Valley                  | Lorena          | Paxton            |
| Tendo Garden                   | Lorena          | Paxton            |
| Lasas S.A.                     | Mariano         | L?pezMurcia       |
| Beragua                        | Emmanuel        | Maga?aPerez       |
| Club Golf Puerta del hierro    | Emmanuel        | Maga?aPerez       |
| Naturagua                      | Emmanuel        | Maga?aPerez       |
| DaraDistribuciones             | Emmanuel        | Maga?aPerez       |
| Madrile?a de riegos            | Emmanuel        | Maga?aPerez       |
| Lasas S.A.                     | Mariano         | L?pezMurcia       |
| Camunas Jardines S.L.          | Mariano         | L?pezMurcia       |
| Dardena S.A.                   | Mariano         | L?pezMurcia       |
| Jardin de Flores               | Julian          | Bellinelli        |
| Flores Marivi                  | Felipe          | RosasMarquez      |
| Flowers, S.A                   | Felipe          | RosasMarquez      |
| Naturajardin                   | Julian          | Bellinelli        |
| Golf S.A.                      | Jos? Manuel     | MartinezDe la Osa |
| Americh Golf Management SL     | Jos? Manuel     | MartinezDe la Osa |
| Aloha                          | Jos? Manuel     | MartinezDe la Osa |
| El Prat                        | Jos? Manuel     | MartinezDe la Osa |
| Sotogrande                     | Jos? Manuel     | MartinezDe la Osa |
| Vivero Humanes                 | Julian          | Bellinelli        |
| Fuenla City                    | Felipe          | RosasMarquez      |
| Jardines y Mansiones Cactus SL | Lucio           | CampoamorMart?n   |
| Jardiner?as Mat?as SL          | Lucio           | CampoamorMart?n   |
| Agrojardin                     | Julian          | Bellinelli        |
| Top Campo                      | Felipe          | RosasMarquez      |
| Jardineria Sara                | Felipe          | RosasMarquez      |
| Campohermoso                   | Julian          | Bellinelli        |
| france telecom                 | Lionel          | Narvaez           |
| Mus?e du Louvre                | Lionel          | Narvaez           |
| Tutifruti S.A                  | Mariko          | Kishi             |
| Flores S.L.                    | Michael         | Bolton            |
| The Magic Garden               | Michael         | Bolton            |
| El Jardin Viviente S.L         | Mariko          | Kishi             |
+--------------------------------+-----------------+-------------------+

--18. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT c.nombre_cliente as 'nombre cliente', e.nombre as 'nombre empleado', concat(e.apellido1, e.apellido2) as 'apellidos empleado' from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado where codigo_cliente IN (select codigo_cliente from pago);
+--------------------------------+-----------------+--------------------+
| nombre cliente                 | nombre empleado | apellidos empleado |
+--------------------------------+-----------------+--------------------+
| GoldFish Garden                | Walter Santiago | SanchezLopez       |
| Gardening Associates           | Walter Santiago | SanchezLopez       |
| Gerudo Valley                  | Lorena          | Paxton             |
| Tendo Garden                   | Lorena          | Paxton             |
| Beragua                        | Emmanuel        | Maga?aPerez        |
| Naturagua                      | Emmanuel        | Maga?aPerez        |
| Camunas Jardines S.L.          | Mariano         | L?pezMurcia        |
| Dardena S.A.                   | Mariano         | L?pezMurcia        |
| Jardin de Flores               | Julian          | Bellinelli         |
| Flores Marivi                  | Felipe          | RosasMarquez       |
| Golf S.A.                      | Jos? Manuel     | MartinezDe la Osa  |
| Sotogrande                     | Jos? Manuel     | MartinezDe la Osa  |
| Jardines y Mansiones Cactus SL | Lucio           | CampoamorMart?n    |
| Jardiner?as Mat?as SL          | Lucio           | CampoamorMart?n    |
| Agrojardin                     | Julian          | Bellinelli         |
| Jardineria Sara                | Felipe          | RosasMarquez       |
| Tutifruti S.A                  | Mariko          | Kishi              |
| El Jardin Viviente S.L         | Mariko          | Kishi              |
+--------------------------------+-----------------+--------------------+

--19. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de
--sus representantes de ventas.
SELECT c.nombre_cliente as 'nombre cliente', e.nombre as 'nombre empleado' from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado where c.codigo_cliente NOT IN (select codigo_cliente from pago);  
+-----------------------------+-----------------+
| nombre cliente              | nombre empleado |
+-----------------------------+-----------------+
| Lasas S.A.                  | Mariano         |
| Club Golf Puerta del hierro | Emmanuel        |
| DaraDistribuciones          | Emmanuel        |
| Madrile?a de riegos         | Emmanuel        |
| Lasas S.A.                  | Mariano         |
| Flowers, S.A                | Felipe          |
| Naturajardin                | Julian          |
| Americh Golf Management SL  | Jos? Manuel     |
| Aloha                       | Jos? Manuel     |
| El Prat                     | Jos? Manuel     |
| Vivero Humanes              | Julian          |
| Fuenla City                 | Felipe          |
| Top Campo                   | Felipe          |
| Campohermoso                | Julian          |
| france telecom              | Lionel          |
| Mus?e du Louvre             | Lionel          |
| Flores S.L.                 | Michael         |
| The Magic Garden            | Michael         |
+-----------------------------+-----------------+

--20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes 
--junto con la ciudad de la oficina a la que pertenece el representante.
SELECT c.nombre_cliente, e.nombre, o.ciudad from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado inner join oficina o on e.codigo_oficina = o.codigo_oficina where c.codigo_cliente IN(SELECT codigo_cliente from pago);
+--------------------------------+-----------------+----------------------+
| nombre_cliente                 | nombre          | ciudad               |
+--------------------------------+-----------------+----------------------+
| Beragua                        | Emmanuel        | Barcelona            |
| Naturagua                      | Emmanuel        | Barcelona            |
| Golf S.A.                      | Jos? Manuel     | Barcelona            |
| Sotogrande                     | Jos? Manuel     | Barcelona            |
| Gerudo Valley                  | Lorena          | Boston               |
| Tendo Garden                   | Lorena          | Boston               |
| Camunas Jardines S.L.          | Mariano         | Madrid               |
| Dardena S.A.                   | Mariano         | Madrid               |
| Jardines y Mansiones Cactus SL | Lucio           | Madrid               |
| Jardiner?as Mat?as SL          | Lucio           | Madrid               |
| GoldFish Garden                | Walter Santiago | San Francisco        |
| Gardening Associates           | Walter Santiago | San Francisco        |
| Jardin de Flores               | Julian          | Sydney               |
| Agrojardin                     | Julian          | Sydney               |
| Tutifruti S.A                  | Mariko          | Sydney               |
| El Jardin Viviente S.L         | Mariko          | Sydney               |
| Flores Marivi                  | Felipe          | Talavera de la Reina |
| Jardineria Sara                | Felipe          | Talavera de la Reina |
+--------------------------------+-----------------+----------------------+



--21. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes 
--junto con la ciudad de la oficina a la que pertenece el representante.
SELECT c.nombre_cliente as 'nombre cliente', e.nombre as 'nombre empleado', o.ciudad from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado inner join oficina o on e.codigo_oficina = o.codigo_oficina where c.codigo_cliente NOT IN (SELECT codigo_cliente from pago);
+-----------------------------+-----------------+----------------------+
| nombre cliente              | nombre empleado | ciudad               |
+-----------------------------+-----------------+----------------------+
| Club Golf Puerta del hierro | Emmanuel        | Barcelona            |
| DaraDistribuciones          | Emmanuel        | Barcelona            |
| Madrile?a de riegos         | Emmanuel        | Barcelona            |
| Americh Golf Management SL  | Jos? Manuel     | Barcelona            |
| Aloha                       | Jos? Manuel     | Barcelona            |
| El Prat                     | Jos? Manuel     | Barcelona            |
| Lasas S.A.                  | Mariano         | Madrid               |
| Lasas S.A.                  | Mariano         | Madrid               |
| france telecom              | Lionel          | Paris                |
| Mus?e du Louvre             | Lionel          | Paris                |
| Flores S.L.                 | Michael         | San Francisco        |
| The Magic Garden            | Michael         | San Francisco        |
| Naturajardin                | Julian          | Sydney               |
| Vivero Humanes              | Julian          | Sydney               |
| Campohermoso                | Julian          | Sydney               |
| Flowers, S.A                | Felipe          | Talavera de la Reina |
| Fuenla City                 | Felipe          | Talavera de la Reina |
| Top Campo                   | Felipe          | Talavera de la Reina |
+-----------------------------+-----------------+----------------------+

--22. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
SELECT distinct concat(o.linea_direccion1, o.linea_direccion2) as 'direccion', c.ciudad from oficina o inner join empleado e on o.codigo_oficina = e.codigo_oficina inner join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas where c.ciudad like 'Fuenlabrada';
+-----------------------------------------+-------------+
| direccion                               | ciudad      |
+-----------------------------------------+-------------+
| Bulevar Indalecio Prieto, 32            | Fuenlabrada |
| 5-11 Wentworth AvenueFloor #2           | Fuenlabrada |
| Francisco Aguirre, 325? piso (exterior) | Fuenlabrada |
+-----------------------------------------+-------------+

--23. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina 
--a la que pertenece el representante.
SELECT c.nombre_cliente as 'nombre cliente', e.nombre as 'nombre empleado', o.ciudad from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado inner join oficina o on e.codigo_oficina = o.codigo_oficina;
+--------------------------------+-----------------+----------------------+
| nombre cliente                 | nombre empleado | ciudad               |
+--------------------------------+-----------------+----------------------+
| Beragua                        | Emmanuel        | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel        | Barcelona            |
| Naturagua                      | Emmanuel        | Barcelona            |
| DaraDistribuciones             | Emmanuel        | Barcelona            |
| Madrile?a de riegos            | Emmanuel        | Barcelona            |
| Golf S.A.                      | Jos? Manuel     | Barcelona            |
| Americh Golf Management SL     | Jos? Manuel     | Barcelona            |
| Aloha                          | Jos? Manuel     | Barcelona            |
| El Prat                        | Jos? Manuel     | Barcelona            |
| Sotogrande                     | Jos? Manuel     | Barcelona            |
| Gerudo Valley                  | Lorena          | Boston               |
| Tendo Garden                   | Lorena          | Boston               |
| Lasas S.A.                     | Mariano         | Madrid               |
| Lasas S.A.                     | Mariano         | Madrid               |
| Camunas Jardines S.L.          | Mariano         | Madrid               |
| Dardena S.A.                   | Mariano         | Madrid               |
| Jardines y Mansiones Cactus SL | Lucio           | Madrid               |
| Jardiner?as Mat?as SL          | Lucio           | Madrid               |
| france telecom                 | Lionel          | Paris                |
| Mus?e du Louvre                | Lionel          | Paris                |
| Flores S.L.                    | Michael         | San Francisco        |
| The Magic Garden               | Michael         | San Francisco        |
| GoldFish Garden                | Walter Santiago | San Francisco        |
| Gardening Associates           | Walter Santiago | San Francisco        |
| Jardin de Flores               | Julian          | Sydney               |
| Naturajardin                   | Julian          | Sydney               |
| Vivero Humanes                 | Julian          | Sydney               |
| Agrojardin                     | Julian          | Sydney               |
| Campohermoso                   | Julian          | Sydney               |
| Tutifruti S.A                  | Mariko          | Sydney               |
| El Jardin Viviente S.L         | Mariko          | Sydney               |
| Flores Marivi                  | Felipe          | Talavera de la Reina |
| Flowers, S.A                   | Felipe          | Talavera de la Reina |
| Fuenla City                    | Felipe          | Talavera de la Reina |
| Top Campo                      | Felipe          | Talavera de la Reina |
| Jardineria Sara                | Felipe          | Talavera de la Reina |
+--------------------------------+-----------------+----------------------+
--24. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
SELECT em.nombre as 'nombre empleado', e.nombre as 'nombre jefe' from empleado em inner join empleado e on em.codigo_jefe = e.codigo_empleado;
+-----------------+-------------+
| nombre empleado | nombre jefe |
+-----------------+-------------+
| Ruben           | Marcos      |
| Alberto         | Ruben       |
| Maria           | Ruben       |
| Felipe          | Alberto     |
| Juan Carlos     | Alberto     |
| Carlos          | Alberto     |
| Mariano         | Carlos      |
| Lucio           | Carlos      |
| Hilario         | Carlos      |
| Emmanuel        | Alberto     |
| Jos? Manuel     | Emmanuel    |
| David           | Emmanuel    |
| Oscar           | Emmanuel    |
| Francois        | Alberto     |
| Lionel          | Francois    |
| Laurent         | Francois    |
| Michael         | Alberto     |
| Walter Santiago | Michael     |
| Hilary          | Alberto     |
| Marcus          | Hilary      |
| Lorena          | Hilary      |
| Nei             | Alberto     |
| Narumi          | Nei         |
| Takuma          | Nei         |
| Amy             | Alberto     |
| Larry           | Amy         |
| John            | Amy         |
| Kevin           | Alberto     |
| Julian          | Kevin       |
| Mariko          | Kevin       |
+-----------------+-------------+

--25. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
SELECT distinct c.nombre_cliente from pedido p inner join cliente c on p.codigo_cliente = c.codigo_cliente where p.fecha_entrega > p.fecha_esperada;
+--------------------------------+
| nombre_cliente                 |
+--------------------------------+
| GoldFish Garden                |
| Gardening Associates           |
| Gerudo Valley                  |
| Beragua                        |
| Naturagua                      |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Golf S.A.                      |
| Sotogrande                     |
| Jardines y Mansiones Cactus SL |
| Jardiner?as Mat?as SL          |
| Jardineria Sara                |
| Tutifruti S.A                  |
| Flores S.L.                    |
| El Jardin Viviente S.L         |
+--------------------------------+

--26. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
SELECT distinct c.nombre_cliente, pr.gama from cliente c inner join pedido p on c.codigo_cliente = p.codigo_cliente inner join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido inner join producto pr on dp.codigo_producto = pr.codigo_producto;
+--------------------------------+--------------+
| nombre_cliente                 | gama         |
+--------------------------------+--------------+
| GoldFish Garden                | Frutales     |
| GoldFish Garden                | Arom?ticas   |
| GoldFish Garden                | Ornamentales |
| Gardening Associates           | Frutales     |
| Gardening Associates           | Ornamentales |
| Gerudo Valley                  | Herramientas |
| Gerudo Valley                  | Ornamentales |
| Gerudo Valley                  | Frutales     |
| Tendo Garden                   | Frutales     |
| Tendo Garden                   | Ornamentales |
| Tendo Garden                   | Arom?ticas   |
| Beragua                        | Herramientas |
| Beragua                        | Frutales     |
| Beragua                        | Ornamentales |
| Naturagua                      | Herramientas |
| Naturagua                      | Frutales     |
| Naturagua                      | Ornamentales |
| Camunas Jardines S.L.          | Arom?ticas   |
| Camunas Jardines S.L.          | Frutales     |
| Camunas Jardines S.L.          | Ornamentales |
| Dardena S.A.                   | Herramientas |
| Dardena S.A.                   | Frutales     |
| Dardena S.A.                   | Ornamentales |
| Jardin de Flores               | Frutales     |
| Jardin de Flores               | Ornamentales |
| Jardin de Flores               | Arom?ticas   |
| Jardin de Flores               | Herramientas |
| Flores Marivi                  | Ornamentales |
| Flores Marivi                  | Frutales     |
| Flores Marivi                  | Arom?ticas   |
| Flores Marivi                  | Herramientas |
| Golf S.A.                      | Herramientas |
| Golf S.A.                      | Arom?ticas   |
| Sotogrande                     | Arom?ticas   |
| Sotogrande                     | Frutales     |
| Jardines y Mansiones Cactus SL | Frutales     |
| Jardines y Mansiones Cactus SL | Ornamentales |
| Jardiner?as Mat?as SL          | Arom?ticas   |
| Jardiner?as Mat?as SL          | Frutales     |
| Jardiner?as Mat?as SL          | Herramientas |
| Agrojardin                     | Ornamentales |
| Agrojardin                     | Frutales     |
| Jardineria Sara                | Frutales     |
| Jardineria Sara                | Ornamentales |
| Jardineria Sara                | Arom?ticas   |
| Jardineria Sara                | Herramientas |
| Tutifruti S.A                  | Frutales     |
| Tutifruti S.A                  | Ornamentales |
| Flores S.L.                    | Frutales     |
| El Jardin Viviente S.L         | Frutales     |
| El Jardin Viviente S.L         | Ornamentales |
| El Jardin Viviente S.L         | Arom?ticas   |
| El Jardin Viviente S.L         | Herramientas |
+--------------------------------+--------------+

--27. Devuelve un listado que muestre solamente a los clientes que no han realizado ningún pago.
SELECT codigo_cliente, nombre_cliente from cliente where codigo_cliente NOT IN (SELECT codigo_cliente from pago);
+----------------+-----------------------------+
| codigo_cliente | nombre_cliente              |
+----------------+-----------------------------+
|              6 | Lasas S.A.                  |
|              8 | Club Golf Puerta del hierro |
|             10 | DaraDistribuciones          |
|             11 | Madrile?a de riegos         |
|             12 | Lasas S.A.                  |
|             17 | Flowers, S.A                |
|             18 | Naturajardin                |
|             20 | Americh Golf Management SL  |
|             21 | Aloha                       |
|             22 | El Prat                     |
|             24 | Vivero Humanes              |
|             25 | Fuenla City                 |
|             29 | Top Campo                   |
|             31 | Campohermoso                |
|             32 | france telecom              |
|             33 | Mus?e du Louvre             |
|             36 | Flores S.L.                 |
|             37 | The Magic Garden            |
+----------------+-----------------------------+

--28. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
SELECT codigo_cliente, nombre_cliente from cliente where codigo_cliente NOT IN(SELECT codigo_cliente from pedido);
+----------------+-----------------------------+
| codigo_cliente | nombre_cliente              |
+----------------+-----------------------------+
|              6 | Lasas S.A.                  |
|              8 | Club Golf Puerta del hierro |
|             10 | DaraDistribuciones          |
|             11 | Madrile?a de riegos         |
|             12 | Lasas S.A.                  |
|             17 | Flowers, S.A                |
|             18 | Naturajardin                |
|             20 | Americh Golf Management SL  |
|             21 | Aloha                       |
|             22 | El Prat                     |
|             24 | Vivero Humanes              |
|             25 | Fuenla City                 |
|             29 | Top Campo                   |
|             31 | Campohermoso                |
|             32 | france telecom              |
|             33 | Mus?e du Louvre             |
|             37 | The Magic Garden            |
+----------------+-----------------------------+

--29. Devuelve un listado que muestre los clientes que no han realizado ningún pago y 
--los que no han realizado ningún pedido.
SELECT codigo_cliente, nombre_cliente from cliente where codigo_cliente NOT IN(SELECT codigo_cliente from pago) AND codigo_cliente NOT IN(SELECT codigo_cliente from pedido);
+----------------+-----------------------------+
| codigo_cliente | nombre_cliente              |
+----------------+-----------------------------+
|              6 | Lasas S.A.                  |
|              8 | Club Golf Puerta del hierro |
|             10 | DaraDistribuciones          |
|             11 | Madrile?a de riegos         |
|             12 | Lasas S.A.                  |
|             17 | Flowers, S.A                |
|             18 | Naturajardin                |
|             20 | Americh Golf Management SL  |
|             21 | Aloha                       |
|             22 | El Prat                     |
|             24 | Vivero Humanes              |
|             25 | Fuenla City                 |
|             29 | Top Campo                   |
|             31 | Campohermoso                |
|             32 | france telecom              |
|             33 | Mus?e du Louvre             |
|             37 | The Magic Garden            |
+----------------+-----------------------------+

--30. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
SELECT codigo_empleado, nombre from empleado where codigo_oficina IS NULL;
--Empty set ya que todos tienen oficinas asociadas.


--31. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
SELECT codigo_empleado, nombre from empleado where codigo_empleado NOT IN(SELECT codigo_empleado_rep_ventas from cliente);
+-----------------+-------------+
| codigo_empleado | nombre      |
+-----------------+-------------+
|               1 | Marcos      |
|               2 | Ruben       |
|               3 | Alberto     |
|               4 | Maria       |
|               6 | Juan Carlos |
|               7 | Carlos      |
|              10 | Hilario     |
|              13 | David       |
|              14 | Oscar       |
|              15 | Francois    |
|              17 | Laurent     |
|              20 | Hilary      |
|              21 | Marcus      |
|              23 | Nei         |
|              24 | Narumi      |
|              25 | Takuma      |
|              26 | Amy         |
|              27 | Larry       |
|              28 | John        |
|              29 | Kevin       |
+-----------------+-------------+

--32. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los 
--que no tienen un cliente asociado.
SELECT codigo_empleado, nombre from empleado where codigo_empleado NOT IN(SELECT codigo_empleado_rep_ventas from cliente) and codigo_oficina is null;
--no hay empleados sin oficinas asociadas.

--33. Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT codigo_producto, nombre from producto where codigo_producto NOT IN(SELECT codigo_producto from detalle_pedido);
+-----------------+-------------------------------------------------------------+
| codigo_producto | nombre                                                      |
+-----------------+-------------------------------------------------------------+
| FR-104          | Olea-Olivos                                                 |
| FR-14           | Calamondin Mini                                             |
| FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| FR-24           | Albaricoquero Corbato                                       |
| FR-25           | Albaricoquero Moniqui                                       |
| FR-26           | Albaricoquero Kurrot                                        |
| FR-27           | Cerezo Burlat                                               |
| FR-28           | Cerezo Picota                                               |
| FR-30           | Ciruelo R. Claudia Verde                                    |
| FR-32           | Ciruelo Golden Japan                                        |
| FR-35           | Ciruelo Claudia Negra                                       |
| FR-38           | Higuera Verdal                                              |
| FR-39           | Higuera Breva                                               |
| FR-44           | Melocotonero Spring Crest                                   |
| FR-46           | Melocotonero Federica                                       |
| FR-49           | Parra Uva de Mesa                                           |
| FR-5            | Mandarino -Plant?n joven                                    |
| FR-50           | Peral Castell                                               |
| FR-51           | Peral Williams                                              |
| FR-52           | Peral Conference                                            |
| FR-55           | Olivo Cipresino                                             |
| FR-59           | Albaricoquero                                               |
| FR-61           | Albaricoquero                                               |
| FR-62           | Albaricoquero                                               |
| FR-63           | Cerezo                                                      |
| FR-65           | Cerezo                                                      |
| FR-68           | Cerezo                                                      |
| FR-70           | Ciruelo                                                     |
| FR-73           | Granado                                                     |
| FR-74           | Granado                                                     |
| FR-76           | Granado                                                     |
| FR-83           | Higuera                                                     |
| FR-88           | Manzano                                                     |
| FR-92           | Melocotonero                                                |
| FR-93           | Melocotonero                                                |
| FR-95           | Melocotonero                                                |
| FR-96           | Membrillero                                                 |
| FR-97           | Membrillero                                                 |
| FR-98           | Membrillero                                                 |
| FR-99           | Membrillero                                                 |
| OR-001          | Arbustos Mix Maceta                                         |
| OR-100          | Mimosa Injerto CLASICA Dealbata                             |
| OR-103          | Mimosa Semilla Bayleyana                                    |
| OR-105          | Mimosa Semilla Espectabilis                                 |
| OR-106          | Mimosa Semilla Longifolia                                   |
| OR-107          | Mimosa Semilla Floribunda 4 estaciones                      |
| OR-108          | Abelia Floribunda                                           |
| OR-109          | Callistemom (Mix)                                           |
| OR-110          | Callistemom (Mix)                                           |
| OR-111          | Corylus Avellana "Contorta"                                 |
| OR-112          | Escallonia (Mix)                                            |
| OR-113          | Evonimus Emerald Gayeti                                     |
| OR-114          | Evonimus Pulchellus                                         |
| OR-117          | Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |
| OR-118          | Hibiscus Syriacus "Pink Giant" Rosa                         |
| OR-121          | Lonicera Nitida "Maigrum"                                   |
| OR-124          | Prunus pisardii                                             |
| OR-126          | Weigelia "Bristol Ruby"                                     |
| OR-131          | Leptospermum formado PIRAMIDE                               |
| OR-132          | Leptospermum COPA                                           |
| OR-133          | Nerium oleander-CALIDAD "GARDEN"                            |
| OR-134          | Nerium Oleander Arbusto GRANDE                              |
| OR-135          | Nerium oleander COPA  Calibre 6/8                           |
| OR-137          | ROSAL TREPADOR                                              |
| OR-138          | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| OR-142          | Solanum Jazminoide                                          |
| OR-143          | Wisteria Sinensis  azul, rosa, blanca                       |
| OR-144          | Wisteria Sinensis INJERTADAS DEC?                           |
| OR-145          | Bougamvillea Sanderiana Tutor                               |
| OR-148          | Bougamvillea Sanderiana Espaldera                           |
| OR-149          | Bougamvillea Sanderiana Espaldera                           |
| OR-151          | Bougamvillea Sanderiana, 3 tut. piramide                    |
| OR-153          | Expositor ?rboles clima mediterr?neo                        |
| OR-154          | Expositor ?rboles borde del mar                             |
| OR-158          | Brachychiton Acerifolius                                    |
| OR-161          | Cassia Corimbosa                                            |
| OR-162          | Cassia Corimbosa                                            |
| OR-163          | Chitalpa Summer Bells                                       |
| OR-164          | Erytrina Kafra                                              |
| OR-166          | Eucalyptus Citriodora                                       |
| OR-167          | Eucalyptus Ficifolia                                        |
| OR-169          | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
| OR-170          | Lagunaria Patersonii                                        |
| OR-171          | Lagunaria Patersonii                                        |
| OR-173          | Morus Alba                                                  |
| OR-175          | Platanus Acerifolia                                         |
| OR-178          | Salix Babylonica  Pendula                                   |
| OR-180          | Tamarix  Ramosissima Pink Cascade                           |
| OR-182          | Tecoma Stands                                               |
| OR-183          | Tecoma Stands                                               |
| OR-184          | Tipuana Tipu                                                |
| OR-185          | Pleioblastus distichus-Bamb? enano                          |
| OR-187          | Sasa palmata                                                |
| OR-189          | Phylostachys aurea                                          |
| OR-190          | Phylostachys aurea                                          |
| OR-191          | Phylostachys Bambusa Spectabilis                            |
| OR-192          | Phylostachys biseti                                         |
| OR-194          | Pseudosasa japonica (Metake)                                |
| OR-195          | Pseudosasa japonica (Metake)                                |
| OR-197          | Cedrus Deodara "Feeling Blue" Novedad                       |
| OR-198          | Juniperus chinensis "Blue Alps"                             |
| OR-199          | Juniperus Chinensis Stricta                                 |
| OR-201          | Juniperus squamata "Blue Star"                              |
| OR-202          | Juniperus x media Phitzeriana verde                         |
| OR-212          | Bismarckia Nobilis                                          |
| OR-215          | Brahea Armata                                               |
| OR-216          | Brahea Edulis                                               |
| OR-219          | Butia Capitata                                              |
| OR-220          | Butia Capitata                                              |
| OR-221          | Butia Capitata                                              |
| OR-223          | Chamaerops Humilis                                          |
| OR-224          | Chamaerops Humilis                                          |
| OR-228          | Chamaerops Humilis "Cerifera"                               |
| OR-229          | Chrysalidocarpus Lutescens -ARECA                           |
| OR-230          | Cordyline Australis -DRACAENA                               |
| OR-231          | Cycas Revoluta                                              |
| OR-232          | Cycas Revoluta                                              |
| OR-233          | Dracaena Drago                                              |
| OR-235          | Dracaena Drago                                              |
| OR-238          | Livistonia Decipiens                                        |
| OR-239          | Livistonia Decipiens                                        |
| OR-242          | Rhaphis Excelsa                                             |
| OR-244          | Sabal Minor                                                 |
| OR-245          | Sabal Minor                                                 |
| OR-246          | Trachycarpus Fortunei                                       |
| OR-248          | Washingtonia Robusta                                        |
| OR-251          | Zamia Furfuracaea                                           |
+-----------------+-------------------------------------------------------------+

--34. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes
--de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

SELECT distinct codigo_oficina from oficina where codigo_oficina NOT IN(SELECT o.codigo_oficina from oficina o inner join empleado e on o.codigo_oficina = e.codigo_oficina inner join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas inner join pedido p on c.codigo_cliente = p.codigo_cliente inner join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido inner join producto pr on dp.codigo_producto = pr.codigo_producto where pr.gama like 'Frutales');
+----------------+
| codigo_oficina |
+----------------+
| LON-UK         |
| PAR-FR         |
| TOK-JP         |
+----------------+

--35. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
SELECT distinct c.codigo_cliente, c.nombre_cliente from cliente c inner join pedido p on c.codigo_cliente = p.codigo_cliente where c.codigo_cliente NOT IN(SELECT codigo_cliente from pago);
+----------------+----------------+
| codigo_cliente | nombre_cliente |
+----------------+----------------+
|             36 | Flores S.L.    |
+----------------+----------------+

--36. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el 
--nombre de su jefe asociado.
SELECT e.codigo_empleado, e.nombre, em.nombre as 'jefe' from empleado e inner join empleado em on e.codigo_jefe = em.codigo_empleado where e.codigo_empleado NOT IN(SELECT codigo_empleado_rep_ventas from cliente);
+-----------------+-------------+----------+
| codigo_empleado | nombre      | jefe     |
+-----------------+-------------+----------+
|               2 | Ruben       | Marcos   |
|               3 | Alberto     | Ruben    |
|               4 | Maria       | Ruben    |
|               6 | Juan Carlos | Alberto  |
|               7 | Carlos      | Alberto  |
|              10 | Hilario     | Carlos   |
|              13 | David       | Emmanuel |
|              14 | Oscar       | Emmanuel |
|              15 | Francois    | Alberto  |
|              17 | Laurent     | Francois |
|              20 | Hilary      | Alberto  |
|              21 | Marcus      | Hilary   |
|              23 | Nei         | Alberto  |
|              24 | Narumi      | Nei      |
|              25 | Takuma      | Nei      |
|              26 | Amy         | Alberto  |
|              27 | Larry       | Amy      |
|              28 | John        | Amy      |
|              29 | Kevin       | Alberto  |
+-----------------+-------------+----------+

--37. ¿Cuántos empleados hay en la compañía?
SELECT count(codigo_empleado) as 'cantidad de empleados' from empleado;
+-----------------------+
| cantidad de empleados |
+-----------------------+
|                    31 |
+-----------------------+

--38. ¿Cuántos clientes tiene cada país?
SELECT pais, count(codigo_cliente) as 'cantidad de clientes' from cliente group by pais;
+----------------+----------------------+
| pais           | cantidad de clientes |
+----------------+----------------------+
| Australia      |                    2 |
| France         |                    2 |
| Spain          |                   27 |
| United Kingdom |                    1 |
| USA            |                    4 |
+----------------+----------------------+

--39. ¿Cuál fue el pago medio en 2009?
SELECT avg(total) AS 'pago medio' from pago where YEAR(fecha_pago) = 2009;
+-------------+
| pago medio  |
+-------------+
| 4504.076923 |
+-------------+

--40. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
SELECT estado, count(codigo_pedido) from pedido group by estado order by count(codigo_pedido) desc;
+-----------+----------------------+
| estado    | count(codigo_pedido) |
+-----------+----------------------+
| Entregado |                   61 |
| Pendiente |                   30 |
| Rechazado |                   24 |
+-----------+----------------------+

--41. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
SELECT MIN(precio_venta) 'precio minimo', MAX(precio_venta) 'precio maximo' from producto;
+---------------+---------------+
| precio minimo | precio maximo |
+---------------+---------------+
|          1.00 |        462.00 |
+---------------+---------------+

--42. Calcula el número de clientes que tiene la empresa.
SELECT count(codigo_cliente) 'cant clientes' from cliente;
+---------------+
| cant clientes |
+---------------+
|            36 |
+---------------+

--43. ¿Cuántos clientes tiene la ciudad de Madrid?
SELECT count(codigo_cliente) 'clientes en madrid' from cliente where ciudad like 'Madrid';
+--------------------+
| clientes en madrid |
+--------------------+
|                 11 |
+--------------------+

--44. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
SELECT count(codigo_cliente) as 'cant clientes ', ciudad from cliente where ciudad like 'M%' group by ciudad;
+----------------+----------------------+
| cant clientes  | ciudad               |
+----------------+----------------------+
|             11 | Madrid               |
|              2 | Miami                |
|              1 | Montornes del valles |
+----------------+----------------------+

--45. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
SELECT e.nombre, count(c.codigo_cliente) 'cant clientes' from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado group by e.codigo_empleado;
+-----------------+---------------+
| nombre          | cant clientes |
+-----------------+---------------+
| Felipe          |             5 |
| Mariano         |             4 |
| Lucio           |             2 |
| Emmanuel        |             5 |
| Jos? Manuel     |             5 |
| Lionel          |             2 |
| Michael         |             2 |
| Walter Santiago |             2 |
| Lorena          |             2 |
| Julian          |             5 |
| Mariko          |             2 |
+-----------------+---------------+

--46. Calcula el número de clientes que no tiene asignado representante de ventas.
SELECT count(codigo_cliente) as 'cant clientes' from cliente where codigo_empleado_rep_ventas IS NULL;
+---------------+
| cant clientes |
+---------------+
|             0 |
+---------------+

--47. Calcula la fecha del primer y último pago realizado por cada uno de los clientes.
--El listado deberá mostrar el nombre y los apellidos de cada cliente.
SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, min(p.fecha_pago) as 'primer pago', max(p.fecha_pago) as 'ultimo pago' from cliente c inner join pago p on c.codigo_cliente = p.codigo_cliente group by c.nombre_cliente;
+--------------------------------+-------------------+-------------+-------------+
| nombre_cliente                 | apellido_contacto | primer pago | ultimo pago |
+--------------------------------+-------------------+-------------+-------------+
| Agrojardin                     | Lopez             | 2009-01-13  | 2009-01-13  |
| Beragua                        | Bermejo           | 2009-01-13  | 2009-01-13  |
| Camunas Jardines S.L.          | Camunas           | 2008-08-04  | 2008-08-04  |
| Dardena S.A.                   | Rodriguez         | 2008-07-15  | 2008-07-15  |
| El Jardin Viviente S.L         | Smith             | 2006-05-26  | 2006-05-26  |
| Flores Marivi                  | Rodriguez         | 2009-02-16  | 2009-02-16  |
| Gardening Associates           | Wright            | 2009-01-16  | 2009-02-19  |
| Gerudo Valley                  | Flaute            | 2007-01-08  | 2007-01-08  |
| GoldFish Garden                | GoldFish          | 2008-11-10  | 2008-12-10  |
| Golf S.A.                      | Martinez          | 2009-03-06  | 2009-03-06  |
| Jardin de Flores               | Villar            | 2009-01-15  | 2009-02-15  |
| Jardiner?as Mat?as SL          | San Mart?n        | 2009-02-08  | 2009-02-08  |
| Jardineria Sara                | Marquez           | 2009-01-16  | 2009-01-16  |
| Jardines y Mansiones Cactus SL | S?nchez           | 2008-03-18  | 2008-03-18  |
| Naturagua                      | Rengifo           | 2009-01-06  | 2009-01-06  |
| Sotogrande                     | Santillana        | 2009-03-26  | 2009-03-26  |
| Tendo Garden                   | Tendo             | 2006-01-18  | 2006-01-18  |
| Tutifruti S.A                  | Jones             | 2007-10-06  | 2007-10-06  |
+--------------------------------+-------------------+-------------+-------------+

--48. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
SELECT distinct codigo_pedido, count(codigo_producto) as 'cant productos diferentes' from detalle_pedido group by codigo_pedido;
+---------------+---------------------------+
| codigo_pedido | cant productos diferentes |
+---------------+---------------------------+
|             1 |                         5 |
|             2 |                         6 |
|             3 |                         6 |
|             4 |                         8 |
|             8 |                         3 |
|             9 |                         4 |
|            10 |                         3 |
|            11 |                         2 |
|            12 |                         1 |
|            13 |                         3 |
|            14 |                         2 |
|            15 |                         4 |
|            16 |                         2 |
|            17 |                         5 |
|            18 |                         3 |
|            19 |                         5 |
|            20 |                         2 |
|            21 |                         3 |
|            22 |                         1 |
|            23 |                         4 |
|            24 |                         4 |
|            25 |                         3 |
|            26 |                         3 |
|            27 |                         3 |
|            28 |                         3 |
|            29 |                         5 |
|            30 |                         6 |
|            31 |                         2 |
|            32 |                         5 |
|            33 |                         4 |
|            34 |                         3 |
|            35 |                         5 |
|            36 |                         5 |
|            37 |                         3 |
|            38 |                         2 |
|            39 |                         2 |
|            40 |                         2 |
|            41 |                         2 |
|            42 |                         2 |
|            43 |                         1 |
|            44 |                         1 |
|            45 |                         2 |
|            46 |                         2 |
|            47 |                         2 |
|            48 |                         5 |
|            49 |                         3 |
|            50 |                         3 |
|            51 |                         3 |
|            52 |                         1 |
|            53 |                         3 |
|            54 |                         7 |
|            55 |                         5 |
|            56 |                         6 |
|            57 |                         4 |
|            58 |                         4 |
|            59 |                         1 |
|            60 |                         1 |
|            61 |                         1 |
|            62 |                         1 |
|            63 |                         1 |
|            64 |                         1 |
|            65 |                         1 |
|            66 |                         1 |
|            67 |                         1 |
|            68 |                         1 |
|            74 |                         3 |
|            75 |                         3 |
|            76 |                         5 |
|            77 |                         2 |
|            78 |                         4 |
|            79 |                         1 |
|            80 |                         3 |
|            81 |                         1 |
|            82 |                         1 |
|            83 |                         1 |
|            89 |                         5 |
|            90 |                         3 |
|            91 |                         3 |
|            92 |                         3 |
|            93 |                         3 |
|            94 |                         2 |
|            95 |                         3 |
|            96 |                         4 |
|            97 |                         3 |
|            98 |                         5 |
|            99 |                         2 |
|           100 |                         2 |
|           101 |                         2 |
|           102 |                         2 |
|           103 |                         2 |
|           104 |                         2 |
|           105 |                         2 |
|           106 |                         2 |
|           107 |                         2 |
|           108 |                         2 |
|           109 |                         7 |
|           110 |                         3 |
|           111 |                         1 |
|           112 |                         1 |
|           113 |                         1 |
|           114 |                         1 |
|           115 |                         1 |
|           116 |                         5 |
|           117 |                         4 |
|           118 |                         1 |
|           119 |                         1 |
|           120 |                         1 |
|           121 |                         1 |
|           122 |                         1 |
|           123 |                         1 |
|           124 |                         1 |
|           125 |                         1 |
|           126 |                         1 |
|           127 |                         1 |
|           128 |                         2 |
+---------------+---------------------------+

--49. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
SELECT codigo_pedido, sum(cantidad) 'suma de los prods por pedido' from detalle_pedido group by codigo_pedido;
+---------------+------------------------------+
| codigo_pedido | suma de los prods por pedido |
+---------------+------------------------------+
|             1 |                          113 |
|             2 |                          161 |
|             3 |                          232 |
|             4 |                          179 |
|             8 |                           14 |
|             9 |                          625 |
|            10 |                           40 |
|            11 |                          260 |
|            12 |                          290 |
|            13 |                           22 |
|            14 |                           21 |
|            15 |                           21 |
|            16 |                           22 |
|            17 |                           25 |
|            18 |                           16 |
|            19 |                           41 |
|            20 |                           22 |
|            21 |                           30 |
|            22 |                            1 |
|            23 |                          194 |
|            24 |                           19 |
|            25 |                           29 |
|            26 |                           27 |
|            27 |                           84 |
|            28 |                           12 |
|            29 |                           40 |
|            30 |                           33 |
|            31 |                           26 |
|            32 |                           40 |
|            33 |                          905 |
|            34 |                           56 |
|            35 |                          178 |
|            36 |                           28 |
|            37 |                          245 |
|            38 |                            7 |
|            39 |                            9 |
|            40 |                           12 |
|            41 |                           10 |
|            42 |                            4 |
|            43 |                            9 |
|            44 |                            5 |
|            45 |                           10 |
|            46 |                           12 |
|            47 |                           14 |
|            48 |                          147 |
|            49 |                           65 |
|            50 |                           71 |
|            51 |                          200 |
|            52 |                           10 |
|            53 |                            9 |
|            54 |                           69 |
|            55 |                           20 |
|            56 |                           22 |
|            57 |                           17 |
|            58 |                          364 |
|            59 |                           10 |
|            60 |                           10 |
|            61 |                           10 |
|            62 |                           10 |
|            63 |                           10 |
|            64 |                           10 |
|            65 |                           10 |
|            66 |                           10 |
|            67 |                           10 |
|            68 |                           10 |
|            74 |                           91 |
|            75 |                          130 |
|            76 |                          374 |
|            77 |                           49 |
|            78 |                          153 |
|            79 |                           50 |
|            80 |                          162 |
|            81 |                           30 |
|            82 |                           34 |
|            83 |                           30 |
|            89 |                           32 |
|            90 |                           41 |
|            91 |                          101 |
|            92 |                           62 |
|            93 |                           79 |
|            94 |                           45 |
|            95 |                           20 |
|            96 |                           36 |
|            97 |                           36 |
|            98 |                           62 |
|            99 |                           45 |
|           100 |                           60 |
|           101 |                          209 |
|           102 |                           55 |
|           103 |                           64 |
|           104 |                          122 |
|           105 |                           48 |
|           106 |                          278 |
|           107 |                          158 |
|           108 |                          112 |
|           109 |                           69 |
|           110 |                           21 |
|           111 |                           10 |
|           112 |                           10 |
|           113 |                           10 |
|           114 |                           10 |
|           115 |                           10 |
|           116 |                           78 |
|           117 |                           24 |
|           118 |                           10 |
|           119 |                           10 |
|           120 |                           10 |
|           121 |                           10 |
|           122 |                           10 |
|           123 |                           10 |
|           124 |                           10 |
|           125 |                           10 |
|           126 |                           10 |
|           127 |                           10 |
|           128 |                           33 |
+---------------+------------------------------+
SELECT sum(cantidad) as 'suma total de prods' from detalle_pedido;
+---------------------+
| suma total de prods |
+---------------------+
|                8380 |
+---------------------+

--50. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que
--se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
SELECT codigo_producto, sum(cantidad) from detalle_pedido group by codigo_producto order by sum(cantidad) desc limit 20;
+-----------------+---------------+
| codigo_producto | sum(cantidad) |
+-----------------+---------------+
| AR-009          |           961 |
| AR-008          |           455 |
| FR-17           |           423 |
| AR-006          |           291 |
| FR-67           |           285 |
| OR-247          |           279 |
| OR-157          |           262 |
| OR-227          |           236 |
| OR-208          |           221 |
| 30310           |           220 |
| OR-214          |           212 |
| FR-57           |           203 |
| OR-177          |           150 |
| AR-001          |           135 |
| FR-11           |           131 |
| AR-002          |           128 |
| OR-136          |           127 |
| FR-29           |           120 |
| FR-48           |           120 |
| FR-100          |           114 |
+-----------------+---------------+

--51. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible,
--el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el
--número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, 
--y el total la suma de los dos campos anteriores.
SELECT (sum(cantidad) * precio_unidad) as 'base imponible', ((sum(cantidad) * precio_unidad) * 1.21) as 'IVA', (((sum(cantidad) * precio_unidad)) + (sum(cantidad) * precio_unidad) * 1.21) as 'total facturado' from detalle_pedido;
+----------------+-------------+-----------------+
| base imponible | IVA         | total facturado |
+----------------+-------------+-----------------+
|      586600.00 | 709786.0000 |    1296386.0000 |
+----------------+-------------+-----------------+

--52. La misma información que en la pregunta anterior, pero agrupada por código de producto.

SELECT codigo_producto, (sum(cantidad) * precio_unidad) as 'base imponible', ((sum(cantidad) * precio_unidad) * 1.21) as 'IVA', (((sum(cantidad) * precio_unidad)) + (sum(cantidad) * precio_unidad) * 1.21) as 'total facturado' from detalle_pedido group by codigo_producto; 
+-----------------+----------------+-------------+-----------------+
| codigo_producto | base imponible | IVA         | total facturado |
+-----------------+----------------+-------------+-----------------+
| 11679           |         630.00 |    762.3000 |       1392.3000 |
| 21636           |         560.00 |    677.6000 |       1237.6000 |
| 22225           |         984.00 |   1190.6400 |       2174.6400 |
| 30310           |        2640.00 |   3194.4000 |       5834.4000 |
| AR-001          |         135.00 |    163.3500 |        298.3500 |
| AR-002          |         128.00 |    154.8800 |        282.8800 |
| AR-003          |          17.00 |     20.5700 |         37.5700 |
| AR-004          |          30.00 |     36.3000 |         66.3000 |
| AR-005          |          21.00 |     25.4100 |         46.4100 |
| AR-006          |         291.00 |    352.1100 |        643.1100 |
| AR-007          |           9.00 |     10.8900 |         19.8900 |
| AR-008          |         455.00 |    550.5500 |       1005.5500 |
| AR-009          |         961.00 |   1162.8100 |       2123.8100 |
| AR-010          |          10.00 |     12.1000 |         22.1000 |
| FR-1            |         168.00 |    203.2800 |        371.2800 |
| FR-10           |         119.00 |    143.9900 |        262.9900 |
| FR-100          |        1254.00 |   1517.3400 |       2771.3400 |
| FR-101          |         247.00 |    298.8700 |        545.8700 |
| FR-102          |         740.00 |    895.4000 |       1635.4000 |
| FR-103          |          25.00 |     30.2500 |         55.2500 |
| FR-105          |         280.00 |    338.8000 |        618.8000 |
| FR-106          |         913.00 |   1104.7300 |       2017.7300 |
| FR-107          |        1100.00 |   1331.0000 |       2431.0000 |
| FR-108          |         576.00 |    696.9600 |       1272.9600 |
| FR-11           |       13100.00 |  15851.0000 |      28951.0000 |
| FR-12           |         608.00 |    735.6800 |       1343.6800 |
| FR-13           |         741.00 |    896.6100 |       1637.6100 |
| FR-15           |         225.00 |    272.2500 |        497.2500 |
| FR-16           |          45.00 |     54.4500 |         99.4500 |
| FR-17           |         846.00 |   1023.6600 |       1869.6600 |
| FR-18           |         108.00 |    130.6800 |        238.6800 |
| FR-22           |          40.00 |     48.4000 |         88.4000 |
| FR-23           |          64.00 |     77.4400 |        141.4400 |
| FR-29           |         960.00 |   1161.6000 |       2121.6000 |
| FR-31           |          96.00 |    116.1600 |        212.1600 |
| FR-33           |         216.00 |    261.3600 |        477.3600 |
| FR-34           |         336.00 |    406.5600 |        742.5600 |
| FR-36           |         621.00 |    751.4100 |       1372.4100 |
| FR-37           |          45.00 |     54.4500 |         99.4500 |
| FR-40           |         392.00 |    474.3200 |        866.3200 |
| FR-41           |          96.00 |    116.1600 |        212.1600 |
| FR-42           |          96.00 |    116.1600 |        212.1600 |
| FR-43           |          48.00 |     58.0800 |        106.0800 |
| FR-45           |         112.00 |    135.5200 |        247.5200 |
| FR-47           |         440.00 |    532.4000 |        972.4000 |
| FR-48           |        1080.00 |   1306.8000 |       2386.8000 |
| FR-53           |         744.00 |    900.2400 |       1644.2400 |
| FR-54           |         351.00 |    424.7100 |        775.7100 |
| FR-56           |         128.00 |    154.8800 |        282.8800 |
| FR-57           |        1624.00 |   1965.0400 |       3589.0400 |
| FR-58           |         561.00 |    678.8100 |       1239.8100 |
| FR-6            |         112.00 |    135.5200 |        247.5200 |
| FR-60           |         352.00 |    425.9200 |        777.9200 |
| FR-64           |         110.00 |    133.1000 |        243.1000 |
| FR-66           |         245.00 |    296.4500 |        541.4500 |
| FR-67           |       19950.00 |  24139.5000 |      44089.5000 |
| FR-69           |        1911.00 |   2312.3100 |       4223.3100 |
| FR-7            |         348.00 |    421.0800 |        769.0800 |
| FR-71           |         220.00 |    266.2000 |        486.2000 |
| FR-72           |         124.00 |    150.0400 |        274.0400 |
| FR-75           |         224.00 |    271.0400 |        495.0400 |
| FR-77           |        1035.00 |   1252.3500 |       2287.3500 |
| FR-78           |          30.00 |     36.3000 |         66.3000 |
| FR-79           |         946.00 |   1144.6600 |       2090.6600 |
| FR-8            |         108.00 |    130.6800 |        238.6800 |
| FR-80           |          32.00 |     38.7200 |         70.7200 |
| FR-81           |         147.00 |    177.8700 |        324.8700 |
| FR-82           |         980.00 |   1185.8000 |       2165.8000 |
| FR-84           |         143.00 |    173.0300 |        316.0300 |
| FR-85           |        5320.00 |   6437.2000 |      11757.2000 |
| FR-86           |          22.00 |     26.6200 |         48.6200 |
| FR-87           |        1584.00 |   1916.6400 |       3500.6400 |
| FR-89           |         450.00 |    544.5000 |        994.5000 |
| FR-9            |         240.00 |    290.4000 |        530.4000 |
| FR-90           |         280.00 |    338.8000 |        618.8000 |
| FR-91           |        2250.00 |   2722.5000 |       4972.5000 |
| FR-94           |        3330.00 |   4029.3000 |       7359.3000 |
| OR-101          |         144.00 |    174.2400 |        318.2400 |
| OR-102          |         522.00 |    631.6200 |       1153.6200 |
| OR-104          |         200.00 |    242.0000 |        442.0000 |
| OR-115          |          63.00 |     76.2300 |        139.2300 |
| OR-116          |          98.00 |    118.5800 |        216.5800 |
| OR-119          |          50.00 |     60.5000 |        110.5000 |
| OR-120          |          25.00 |     30.2500 |         55.2500 |
| OR-122          |         160.00 |    193.6000 |        353.6000 |
| OR-123          |          70.00 |     84.7000 |        154.7000 |
| OR-125          |          15.00 |     18.1500 |         33.1500 |
| OR-127          |         160.00 |    193.6000 |        353.6000 |
| OR-128          |        2900.00 |   3509.0000 |       6409.0000 |
| OR-129          |         333.00 |    402.9300 |        735.9300 |
| OR-130          |         216.00 |    261.3600 |        477.3600 |
| OR-136          |        2286.00 |   2766.0600 |       5052.0600 |
| OR-139          |         320.00 |    387.2000 |        707.2000 |
| OR-140          |         200.00 |    242.0000 |        442.0000 |
| OR-141          |         180.00 |    217.8000 |        397.8000 |
| OR-146          |          68.00 |     82.2800 |        150.2800 |
| OR-147          |          42.00 |     50.8200 |         92.8200 |
| OR-150          |          36.00 |     43.5600 |         79.5600 |
| OR-152          |          18.00 |     21.7800 |         39.7800 |
| OR-155          |          24.00 |     29.0400 |         53.0400 |
| OR-156          |         297.00 |    359.3700 |        656.3700 |
| OR-157          |        2620.00 |   3170.2000 |       5790.2000 |
| OR-159          |         132.00 |    159.7200 |        291.7200 |
| OR-160          |          90.00 |    108.9000 |        198.9000 |
| OR-165          |          30.00 |     36.3000 |         66.3000 |
| OR-168          |          20.00 |     24.2000 |         44.2000 |
| OR-172          |        1602.00 |   1938.4200 |       3540.4200 |
| OR-174          |         432.00 |    522.7200 |        954.7200 |
| OR-176          |         380.00 |    459.8000 |        839.8000 |
| OR-177          |        2250.00 |   2722.5000 |       4972.5000 |
| OR-179          |          30.00 |     36.3000 |         66.3000 |
| OR-181          |         360.00 |    435.6000 |        795.6000 |
| OR-186          |         240.00 |    290.4000 |        530.4000 |
| OR-188          |         100.00 |    121.0000 |        221.0000 |
| OR-193          |         100.00 |    121.0000 |        221.0000 |
| OR-196          |         280.00 |    338.8000 |        618.8000 |
| OR-200          |          40.00 |     48.4000 |         88.4000 |
| OR-203          |         100.00 |    121.0000 |        221.0000 |
| OR-204          |         500.00 |    605.0000 |       1105.0000 |
| OR-205          |         100.00 |    121.0000 |        221.0000 |
| OR-206          |          25.00 |     30.2500 |         55.2500 |
| OR-207          |          16.00 |     19.3600 |         35.3600 |
| OR-208          |         884.00 |   1069.6400 |       1953.6400 |
| OR-209          |         500.00 |    605.0000 |       1105.0000 |
| OR-210          |        3120.00 |   3775.2000 |       6895.2000 |
| OR-211          |        4130.00 |   4997.3000 |       9127.3000 |
| OR-213          |        9310.00 |  11265.1000 |      20575.1000 |
| OR-214          |        2120.00 |   2565.2000 |       4685.2000 |
| OR-217          |         975.00 |   1179.7500 |       2154.7500 |
| OR-218          |         950.00 |   1149.5000 |       2099.5000 |
| OR-222          |        1239.00 |   1499.1900 |       2738.1900 |
| OR-225          |         840.00 |   1016.4000 |       1856.4000 |
| OR-226          |         570.00 |    689.7000 |       1259.7000 |
| OR-227          |       15104.00 |  18275.8400 |      33379.8400 |
| OR-234          |        3520.00 |   4259.2000 |       7779.2000 |
| OR-236          |        2205.00 |   2668.0500 |       4873.0500 |
| OR-237          |         950.00 |   1149.5000 |       2099.5000 |
| OR-240          |         468.00 |    566.2800 |       1034.2800 |
| OR-241          |         475.00 |    574.7500 |       1049.7500 |
| OR-243          |         128.00 |    154.8800 |        282.8800 |
| OR-247          |      128898.00 | 155966.5800 |     284864.5800 |
| OR-249          |         150.00 |    181.5000 |        331.5000 |
| OR-250          |          30.00 |     36.3000 |         66.3000 |
| OR-99           |         532.00 |    643.7200 |       1175.7200 |
+-----------------+----------------+-------------+-----------------+

53. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen
por OR.
SELECT codigo_producto, (sum(cantidad) * precio_unidad) as 'base imponible', ((sum(cantidad) * precio_unidad) * 1.21) as 'IVA', (((sum(cantidad) * precio_unidad)) + (sum(cantidad) * precio_unidad) * 1.21) as 'total facturado' from detalle_pedido where codigo_producto like 'OR%' group by codigo_producto; 
+-----------------+----------------+-------------+-----------------+
| codigo_producto | base imponible | IVA         | total facturado |
+-----------------+----------------+-------------+-----------------+
| OR-101          |         144.00 |    174.2400 |        318.2400 |
| OR-102          |         522.00 |    631.6200 |       1153.6200 |
| OR-104          |         200.00 |    242.0000 |        442.0000 |
| OR-115          |          63.00 |     76.2300 |        139.2300 |
| OR-116          |          98.00 |    118.5800 |        216.5800 |
| OR-119          |          50.00 |     60.5000 |        110.5000 |
| OR-120          |          25.00 |     30.2500 |         55.2500 |
| OR-122          |         160.00 |    193.6000 |        353.6000 |
| OR-123          |          70.00 |     84.7000 |        154.7000 |
| OR-125          |          15.00 |     18.1500 |         33.1500 |
| OR-127          |         160.00 |    193.6000 |        353.6000 |
| OR-128          |        2900.00 |   3509.0000 |       6409.0000 |
| OR-129          |         333.00 |    402.9300 |        735.9300 |
| OR-130          |         216.00 |    261.3600 |        477.3600 |
| OR-136          |        2286.00 |   2766.0600 |       5052.0600 |
| OR-139          |         320.00 |    387.2000 |        707.2000 |
| OR-140          |         200.00 |    242.0000 |        442.0000 |
| OR-141          |         180.00 |    217.8000 |        397.8000 |
| OR-146          |          68.00 |     82.2800 |        150.2800 |
| OR-147          |          42.00 |     50.8200 |         92.8200 |
| OR-150          |          36.00 |     43.5600 |         79.5600 |
| OR-152          |          18.00 |     21.7800 |         39.7800 |
| OR-155          |          24.00 |     29.0400 |         53.0400 |
| OR-156          |         297.00 |    359.3700 |        656.3700 |
| OR-157          |        2620.00 |   3170.2000 |       5790.2000 |
| OR-159          |         132.00 |    159.7200 |        291.7200 |
| OR-160          |          90.00 |    108.9000 |        198.9000 |
| OR-165          |          30.00 |     36.3000 |         66.3000 |
| OR-168          |          20.00 |     24.2000 |         44.2000 |
| OR-172          |        1602.00 |   1938.4200 |       3540.4200 |
| OR-174          |         432.00 |    522.7200 |        954.7200 |
| OR-176          |         380.00 |    459.8000 |        839.8000 |
| OR-177          |        2250.00 |   2722.5000 |       4972.5000 |
| OR-179          |          30.00 |     36.3000 |         66.3000 |
| OR-181          |         360.00 |    435.6000 |        795.6000 |
| OR-186          |         240.00 |    290.4000 |        530.4000 |
| OR-188          |         100.00 |    121.0000 |        221.0000 |
| OR-193          |         100.00 |    121.0000 |        221.0000 |
| OR-196          |         280.00 |    338.8000 |        618.8000 |
| OR-200          |          40.00 |     48.4000 |         88.4000 |
| OR-203          |         100.00 |    121.0000 |        221.0000 |
| OR-204          |         500.00 |    605.0000 |       1105.0000 |
| OR-205          |         100.00 |    121.0000 |        221.0000 |
| OR-206          |          25.00 |     30.2500 |         55.2500 |
| OR-207          |          16.00 |     19.3600 |         35.3600 |
| OR-208          |         884.00 |   1069.6400 |       1953.6400 |
| OR-209          |         500.00 |    605.0000 |       1105.0000 |
| OR-210          |        3120.00 |   3775.2000 |       6895.2000 |
| OR-211          |        4130.00 |   4997.3000 |       9127.3000 |
| OR-213          |        9310.00 |  11265.1000 |      20575.1000 |
| OR-214          |        2120.00 |   2565.2000 |       4685.2000 |
| OR-217          |         975.00 |   1179.7500 |       2154.7500 |
| OR-218          |         950.00 |   1149.5000 |       2099.5000 |
| OR-222          |        1239.00 |   1499.1900 |       2738.1900 |
| OR-225          |         840.00 |   1016.4000 |       1856.4000 |
| OR-226          |         570.00 |    689.7000 |       1259.7000 |
| OR-227          |       15104.00 |  18275.8400 |      33379.8400 |
| OR-234          |        3520.00 |   4259.2000 |       7779.2000 |
| OR-236          |        2205.00 |   2668.0500 |       4873.0500 |
| OR-237          |         950.00 |   1149.5000 |       2099.5000 |
| OR-240          |         468.00 |    566.2800 |       1034.2800 |
| OR-241          |         475.00 |    574.7500 |       1049.7500 |
| OR-243          |         128.00 |    154.8800 |        282.8800 |
| OR-247          |      128898.00 | 155966.5800 |     284864.5800 |
| OR-249          |         150.00 |    181.5000 |        331.5000 |
| OR-250          |          30.00 |     36.3000 |         66.3000 |
| OR-99           |         532.00 |    643.7200 |       1175.7200 |
+-----------------+----------------+-------------+-----------------+

--54. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, 
--unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
SET @Imponible = (select sum(cantidad) * precio_unidad from detalle_pedido);
SET @IVA = (@Imponible * 1.21);
SET @Total = (@Imponible + @IVA);
select @Total;
SELECT 
  p.nombre AS "Producto", 
  SUM(dp.cantidad) AS "Unidades Vendidas", 
  SUM(dp.cantidad * dp.precio_unidad) AS "Total Facturado",
  SUM(dp.cantidad * dp.precio_unidad) * 1.21 AS "Total Con Impuestos"
FROM detalle_pedido dp
JOIN producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY dp.codigo_producto
HAVING SUM(dp.cantidad * dp.precio_unidad) > 3000;

--55. Devuelve el nombre del cliente con mayor límite de crédito.
SELECT nombre_cliente, limite_credito from cliente order by limite_credito desc limit 1; 
+----------------+----------------+
| nombre_cliente | limite_credito |
+----------------+----------------+
| Tendo Garden   |      600000.00 |
+----------------+----------------+
SELECT nombre_cliente, limite_credito from cliente where limite_credito = (SELECT MAX(limite_credito) from cliente);
+----------------+----------------+
| nombre_cliente | limite_credito |
+----------------+----------------+
| Tendo Garden   |      600000.00 |
+----------------+----------------+


--56. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT nombre, precio_venta from producto order by precio_venta desc limit 1;
SELECT nombre, precio_venta from producto where precio_venta = (SELECT MAX(precio_venta) from producto);
+-----------------------+--------------+
| nombre                | precio_venta |
+-----------------------+--------------+
| Trachycarpus Fortunei |       462.00 |
+-----------------------+--------------+

--57. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que
--tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de 
--los datos de la tabla detalle_pedido. Una vez que sepa cuál es el código del producto, puede obtener 
--su nombre fácilmente.)

SELECT codigo_producto, sum(cantidad) from detalle_pedido group by codigo_producto having sum(cantidad) = (SELECT MAX(suma) from (SELECT codigo_producto, sum(cantidad) "suma" from detalle_pedido group by codigo_producto) as sub);
+-----------------+---------------+
| codigo_producto | sum(cantidad) |
+-----------------+---------------+
| AR-009          |           961 |
+-----------------+---------------+

--58. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. 
--(Sin utilizar INNER JOIN).
SELECT p.codigo_cliente, c.limite_credito, sum(p.total) from cliente c, pago p where c.codigo_cliente = p.codigo_cliente group by p.codigo_cliente having sum(p.total) < c.limite_credito;
+----------------+----------------+--------------+
| codigo_cliente | limite_credito | sum(p.total) |
+----------------+----------------+--------------+
|              5 |      600000.00 |     23794.00 |
|              7 |       20000.00 |      2390.00 |
|              9 |       32000.00 |       929.00 |
|             13 |       16481.00 |      2246.00 |
|             14 |      321000.00 |      4160.00 |
|             15 |       40000.00 |     12081.00 |
|             19 |       30000.00 |       232.00 |
|             23 |       60000.00 |       272.00 |
|             26 |       76000.00 |     18846.00 |
|             27 |      100500.00 |     10972.00 |
|             35 |       10000.00 |      3321.00 |
|             38 |        8000.00 |      1171.00 |
+----------------+----------------+--------------+

--59. Devuelve el producto que más unidades tiene en stock.
SELECT nombre, cantidad_en_stock from producto where cantidad_en_stock = (SELECT MAX(cantidad_en_stock) from producto);
+---------------------------------+-------------------+
| nombre                          | cantidad_en_stock |
+---------------------------------+-------------------+
| Rosal copa                      |               400 |
| Albaricoquero Corbato           |               400 |
| Albaricoquero Moniqui           |               400 |
| Albaricoquero Kurrot            |               400 |
| Cerezo Burlat                   |               400 |
| Cerezo Picota                   |               400 |
| Cerezo Napole?n                 |               400 |
| Ciruelo R. Claudia Verde        |               400 |
| Ciruelo Santa Rosa              |               400 |
| Ciruelo Golden Japan            |               400 |
| Ciruelo Friar                   |               400 |
| Ciruelo Reina C. De Ollins      |               400 |
| Ciruelo Claudia Negra           |               400 |
| Granado Mollar de Elche         |               400 |
| Higuera Napolitana              |               400 |
| Higuera Verdal                  |               400 |
| Higuera Breva                   |               400 |
| Manzano Starking Delicious      |               400 |
| Manzano Reineta                 |               400 |
| Manzano Golden Delicious        |               400 |
| Membrillero Gigante de Wranja   |               400 |
| Melocotonero Spring Crest       |               400 |
| Melocotonero Amarillo de Agosto |               400 |
| Melocotonero Federica           |               400 |
| Melocotonero Paraguayo          |               400 |
| Nogal Com?n                     |               400 |
| Parra Uva de Mesa               |               400 |
| Peral Castell                   |               400 |
| Peral Williams                  |               400 |
| Peral Conference                |               400 |
| Peral Blanq. de Aranjuez        |               400 |
| N?spero Tanaca                  |               400 |
| Olivo Cipresino                 |               400 |
| Nectarina                       |               400 |
| Kaki Rojo Brillante             |               400 |
+---------------------------------+-------------------+

--60. Devuelve el producto que menos unidades tiene en stock.
SELECT nombre, cantidad_en_stock from producto where cantidad_en_stock = (SELECT MIN(cantidad_en_stock) from producto);
+---------------+-------------------+
| nombre        | cantidad_en_stock |
+---------------+-------------------+
| Brahea Armata |                 0 |
+---------------+-------------------+

--61. Listar los nombres de los clientes que tienen asignado el representante Lorena Pauxton
--(suponiendo que no pueden haber representantes con el mismo nombre).
SELECT c.nombre_cliente, e.nombre, e.apellido1 from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado where e.nombre like 'Lorena' and e.apellido1 like 'Paxton';
+----------------+--------+-----------+
| nombre_cliente | nombre | apellido1 |
+----------------+--------+-----------+
| Gerudo Valley  | Lorena | Paxton    |
| Tendo Garden   | Lorena | Paxton    |
+----------------+--------+-----------+

--62. Listar los vendedores (numemp, nombre, y nº de oficina) que trabajan en oficinas 
--&quot;buenas&quot; (las que tienen ventas superiores a su objetivo).
--no se entiende nada

--63. Listar a los vendedores que no trabajan en oficinas dirigidas por el empleado 108.
--no hay vendedores

--64. Listar los productos (idfab, idproducto y descripción) para los cuales no se ha recibido ningún pedido de 25000 o más.
SELECT distinct pr.codigo_producto from producto pr inner join detalle_pedido dp on pr.codigo_producto = dp.codigo_producto inner join pedido pe on dp.codigo_pedido = pe.codigo_pedido inner join cliente c on pe.codigo_cliente = c.codigo_cliente inner join pago pa on c.codigo_cliente = pa.codigo_cliente where pa.total < 25000;

--65. Listar los clientes asignados a Ana Bustamante que no han remitido un pedido superior a 3000 pts.

69. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
SELECT e.nombre, concat(e.apellido1, e.apellido2), e.email, em.nombre, em.apellido1 as 'apellidos' from empleado e inner join empleado em on e.codigo_jefe = em.codigo_empleado where em.nombre like 'Alberto' and em.apellido1 like 'Soria';
+-------------+----------------------------------+---------------------------+---------+-----------+
| nombre      | concat(e.apellido1, e.apellido2) | email                     | nombre  | apellidos |
+-------------+----------------------------------+---------------------------+---------+-----------+
| Felipe      | RosasMarquez                     | frosas@jardineria.es      | Alberto | Soria     |
| Juan Carlos | OrtizSerrano                     | cortiz@jardineria.es      | Alberto | Soria     |
| Carlos      | SoriaJimenez                     | csoria@jardineria.es      | Alberto | Soria     |
| Emmanuel    | Maga?aPerez                      | manu@jardineria.es        | Alberto | Soria     |
| Francois    | Fignon                           | ffignon@gardening.com     | Alberto | Soria     |
| Michael     | Bolton                           | mbolton@gardening.com     | Alberto | Soria     |
| Hilary      | Washington                       | hwashington@gardening.com | Alberto | Soria     |
| Nei         | Nishikori                        | nnishikori@gardening.com  | Alberto | Soria     |
| Amy         | Johnson                          | ajohnson@gardening.com    | Alberto | Soria     |
| Kevin       | Fallmer                          | kfalmer@gardening.com     | Alberto | Soria     |
+-------------+----------------------------------+---------------------------+---------+-----------+

--70. Devuelve el nombre del cliente con mayor límite de crédito. (utilizar ALL, ANY)
SELECT nombre_cliente, limite_credito from cliente where limite_credito >= ALL (SELECT limite_credito from cliente); 
SELECT nombre_cliente, limite_credito from cliente where NOT limite_credito < ANY (SELECT limite_credito from cliente);
+----------------+----------------+
| nombre_cliente | limite_credito |
+----------------+----------------+
| Tendo Garden   |      600000.00 |
+----------------+----------------+

--71. Devuelve el nombre del producto que tenga el precio de venta más caro. (utilizar ALL, ANY)
SELECT nombre, precio_venta from producto where precio_venta >= ALL (SELECT precio_venta from producto);
SELECT nombre, precio_venta from producto where NOT precio_venta < ANY (SELECT precio_venta from producto);
+-----------------------+--------------+
| nombre                | precio_venta |
+-----------------------+--------------+
| Trachycarpus Fortunei |       462.00 |
+-----------------------+--------------+

--72. Devuelve el producto que menos unidades tiene en stock. (utilizar ALL, ANY)
SELECT nombre, cantidad_en_stock from producto where cantidad_en_stock <= ALL(SELECT cantidad_en_stock from producto);
SELECT nombre, cantidad_en_stock from producto where NOT cantidad_en_stock > ANY(SELECT cantidad_en_stock from producto);
+---------------+-------------------+
| nombre        | cantidad_en_stock |
+---------------+-------------------+
| Brahea Armata |                 0 |
+---------------+-------------------+
--73. Devuelve el nombre, apellido1 y cargo de los empleados que no representan a ningún cliente.
-- (Utilizar IN, NOT IN)
SELECT nombre, concat(apellido1, apellido2) from empleado where codigo_empleado NOT IN(SELECT codigo_empleado_rep_ventas from cliente);
+-------------+------------------------------+
| nombre      | concat(apellido1, apellido2) |
+-------------+------------------------------+
| Marcos      | Maga?aPerez                  |
| Ruben       | L?pezMartinez                |
| Alberto     | SoriaCarrasco                |
| Maria       | Sol?sJerez                   |
| Juan Carlos | OrtizSerrano                 |
| Carlos      | SoriaJimenez                 |
| Hilario     | RodriguezHuertas             |
| David       | PalmaAceituno                |
| Oscar       | PalmaAceituno                |
| Francois    | Fignon                       |
| Laurent     | Serra                        |
| Hilary      | Washington                   |
| Marcus      | Paxton                       |
| Nei         | Nishikori                    |
| Narumi      | Riko                         |
| Takuma      | Nomura                       |
| Amy         | Johnson                      |
| Larry       | Westfalls                    |
| John        | Walton                       |
| Kevin       | Fallmer                      |
+-------------+------------------------------+
--74. Devuelve un listado que muestre solamente a los clientes que no han realizado ningún pago. (Utilizar IN, NOT IN)
SELECT nombre_cliente from cliente where codigo_cliente NOT IN(SELECT codigo_cliente from pago);
+-----------------------------+
| nombre_cliente              |
+-----------------------------+
| Lasas S.A.                  |
| Club Golf Puerta del hierro |
| DaraDistribuciones          |
| Madrile?a de riegos         |
| Lasas S.A.                  |
| Flowers, S.A                |
| Naturajardin                |
| Americh Golf Management SL  |
| Aloha                       |
| El Prat                     |
| Vivero Humanes              |
| Fuenla City                 |
| Top Campo                   |
| Campohermoso                |
| france telecom              |
| Mus?e du Louvre             |
| Flores S.L.                 |
| The Magic Garden            |
+-----------------------------+

--75. Devuelve un listado que muestre solamente a los clientes que sí han realizado ningún pago. 
--(Utilizar IN, NOT IN)
SELECT nombre_cliente from cliente where codigo_cliente IN(SELECT codigo_cliente from pago);
| nombre_cliente                 |
+--------------------------------+
| GoldFish Garden                |
| Gardening Associates           |
| Gerudo Valley                  |
| Tendo Garden                   |
| Beragua                        |
| Naturagua                      |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Golf S.A.                      |
| Sotogrande                     |
| Jardines y Mansiones Cactus SL |
| Jardiner?as Mat?as SL          |
| Agrojardin                     |
| Jardineria Sara                |
| Tutifruti S.A                  |
| El Jardin Viviente S.L         |
+--------------------------------+

--76. Devuelve un listado de los productos que nunca han aparecido en un pedido. (Utilizar IN, NOT IN)
SELECT distinct nombre from producto where codigo_producto NOT IN(SELECT codigo_producto FROM detalle_pedido);
+-------------------------------------------------------------+
| nombre                                                      |
+-------------------------------------------------------------+
| Olea-Olivos                                                 |
| Calamondin Mini                                             |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| Albaricoquero Corbato                                       |
| Albaricoquero Moniqui                                       |
| Albaricoquero Kurrot                                        |
| Cerezo Burlat                                               |
| Cerezo Picota                                               |
| Ciruelo R. Claudia Verde                                    |
| Ciruelo Golden Japan                                        |
| Ciruelo Claudia Negra                                       |
| Higuera Verdal                                              |
| Higuera Breva                                               |
| Melocotonero Spring Crest                                   |
| Melocotonero Federica                                       |
| Parra Uva de Mesa                                           |
| Mandarino -Plant?n joven                                    |
| Peral Castell                                               |
| Peral Williams                                              |
| Peral Conference                                            |
| Olivo Cipresino                                             |
| Albaricoquero                                               |
| Cerezo                                                      |
| Ciruelo                                                     |
| Granado                                                     |
| Higuera                                                     |
| Manzano                                                     |
| Melocotonero                                                |
| Membrillero                                                 |
| Arbustos Mix Maceta                                         |
| Mimosa Injerto CLASICA Dealbata                             |
| Mimosa Semilla Bayleyana                                    |
| Mimosa Semilla Espectabilis                                 |
| Mimosa Semilla Longifolia                                   |
| Mimosa Semilla Floribunda 4 estaciones                      |
| Abelia Floribunda                                           |
| Callistemom (Mix)                                           |
| Corylus Avellana "Contorta"                                 |
| Escallonia (Mix)                                            |
| Evonimus Emerald Gayeti                                     |
| Evonimus Pulchellus                                         |
| Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |
| Hibiscus Syriacus "Pink Giant" Rosa                         |
| Lonicera Nitida "Maigrum"                                   |
| Prunus pisardii                                             |
| Weigelia "Bristol Ruby"                                     |
| Leptospermum formado PIRAMIDE                               |
| Leptospermum COPA                                           |
| Nerium oleander-CALIDAD "GARDEN"                            |
| Nerium Oleander Arbusto GRANDE                              |
| Nerium oleander COPA  Calibre 6/8                           |
| ROSAL TREPADOR                                              |
| Solanum Jazminoide                                          |
| Wisteria Sinensis  azul, rosa, blanca                       |
| Wisteria Sinensis INJERTADAS DEC?                           |
| Bougamvillea Sanderiana Tutor                               |
| Bougamvillea Sanderiana Espaldera                           |
| Bougamvillea Sanderiana, 3 tut. piramide                    |
| Expositor ?rboles clima mediterr?neo                        |
| Expositor ?rboles borde del mar                             |
| Brachychiton Acerifolius                                    |
| Cassia Corimbosa                                            |
| Chitalpa Summer Bells                                       |
| Erytrina Kafra                                              |
| Eucalyptus Citriodora                                       |
| Eucalyptus Ficifolia                                        |
| Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
| Lagunaria Patersonii                                        |
| Morus Alba                                                  |
| Platanus Acerifolia                                         |
| Salix Babylonica  Pendula                                   |
| Tamarix  Ramosissima Pink Cascade                           |
| Tecoma Stands                                               |
| Tipuana Tipu                                                |
| Pleioblastus distichus-Bamb? enano                          |
| Sasa palmata                                                |
| Phylostachys aurea                                          |
| Phylostachys Bambusa Spectabilis                            |
| Phylostachys biseti                                         |
| Pseudosasa japonica (Metake)                                |
| Cedrus Deodara "Feeling Blue" Novedad                       |
| Juniperus chinensis "Blue Alps"                             |
| Juniperus Chinensis Stricta                                 |
| Juniperus squamata "Blue Star"                              |
| Juniperus x media Phitzeriana verde                         |
| Bismarckia Nobilis                                          |
| Brahea Armata                                               |
| Brahea Edulis                                               |
| Butia Capitata                                              |
| Chamaerops Humilis                                          |
| Chamaerops Humilis "Cerifera"                               |
| Chrysalidocarpus Lutescens -ARECA                           |
| Cordyline Australis -DRACAENA                               |
| Cycas Revoluta                                              |
| Dracaena Drago                                              |
| Livistonia Decipiens                                        |
| Rhaphis Excelsa                                             |
| Sabal Minor                                                 |
| Trachycarpus Fortunei                                       |
| Washingtonia Robusta                                        |
| Zamia Furfuracaea                                           |
+-------------------------------------------------------------+
--77. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean 
--representante de ventas de ningún cliente.(Utilizar IN, NOT IN)
SELECT e.nombre, concat(e.apellido1, e.apellido2), e.puesto, o.telefono from empleado e inner join oficina o on e.codigo_oficina = o.codigo_oficina where e.codigo_empleado NOT IN(SELECT codigo_empleado_rep_ventas from cliente);
+-------------+----------------------------------+-----------------------+-----------------+
| nombre      | concat(e.apellido1, e.apellido2) | puesto                | telefono        |
+-------------+----------------------------------+-----------------------+-----------------+
| David       | PalmaAceituno                    | Representante Ventas  | +34 93 3561182  |
| Oscar       | PalmaAceituno                    | Representante Ventas  | +34 93 3561182  |
| Hilary      | Washington                       | Director Oficina      | +1 215 837 0825 |
| Marcus      | Paxton                           | Representante Ventas  | +1 215 837 0825 |
| Amy         | Johnson                          | Director Oficina      | +44 20 78772041 |
| Larry       | Westfalls                        | Representante Ventas  | +44 20 78772041 |
| John        | Walton                           | Representante Ventas  | +44 20 78772041 |
| Carlos      | SoriaJimenez                     | Director Oficina      | +34 91 7514487  |
| Hilario     | RodriguezHuertas                 | Representante Ventas  | +34 91 7514487  |
| Francois    | Fignon                           | Director Oficina      | +33 14 723 4404 |
| Laurent     | Serra                            | Representante Ventas  | +33 14 723 4404 |
| Kevin       | Fallmer                          | Director Oficina      | +61 2 9264 2451 |
| Marcos      | Maga?aPerez                      | Director General      | +34 925 867231  |
| Ruben       | L?pezMartinez                    | Subdirector Marketing | +34 925 867231  |
| Alberto     | SoriaCarrasco                    | Subdirector Ventas    | +34 925 867231  |
| Maria       | Sol?sJerez                       | Secretaria            | +34 925 867231  |
| Juan Carlos | OrtizSerrano                     | Representante Ventas  | +34 925 867231  |
| Nei         | Nishikori                        | Director Oficina      | +81 33 224 5000 |
| Narumi      | Riko                             | Representante Ventas  | +81 33 224 5000 |
| Takuma      | Nomura                           | Representante Ventas  | +81 33 224 5000 |
+-------------+----------------------------------+-----------------------+-----------------+

--78. Devuelve un listado que muestre solamente a los clientes que no han realizado ningún pago.
-- (Utilizar EXISTS y NOT EXISTS)
SELECT c.nombre_cliente from cliente c where NOT EXISTS (SELECT codigo_cliente from pago p where p.codigo_cliente = c.codigo_cliente);
+-----------------------------+
| nombre_cliente              |
+-----------------------------+
| Lasas S.A.                  |
| Club Golf Puerta del hierro |
| DaraDistribuciones          |
| Madrile?a de riegos         |
| Lasas S.A.                  |
| Flowers, S.A                |
| Naturajardin                |
| Americh Golf Management SL  |
| Aloha                       |
| El Prat                     |
| Vivero Humanes              |
| Fuenla City                 |
| Top Campo                   |
| Campohermoso                |
| france telecom              |
| Mus?e du Louvre             |
| Flores S.L.                 |
| The Magic Garden            |
+-----------------------------+

--79. Devuelve un listado que muestre solamente a los clientes que sí han realizado ningún pago. 
--(Utilizar EXISTS y NOT EXISTS)
SELECT c.nombre_cliente from cliente c where exists (SELECT codigo_cliente from pago p where p.codigo_cliente = c.codigo_cliente);
+--------------------------------+
| nombre_cliente                 |
+--------------------------------+
| GoldFish Garden                |
| Gardening Associates           |
| Gerudo Valley                  |
| Tendo Garden                   |
| Beragua                        |
| Naturagua                      |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Golf S.A.                      |
| Sotogrande                     |
| Jardines y Mansiones Cactus SL |
| Jardiner?as Mat?as SL          |
| Agrojardin                     |
| Jardineria Sara                |
| Tutifruti S.A                  |
| El Jardin Viviente S.L         |
+--------------------------------+

--80. Devuelve un listado de los productos que nunca han aparecido en un pedido. (Utilizar EXISTS y NOT EXISTS)
SELECT distinct p.nombre from producto p where not exists (select distinct dp.codigo_producto from detalle_pedido dp where dp.codigo_producto = p.codigo_producto);
+-------------------------------------------------------------+
| nombre                                                      |
+-------------------------------------------------------------+
| Olea-Olivos                                                 |
| Calamondin Mini                                             |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| Albaricoquero Corbato                                       |
| Albaricoquero Moniqui                                       |
| Albaricoquero Kurrot                                        |
| Cerezo Burlat                                               |
| Cerezo Picota                                               |
| Ciruelo R. Claudia Verde                                    |
| Ciruelo Golden Japan                                        |
| Ciruelo Claudia Negra                                       |
| Higuera Verdal                                              |
| Higuera Breva                                               |
| Melocotonero Spring Crest                                   |
| Melocotonero Federica                                       |
| Parra Uva de Mesa                                           |
| Mandarino -Plant?n joven                                    |
| Peral Castell                                               |
| Peral Williams                                              |
| Peral Conference                                            |
| Olivo Cipresino                                             |
| Albaricoquero                                               |
| Cerezo                                                      |
| Ciruelo                                                     |
| Granado                                                     |
| Higuera                                                     |
| Manzano                                                     |
| Melocotonero                                                |
| Membrillero                                                 |
| Arbustos Mix Maceta                                         |
| Mimosa Injerto CLASICA Dealbata                             |
| Mimosa Semilla Bayleyana                                    |
| Mimosa Semilla Espectabilis                                 |
| Mimosa Semilla Longifolia                                   |
| Mimosa Semilla Floribunda 4 estaciones                      |
| Abelia Floribunda                                           |
| Callistemom (Mix)                                           |
| Corylus Avellana "Contorta"                                 |
| Escallonia (Mix)                                            |
| Evonimus Emerald Gayeti                                     |
| Evonimus Pulchellus                                         |
| Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |
| Hibiscus Syriacus "Pink Giant" Rosa                         |
| Lonicera Nitida "Maigrum"                                   |
| Prunus pisardii                                             |
| Weigelia "Bristol Ruby"                                     |
| Leptospermum formado PIRAMIDE                               |
| Leptospermum COPA                                           |
| Nerium oleander-CALIDAD "GARDEN"                            |
| Nerium Oleander Arbusto GRANDE                              |
| Nerium oleander COPA  Calibre 6/8                           |
| ROSAL TREPADOR                                              |
| Solanum Jazminoide                                          |
| Wisteria Sinensis  azul, rosa, blanca                       |
| Wisteria Sinensis INJERTADAS DEC?                           |
| Bougamvillea Sanderiana Tutor                               |
| Bougamvillea Sanderiana Espaldera                           |
| Bougamvillea Sanderiana, 3 tut. piramide                    |
| Expositor ?rboles clima mediterr?neo                        |
| Expositor ?rboles borde del mar                             |
| Brachychiton Acerifolius                                    |
| Cassia Corimbosa                                            |
| Chitalpa Summer Bells                                       |
| Erytrina Kafra                                              |
| Eucalyptus Citriodora                                       |
| Eucalyptus Ficifolia                                        |
| Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
| Lagunaria Patersonii                                        |
| Morus Alba                                                  |
| Platanus Acerifolia                                         |
| Salix Babylonica  Pendula                                   |
| Tamarix  Ramosissima Pink Cascade                           |
| Tecoma Stands                                               |
| Tipuana Tipu                                                |
| Pleioblastus distichus-Bamb? enano                          |
| Sasa palmata                                                |
| Phylostachys aurea                                          |
| Phylostachys Bambusa Spectabilis                            |
| Phylostachys biseti                                         |
| Pseudosasa japonica (Metake)                                |
| Cedrus Deodara "Feeling Blue" Novedad                       |
| Juniperus chinensis "Blue Alps"                             |
| Juniperus Chinensis Stricta                                 |
| Juniperus squamata "Blue Star"                              |
| Juniperus x media Phitzeriana verde                         |
| Bismarckia Nobilis                                          |
| Brahea Armata                                               |
| Brahea Edulis                                               |
| Butia Capitata                                              |
| Chamaerops Humilis                                          |
| Chamaerops Humilis "Cerifera"                               |
| Chrysalidocarpus Lutescens -ARECA                           |
| Cordyline Australis -DRACAENA                               |
| Cycas Revoluta                                              |
| Dracaena Drago                                              |
| Livistonia Decipiens                                        |
| Rhaphis Excelsa                                             |
| Sabal Minor                                                 |
| Trachycarpus Fortunei                                       |
| Washingtonia Robusta                                        |
| Zamia Furfuracaea                                           |
+-------------------------------------------------------------+

--81. Devuelve un listado de los productos que han aparecido en un pedido alguna vez. (Utilizar EXISTS y NOT EXISTS)
SELECT distinct p.nombre from producto p where exists(select distinct dp.codigo_producto from detalle_pedido dp where dp.codigo_producto = p.codigo_producto);
+-------------------------------------------------------------+
| nombre                                                      |
+-------------------------------------------------------------+
| Sierra de Poda 400MM                                        |
| Pala                                                        |
| Rastrillo de Jard?n                                         |
| Azad?n                                                      |
| Ajedrea                                                     |
| Lav?ndula Dentata                                           |
| Mejorana                                                    |
| Melissa                                                     |
| Mentha Sativa                                               |
| Petrosilium Hortense (Peregil)                              |
| Salvia Mix                                                  |
| Thymus Citriodra (Tomillo lim?n)                            |
| Thymus Vulgaris                                             |
| Santolina Chamaecyparys                                     |
| Expositor C?tricos Mix                                      |
| Limonero 2 a?os injerto                                     |
| Nectarina                                                   |
| Nogal                                                       |
| Olea-Olivos                                                 |
| Peral                                                       |
| Limonero 30/40                                              |
| Kunquat                                                     |
| Kunquat  EXTRA con FRUTA                                    |
| Calamondin Copa                                             |
| Calamondin Copa EXTRA Con FRUTA                             |
| Rosal bajo 1?? -En maceta-inicio brotaci?n                  |
| ROSAL TREPADOR                                              |
| Pitimini rojo                                               |
| Rosal copa                                                  |
| Cerezo Napole?n                                             |
| Ciruelo Santa Rosa                                          |
| Ciruelo Friar                                               |
| Ciruelo Reina C. De Ollins                                  |
| Granado Mollar de Elche                                     |
| Higuera Napolitana                                          |
| Manzano Starking Delicious                                  |
| Manzano Reineta                                             |
| Manzano Golden Delicious                                    |
| Membrillero Gigante de Wranja                               |
| Melocotonero Amarillo de Agosto                             |
| Melocotonero Paraguayo                                      |
| Nogal Com?n                                                 |
| Peral Blanq. de Aranjuez                                    |
| N?spero Tanaca                                              |
| Kaki Rojo Brillante                                         |
| Albaricoquero                                               |
| Mandarino 2 a?os injerto                                    |
| Cerezo                                                      |
| Mandarino calibre 8/10                                      |
| Ciruelo                                                     |
| Granado                                                     |
| Higuera                                                     |
| Limonero -Plant?n joven                                     |
| Kaki                                                        |
| Manzano                                                     |
| Limonero calibre 8/10                                       |
| N?spero                                                     |
| Melocotonero                                                |
| Expositor Mimosa Semilla Mix                                |
| Mimosa Semilla Bayleyana                                    |
| Mimosa Semilla Cyanophylla                                  |
| Forsytia Intermedia "Lynwood"                               |
| Hibiscus Syriacus  "Diana" -Blanco Puro                     |
| Laurus Nobilis Arbusto - Ramificado Bajo                    |
| Lonicera Nitida                                             |
| Lonicera Pileata                                            |
| Philadelphus "Virginal"                                     |
| Viburnum Tinus "Eve Price"                                  |
| Camelia japonica                                            |
| Camelia japonica ejemplar                                   |
| Callistemom COPA                                            |
| Nerium oleander ARBOL Calibre 8/10                          |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| Bougamvillea Sanderiana Tutor                               |
| Bougamvillea roja, naranja                                  |
| Expositor ?rboles clima continental                         |
| Acer Negundo                                                |
| Acer platanoides                                            |
| Acer Pseudoplatanus                                         |
| Brachychiton Discolor                                       |
| Brachychiton Rupestris                                      |
| Erytrina Kafra                                              |
| Eucalyptus Ficifolia                                        |
| Lagunaria patersonii  calibre 8/10                          |
| Morus Alba  calibre 8/10                                    |
| Prunus pisardii                                             |
| Robinia Pseudoacacia Casque Rouge                           |
| Sesbania Punicea                                            |
| Tamarix  Ramosissima Pink Cascade                           |
| Sasa palmata                                                |
| Phylostachys biseti                                         |
| Cedrus Deodara                                              |
| Juniperus horizontalis Wiltonii                             |
| Pinus Canariensis                                           |
| Pinus Halepensis                                            |
| Pinus Pinea -Pino Pi?onero                                  |
| Thuja Esmeralda                                             |
| Tuja Occidentalis Woodwardii                                |
| Tuja orientalis "Aurea nana"                                |
| Archontophoenix Cunninghamiana                              |
| Beucarnea Recurvata                                         |
| Bismarckia Nobilis                                          |
| Brahea Armata                                               |
| Brahea Edulis                                               |
| Butia Capitata                                              |
| Chamaerops Humilis                                          |
| Dracaena Drago                                              |
| Jubaea Chilensis                                            |
| Livistonia Australis                                        |
| Phoenix Canariensis                                         |
| Rhaphis Humilis                                             |
| Trachycarpus Fortunei                                       |
| Washingtonia Robusta                                        |
| Yucca Jewel                                                 |
| Mimosa DEALBATA Gaulois Astier                              |
+-------------------------------------------------------------+

--82. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. 
--Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
SELECT c.codigo_cliente, count(p.codigo_cliente) from cliente c left join pedido p on p.codigo_cliente = c.codigo_cliente group by c.codigo_cliente;
+----------------+-------------------------+
| codigo_cliente | count(p.codigo_cliente) |
+----------------+-------------------------+
|              1 |                      11 |
|              3 |                       9 |
|              4 |                       5 |
|              5 |                       5 |
|              6 |                       0 |
|              7 |                       5 |
|              8 |                       0 |
|              9 |                       5 |
|             10 |                       0 |
|             11 |                       0 |
|             12 |                       0 |
|             13 |                       5 |
|             14 |                       5 |
|             15 |                       5 |
|             16 |                      10 |
|             17 |                       0 |
|             18 |                       0 |
|             19 |                       5 |
|             20 |                       0 |
|             21 |                       0 |
|             22 |                       0 |
|             23 |                       5 |
|             24 |                       0 |
|             25 |                       0 |
|             26 |                       5 |
|             27 |                       5 |
|             28 |                       5 |
|             29 |                       0 |
|             30 |                      10 |
|             31 |                       0 |
|             32 |                       0 |
|             33 |                       0 |
|             35 |                       5 |
|             36 |                       5 |
|             37 |                       0 |
|             38 |                       5 |
+----------------+-------------------------+

--83. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. 
--Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
SELECT c.codigo_cliente, c.nombre_cliente, sum(p.total) from cliente c left join pago p on c.codigo_cliente = p.codigo_cliente group by c.nombre_cliente;
+--------------------------------+--------------+
| nombre_cliente                 | sum(p.total) |
+--------------------------------+--------------+
| Agrojardin                     |      8489.00 |
| Aloha                          |         NULL |
| Americh Golf Management SL     |         NULL |
| Beragua                        |      2390.00 |
| Campohermoso                   |         NULL |
| Camunas Jardines S.L.          |      2246.00 |
| Club Golf Puerta del hierro    |         NULL |
| DaraDistribuciones             |         NULL |
| Dardena S.A.                   |      4160.00 |
| El Jardin Viviente S.L         |      1171.00 |
| El Prat                        |         NULL |
| Flores Marivi                  |      4399.00 |
| Flores S.L.                    |         NULL |
| Flowers, S.A                   |         NULL |
| france telecom                 |         NULL |
| Fuenla City                    |         NULL |
| Gardening Associates           |     10926.00 |
| Gerudo Valley                  |     81849.00 |
| GoldFish Garden                |      4000.00 |
| Golf S.A.                      |       232.00 |
| Jardin de Flores               |     12081.00 |
| Jardiner?as Mat?as SL          |     10972.00 |
| Jardineria Sara                |      7863.00 |
| Jardines y Mansiones Cactus SL |     18846.00 |
| Lasas S.A.                     |         NULL |
| Madrile?a de riegos            |         NULL |
| Mus?e du Louvre                |         NULL |
| Naturagua                      |       929.00 |
| Naturajardin                   |         NULL |
| Sotogrande                     |       272.00 |
| Tendo Garden                   |     23794.00 |
| The Magic Garden               |         NULL |
| Top Campo                      |         NULL |
| Tutifruti S.A                  |      3321.00 |
| Vivero Humanes                 |         NULL |
+--------------------------------+--------------+

--84. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente
--de menor a mayor.
SELECT c.nombre_cliente, fecha_pedido from cliente c inner join pedido p on c.codigo_cliente = p.codigo_pedido where YEAR(p.fecha_pedido) = 2008 order by c.nombre_cliente;
+-----------------------------+--------------+
| nombre_cliente              | fecha_pedido |
+-----------------------------+--------------+
| Campohermoso                | 2008-09-04   |
| Club Golf Puerta del hierro | 2008-11-09   |
| Flores S.L.                 | 2008-10-15   |
| Gardening Associates        | 2008-06-20   |
| Jardineria Sara             | 2008-08-03   |
| Naturagua                   | 2008-12-22   |
| Sotogrande                  | 2008-12-30   |
| The Magic Garden            | 2008-11-03   |
| Top Campo                   | 2008-08-01   |
| Tutifruti S.A               | 2008-03-10   |
| Vivero Humanes              | 2008-07-14   |
+-----------------------------+--------------+

--85. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y
--el número de teléfono de la oficina delrepresentante de ventas, de aquellos clientes que no
--hayan realizado ningún pago.
SELECT c.nombre_cliente, e.nombre, e.apellido1, o.telefono from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado inner join oficina o on e.codigo_oficina = o.codigo_oficina where c.codigo_cliente NOT IN(SELECT codigo_cliente from pago);
+-----------------------------+-------------+------------+-----------------+
| nombre_cliente              | nombre      | apellido1  | telefono        |
+-----------------------------+-------------+------------+-----------------+
| Club Golf Puerta del hierro | Emmanuel    | Maga?a     | +34 93 3561182  |
| DaraDistribuciones          | Emmanuel    | Maga?a     | +34 93 3561182  |
| Madrile?a de riegos         | Emmanuel    | Maga?a     | +34 93 3561182  |
| Americh Golf Management SL  | Jos? Manuel | Martinez   | +34 93 3561182  |
| Aloha                       | Jos? Manuel | Martinez   | +34 93 3561182  |
| El Prat                     | Jos? Manuel | Martinez   | +34 93 3561182  |
| Lasas S.A.                  | Mariano     | L?pez      | +34 91 7514487  |
| Lasas S.A.                  | Mariano     | L?pez      | +34 91 7514487  |
| france telecom              | Lionel      | Narvaez    | +33 14 723 4404 |
| Mus?e du Louvre             | Lionel      | Narvaez    | +33 14 723 4404 |
| Flores S.L.                 | Michael     | Bolton     | +1 650 219 4782 |
| The Magic Garden            | Michael     | Bolton     | +1 650 219 4782 |
| Naturajardin                | Julian      | Bellinelli | +61 2 9264 2451 |
| Vivero Humanes              | Julian      | Bellinelli | +61 2 9264 2451 |
| Campohermoso                | Julian      | Bellinelli | +61 2 9264 2451 |
| Flowers, S.A                | Felipe      | Rosas      | +34 925 867231  |
| Fuenla City                 | Felipe      | Rosas      | +34 925 867231  |
| Top Campo                   | Felipe      | Rosas      | +34 925 867231  |
+-----------------------------+-------------+------------+-----------------+

--86. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido 
--de su representante de ventas y la ciudad donde está su oficina.
SELECT c.nombre_cliente, e.nombre, e.apellido1, o.ciudad from cliente c inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado inner join oficina o on e.codigo_oficina = o.codigo_oficina;
+--------------------------------+-----------------+------------+----------------------+
| nombre_cliente                 | nombre          | apellido1  | ciudad               |
+--------------------------------+-----------------+------------+----------------------+
| Beragua                        | Emmanuel        | Maga?a     | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel        | Maga?a     | Barcelona            |
| Naturagua                      | Emmanuel        | Maga?a     | Barcelona            |
| DaraDistribuciones             | Emmanuel        | Maga?a     | Barcelona            |
| Madrile?a de riegos            | Emmanuel        | Maga?a     | Barcelona            |
| Golf S.A.                      | Jos? Manuel     | Martinez   | Barcelona            |
| Americh Golf Management SL     | Jos? Manuel     | Martinez   | Barcelona            |
| Aloha                          | Jos? Manuel     | Martinez   | Barcelona            |
| El Prat                        | Jos? Manuel     | Martinez   | Barcelona            |
| Sotogrande                     | Jos? Manuel     | Martinez   | Barcelona            |
| Gerudo Valley                  | Lorena          | Paxton     | Boston               |
| Tendo Garden                   | Lorena          | Paxton     | Boston               |
| Lasas S.A.                     | Mariano         | L?pez      | Madrid               |
| Lasas S.A.                     | Mariano         | L?pez      | Madrid               |
| Camunas Jardines S.L.          | Mariano         | L?pez      | Madrid               |
| Dardena S.A.                   | Mariano         | L?pez      | Madrid               |
| Jardines y Mansiones Cactus SL | Lucio           | Campoamor  | Madrid               |
| Jardiner?as Mat?as SL          | Lucio           | Campoamor  | Madrid               |
| france telecom                 | Lionel          | Narvaez    | Paris                |
| Mus?e du Louvre                | Lionel          | Narvaez    | Paris                |
| Flores S.L.                    | Michael         | Bolton     | San Francisco        |
| The Magic Garden               | Michael         | Bolton     | San Francisco        |
| GoldFish Garden                | Walter Santiago | Sanchez    | San Francisco        |
| Gardening Associates           | Walter Santiago | Sanchez    | San Francisco        |
| Jardin de Flores               | Julian          | Bellinelli | Sydney               |
| Naturajardin                   | Julian          | Bellinelli | Sydney               |
| Vivero Humanes                 | Julian          | Bellinelli | Sydney               |
| Agrojardin                     | Julian          | Bellinelli | Sydney               |
| Campohermoso                   | Julian          | Bellinelli | Sydney               |
| Tutifruti S.A                  | Mariko          | Kishi      | Sydney               |
| El Jardin Viviente S.L         | Mariko          | Kishi      | Sydney               |
| Flores Marivi                  | Felipe          | Rosas      | Talavera de la Reina |
| Flowers, S.A                   | Felipe          | Rosas      | Talavera de la Reina |
| Fuenla City                    | Felipe          | Rosas      | Talavera de la Reina |
| Top Campo                      | Felipe          | Rosas      | Talavera de la Reina |
| Jardineria Sara                | Felipe          | Rosas      | Talavera de la Reina |
+--------------------------------+-----------------+------------+----------------------+

--87. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean 
--representante de ventas de ningún cliente.
SELECT e.nombre, concat(e.apellido1, e.apellido2) as 'apellidos', e.puesto, o.telefono from empleado e inner join oficina o on e.codigo_oficina = o.codigo_oficina where not exists(SELECT codigo_empleado_rep_ventas from cliente c where c.codigo_empleado_rep_ventas = e.codigo_empleado); 
+-------------+------------------+-----------------------+-----------------+
| nombre      | apellidos        | puesto                | telefono        |
+-------------+------------------+-----------------------+-----------------+
| David       | PalmaAceituno    | Representante Ventas  | +34 93 3561182  |
| Oscar       | PalmaAceituno    | Representante Ventas  | +34 93 3561182  |
| Hilary      | Washington       | Director Oficina      | +1 215 837 0825 |
| Marcus      | Paxton           | Representante Ventas  | +1 215 837 0825 |
| Amy         | Johnson          | Director Oficina      | +44 20 78772041 |
| Larry       | Westfalls        | Representante Ventas  | +44 20 78772041 |
| John        | Walton           | Representante Ventas  | +44 20 78772041 |
| Carlos      | SoriaJimenez     | Director Oficina      | +34 91 7514487  |
| Hilario     | RodriguezHuertas | Representante Ventas  | +34 91 7514487  |
| Francois    | Fignon           | Director Oficina      | +33 14 723 4404 |
| Laurent     | Serra            | Representante Ventas  | +33 14 723 4404 |
| Kevin       | Fallmer          | Director Oficina      | +61 2 9264 2451 |
| Marcos      | Maga?aPerez      | Director General      | +34 925 867231  |
| Ruben       | L?pezMartinez    | Subdirector Marketing | +34 925 867231  |
| Alberto     | SoriaCarrasco    | Subdirector Ventas    | +34 925 867231  |
| Maria       | Sol?sJerez       | Secretaria            | +34 925 867231  |
| Juan Carlos | OrtizSerrano     | Representante Ventas  | +34 925 867231  |
| Nei         | Nishikori        | Director Oficina      | +81 33 224 5000 |
| Narumi      | Riko             | Representante Ventas  | +81 33 224 5000 |
| Takuma      | Nomura           | Representante Ventas  | +81 33 224 5000 |
+-------------+------------------+-----------------------+-----------------+

--88. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
SELECT count(e.codigo_empleado), o.ciudad from oficina o inner join empleado e on o.codigo_oficina = e.codigo_oficina group by o.ciudad;
+--------------------------+----------------------+
| count(e.codigo_empleado) | ciudad               |
+--------------------------+----------------------+
|                        4 | Barcelona            |
|                        3 | Boston               |
|                        3 | Londres              |
|                        4 | Madrid               |
|                        3 | Paris                |
|                        2 | San Francisco        |
|                        3 | Sydney               |
|                        6 | Talavera de la Reina |
|                        3 | Tokyo                |
+--------------------------+----------------------+
