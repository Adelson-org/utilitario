

----prestado hoy
--insert into diario
--values
--(GETDATE(),'1.3.1','Invertido en Prestamos',57000,0)--Cxc prestamos 
----@
--,(GETDATE(),'1.2.2','Invertido en Prestamos',0,57000) --Caja prestamo


----cobrado hoy
--insert into diario
--values
--(GETDATE(),'1.2.2','Cobrado por prestamos',25325+15,0) --Caja prestamo
----@
--,(GETDATE(),'1.3.1','Capital recuperado',0,18374.62) --cxc prestamo
--,(GETDATE(),'4.6','Interes y mora cobrado',0,6796.00) --Ingreso interes prestamos
--,(GETDATE(),'2.1.12','Cxp Gastos legales',0,154.38) --Cxp Gastos legales
--,(GETDATE(),'4.5','Ingreso Sobrante',0,15) --Ingreso Sobrante




----gastos caja prestamo
--insert into diario
--values
--(GETDATE(),'6.21','pago comision mayra 6.08',450,0) --Gasto Otros  
----,(GETDATE(),'6.21','regalo a francisca',1000,0) --Gasto Otros  
----,(GETDATE(),'6.11','romo + ',155,0) --Gasto fiestas y chucherias
----,(GETDATE(),'2.1.2','pago de la casa',3000,0), --Cxp Alquiler casa
----,(GETDATE(),'6.1','zapatillas y otros',1000,0), --Gasto ropa y cosmetico 
----(GETDATE(),'6.4','Faltante en cuadre',320,0) --Gasto Faltante
----,(GETDATE(),'6.8','parto del bebe',7000,0) -- Gasto Medicina y consulta
----,(GETDATE(),'2.1.9','Gastos legales',0,0) --Cxp Gastos legales
----,(GETDATE(),'2.1.5','Cxp Colegio',900,0) --Cxp Colegio
----,(GETDATE(),'2.1.7','Cxp Guarderia',1800,0) --Cxp Guarderia
------@
--,(GETDATE(),'1.2.2','pago comision mayra 6.08',0,450) --Caja prestamo





----gasto caja personal
--insert into diario
--values
----(GETDATE(),'6.5','combustible',500,0), -- Gasto Vehiculos
--(GETDATE(),'6.11','Gasto fiestas y chucherias',258,0) --Gasto fiestas y chucherias
--,(GETDATE(),'6.9','Gasto compras del hogar',1639,0) -- Gasto compras del hogar
--,(GETDATE(),'6.3','Comunicacion',100,0) -- Gasto Comunicacion
----,(GETDATE(),'6.21','Gastos diario',350,0) -- Gasto Otros
----@
--,(GETDATE(),'1.2.1','Gastos varios',0,1997) --caja personal
----,(GETDATE(),'4.5','Ingreso Sobrante gabriel haitiano',0,497) --Ingreso Sobrante




----gastos tarjeta
--insert into diario
--values  	
----(GETDATE(),'2.1.6','Cxp combustible',700,0), -- Cxp combustible
----(GETDATE(),'6.8','Analisis rosalis',210.40,0), -- Gasto Medicina y consulta
----(GETDATE(),'6.9','abanico',910,0) --Gasto Otros
----,(GETDATE(),'6.9','impuesto por pago automatico de cuota',12.69,0) --Gasto Otros
----(GETDATE(),'2.1.8','pago de capital extracredito 09/04',6731.23,0)--Cxp prestamo bhd leon adelson
----,(GETDATE(),'2.1.7','pago de capital extracredito 09/04',6731.23,0)--Cxp ExtraCredito banco popular
--(GETDATE(),'2.1.6','pago de capital prestamo',884.08,0)--Cxp prestamo banco popular
--,(GETDATE(),'6.7','Gasto interes prestamo popular',1729.84,0) --Gasto interes prestamos
----(GETDATE(),'6.1','deporte, alcanfor, beneno otros',210,0), --Gasto ropa y cosmetico
----,(GETDATE(),'6.11','romo y refresco',532,0) --Gasto fiestas y chucherias
----@
----(GETDATE(),'1.1.4','Analisis rosalis',0,43.92) --Banco BHD Leon Rasalis
----,(GETDATE(),'1.1.3','gastos ajuste',0,2349.77) --Banco BHD Leon adelson
--,(GETDATE(),'1.1.1','impuesto por pago automatico de cuota',0,2613.92) --Banco Popular 
----,(GETDATE(),'1.1.2','agua para sebastian',0,79) --Banco Progreso 



----otros ingress
--insert into diario
--values
----(GETDATE(),'1.2.2','Ingreso Sobrante gabriel haitiano',5,0) --caja prestamo
--(GETDATE(),'1.3.2','Ganancia por inversiones bhd fondo',61,0) --Cxc inversiones bhd fondo
----@
--,(GETDATE(),'4.7','Ganancia por inversiones bhd fondo',0,61) --Ingreso otros
----(GETDATE(),'4.5','Ingreso Sobrante gabriel haitiano',0,5) --Ingreso Sobrante


----transferencia
--insert into diario
--values
----(GETDATE(),'1.3.2','para bhd fondo',7475,0), --Cxc inversiones bhd fondo
--(GETDATE(),'1.2.2','transferencia para caja prestamo',5,0) --caja prestamo
----(GETDATE(),'1.2.1','transferencia para caja personal',2000,0) --caja personal
----,(GETDATE(),'1.1.3','Transferencia hacia el bhd adelson',3000,0) --Banco BHD Leon adelson
----(GETDATE(),'1.1.1','Pago total mayra',6400,0) --Banco Popular
----,(GETDATE(),'6.4','ajuste en caja prestamo',4798.98,0) --Gasto Faltante
----@
----,(GETDATE(),'1.2.2','Pago total mayra',0,6400) --caja prestamo
----,(GETDATE(),'1.3.2','retiro para pagar cuota',0,3000) --Cxc inversiones bhd fondo
----,(GETDATE(),'1.3.4','Pago de credifassil 09/04',0,3500) -- Cxc Credifassil
----,(GETDATE(),'1.1.3','retiro para prestamos',0,19000) --Banco BHD Leon adelson
----,(GETDATE(),'1.1.2','Transferencia hacia el bhd adelson',0,15000) --Banco Progreso
----,(GETDATE(),'1.1.1','transferencia para caja prestamo',0,20000) --Banco Popular
--,(GETDATE(),'1.2.1','transferencia para caja prestamo',0,5) --caja personal




----cxc
--insert into diario
--values
----(GETDATE(),'1.1.1','nuevo prestamo del extracredito',103692.82,0), --Banco Popular
----(GETDATE(),'1.1.2','Pago de Concentra Cid',49189.83,0), --Banco Progreso
--(GETDATE(),'1.1.4','pago sueldo rosalis Los peña',7324.2,0), --Banco bhd rosalis
----(GETDATE(),'6.9','gastos varios',7324.2,0), --Gasto Otros
----@ 
----(GETDATE(),'1.3.5','Pago de nestol caro',0,2500) --Cxc Negocios Diversos
----(GETDATE(),'1.3.6','Pago de Concentra Cid',0,49189.83) --Cxc Concentra Cid
--(GETDATE(),'1.3.7','pago sueldo rosalis Los peña',0,7324.2) --Cxc Concentra Cid


----cierre del mes 03 contra ingresos
--insert into diario
--values
--(GETDATE(),'3.2','Capital Resumen de ganancia y perdida',0,50441.85)



----cierre del mes 03 contra gastos
--insert into diario
--values
--(GETDATE(),'3.2','Capital Resumen de ganancia y perdida',58970.39,0)
