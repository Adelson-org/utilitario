
SELECT
e.nombre,
b.`Nombre`,
COUNT(c.numero) AS Cuotas,
p.monto AS Prestamo,
(SELECT SUM(totalpagado) FROM maestrodepago WHERE Prestamo=p.Numero GROUP BY Prestamo) AS Pago,
(SELECT SUM(totalpagado) FROM maestrodepago WHERE Prestamo=p.Numero GROUP BY Prestamo) -p.monto AS Resta,
SUM(c.`InteresPendiente`+`CapitalPendiente`) Atrasos
FROM prestamo p, cuota c, cliente b, empleador e
WHERE p.`Numero`=c.`Prestamo` AND b.empleador=e.numero
AND p.`Cliente`=b.`Numero`
AND p.`Estatus` IN('original','abonado')
AND c.`CapitalPendiente`>1
AND c.`Vencimiento`<= NOW()
GROUP BY p.`Numero`
ORDER BY e.nombre, p.monto DESC
,b.`Nombre`