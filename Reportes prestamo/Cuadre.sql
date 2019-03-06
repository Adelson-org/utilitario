
SET @fecha=DATE(NOW());

DROP TABLE IF EXISTS cuadre_;
CREATE TABLE cuadre_
SELECT 'Inicio' Tipo, 0 Capital, 0 Interes, AVG(19861.11) Total   -- fondo + retiro del banco   
UNION ALL
SELECT 'Invertido' Tipo, IFNULL(SUM(c.capital)*-1,0)   Capital, 0 Interes, IFNULL(SUM(c.capital)*-1,0) Total 
FROM cuota c, prestamo p WHERE p.`Numero`=c.`Prestamo` AND p.`Estatus`<>'Cancelado'  AND DATE(p.`Fecha`)=@fecha    
UNION ALL
SELECT 'Cobrado' Tipo, IFNULL( SUM(d.Capital),0) Capital, 
IFNULL(SUM(d.interes),0)+IFNULL(AVG((SELECT SUM(mora+comision) FROM maestrodepago WHERE fechahoy=@fecha  )),0) Interes, 
IFNULL(SUM(d.Capital+interes),0)+IFNULL(AVG((SELECT SUM(mora+comision) FROM maestrodepago WHERE fechahoy=@fecha  )),0) Total
FROM detalledepago d, maestrodepago m WHERE d.maestrodepago=m.numero -- and d.nota<>'Nota de credito'
AND m.`Estatus`<>'Cancelado' AND DATE(m.fechahoy) = @fecha;                 

SELECT * FROM cuadre_
UNION ALL
SELECT 'Diferencia' Tipo, IFNULL(SUM(capital),0) Capital, IFNULL(SUM(interes),0) Interes, IFNULL(SUM(total),0) Total
FROM cuadre_;



