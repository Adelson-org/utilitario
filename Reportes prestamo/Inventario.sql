
SELECT 'Invertido' Tipo, SUM(capital) Capital -- , sum(Interes) Interes, SUM(capital+interes) Total 
FROM cuota c, prestamo p WHERE p.`Numero`=c.`Prestamo` AND p.`Estatus`<>'Cancelado'       
UNION ALL
SELECT 'Cobrado' Tipo,  SUM(Capital) Capital -- , SUM(interes) Interes, SUM(Capital+interes) Total                   
FROM detalledepago -- WHERE nota<>'Nota de credito'
UNION ALL
SELECT 'Diferencia' Tipo, SUM(capitalpendiente) Capital -- , sum(interespendiente) Interes,SUM(capitalpendiente+interespendiente) Total 
FROM cuota c, prestamo p WHERE p.`Numero`=c.`Prestamo` AND p.`Estatus`<>'Cancelado'  -- and c.`Estatus`<>'Saldada'
  
