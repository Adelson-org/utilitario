SET @fecha=DATE_SUB(NOW(), INTERVAL 2 DAY);

SELECT v.`Nombre`,  SUM(d.interes) Interes, SUM(d.interes)* v.comision/100 Comision, @fecha
FROM detalledepago d, maestrodepago m , prestamo p, vendedor v
WHERE d.maestrodepago=m.numero AND m.`Prestamo`=p.`Numero` AND p.`Vendedor`=v.`Numero`
AND m.`Estatus`<>'Cancelado' AND DATE(m.fechahoy) BETWEEN DATE(@fecha) AND DATE(NOW())
AND v.comision>0 
GROUP BY v.nombre;



