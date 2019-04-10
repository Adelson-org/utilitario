
SET @fecha=DATE(NOW());

DROP TABLE IF EXISTS cuadre_; 
CREATE TABLE cuadre_
SELECT 'Inicio' Tipo, 0 Capital, 0 Interes, 0 GastoL, CAST(AVG(  37872 ) AS DECIMAL(12,2)) Total 
UNION ALL
SELECT 'Invertido' Tipo, CAST( IFNULL( SUM(c.capital -((p.gastolegales/p.montototal)*c.capital))*-1,0)  AS DECIMAL(12,2))   Capital, 
	CAST( IFNULL( SUM(c.interes),0)  AS DECIMAL(12,2))  Interes , 
         CAST( IFNULL( SUM(((p.gastolegales/p.montototal)*c.capital)),0)  AS DECIMAL(12,2))  GastoL,
	CAST(IFNULL( SUM(c.capital -((p.gastolegales/p.montototal)*c.capital))*-1,0)  AS DECIMAL(12,2))   total 
FROM cuota c, prestamo p WHERE p.`Numero`=c.`Prestamo` AND p.`Estatus`<>'Cancelado'  AND DATE(p.`Fecha`) =@fecha
UNION ALL
SELECT 'Cobrado' Tipo,  CAST(IFNULL( SUM(d.capital -((p.gastolegales/p.montototal)*d.capital)),0)  AS DECIMAL(12,2)) Capital,
	 CAST( IFNULL(SUM(d.interes),0)+IFNULL(AVG((SELECT SUM(mora+comision) FROM maestrodepago WHERE fechahoy=@fecha  )),0)  AS DECIMAL(12,2)) Interes ,
	 CAST( IFNULL( SUM(((p.gastolegales/p.montototal)*d.capital)),0)  AS DECIMAL(12,2)) GastoL,
	 CAST( IFNULL( SUM(d.capital+d.interes),0)  +IFNULL(AVG((SELECT SUM(mora+comision) FROM maestrodepago WHERE fechahoy=@fecha  )),0)  AS DECIMAL(12,2)) Total
FROM detalledepago d, maestrodepago m, prestamo p WHERE m.prestamo=p.numero AND d.maestrodepago=m.numero AND d.nota<>'Nota de credito'
AND m.`Estatus`<>'Cancelado' AND DATE(m.fechahoy) =@fecha  ;            

SELECT * FROM cuadre_
UNION ALL
SELECT 'Diferencia' Tipo, IFNULL(SUM(capital),0) Capital, IFNULL(SUM(interes),0) Interes, IFNULL(SUM(gastol),0) GastoL, IFNULL(SUM(total),0) Total
FROM cuadre_;



