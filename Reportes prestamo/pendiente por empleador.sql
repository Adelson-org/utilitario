
SELECT
e.nombre,
b.`Nombre`,
COUNT(c.numero) AS Cuotas_pend,
p.monto AS Prestamo,
(SELECT SUM(totalpagado) FROM maestrodepago WHERE Prestamo=p.Numero GROUP BY Prestamo) AS Pago,
(SELECT SUM(totalpagado) FROM maestrodepago WHERE Prestamo=p.Numero GROUP BY Prestamo) -p.monto AS Resta
FROM prestamo p, cuota c, cliente b, empleador e
WHERE p.`Numero`=c.`Prestamo` AND b.empleador=e.numero
AND p.`Cliente`=b.`Numero`
AND p.`Estatus` IN('original','abonado')
AND c.`CapitalPendiente`>5
GROUP BY p.`Numero`
ORDER BY e.nombre, p.monto DESC
,b.`Nombre`