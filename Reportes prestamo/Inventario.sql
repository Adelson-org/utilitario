
DROP TABLE IF EXISTS datos;

CREATE TABLE datos
SELECT 
(
SELECT SUM(c.capital-((p.gastolegales/p.montototal)*c.capital)) 
FROM cuota c, prestamo p WHERE p.`Numero`=c.`Prestamo` AND p.`Estatus`<>'Cancelado'  
) Invertido,  
(
SELECT SUM((d.capital)- ((p.gastolegales/p.montototal)*d.capital))                   
FROM detalledepago d, prestamo p WHERE d.prestamo=p.numero    -- nota<>'Nota de credito'
) Cobrado;


SELECT Invertido, Cobrado, Invertido-Cobrado Diferencia FROM datos;

