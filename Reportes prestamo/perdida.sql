SELECT 
c.nombre
,SUM(p.monto) -(SELECT SUM(totalpagado) FROM maestrodepago WHERE prestamo=p.`Numero` ) Capital
FROM prestamo p, cliente c
WHERE p.cliente=c.`Numero`
AND p.estatus2='Legal'
AND estatus IN('Original','Abonado')
GROUP BY p.`cliente`
ORDER BY c.nombre
-- select * from maestrodepago where prestamo='100'