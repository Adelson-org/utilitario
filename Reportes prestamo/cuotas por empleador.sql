SELECT c.`Nombre`, p.inicial cuota FROM prestamo p, cliente c
WHERE p.cliente=c.numero
AND p.estatus IN('original','abonado') 
AND c.empleador=6




-- select * from empleador  
