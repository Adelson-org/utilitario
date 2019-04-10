
drop table cuentas
create table cuentas
( 
Cuenta varchar(20) not null,
Nombre varchar(100) not null,
Saldo float default 0, 
Naturaleza varchar(15) not null,
BC varchar(2) not null, --balanza comprobacion='si' o 'no'
Madre varchar(20) not null
)


insert into cuentas
values
('1','ACTIVO',0,'Deudora','no','0'),
('1.1','BANCOS',0,'Deudora','si','1'),
('1.1.1','Banco Popular',0,'Deudora','no','1.1'),
('1.1.2','Banco Progreso',0,'Deudora','no','1.1'),
('1.1.3','Banco BHD Leon Adelson',0,'Deudora','no','1.1'),
('1.1.4','Banco BHD Leon Rosalis',0,'Deudora','no','1.1'),
('1.2','CAJAS',0,'Deudora','si','1'),
('1.2.1','Caja personales',0,'Deudora','no','1.2'),
('1.2.2','Caja prestamo',0,'Deudora','no','1.2'),
('1.3','CXC',0,'Deudora','si','1'),
('1.3.1','Cxc prestamos',0,'Deudora','no','1.3'),
('1.3.2','Cxc inversiones bhd fondo',0,'Deudora','no','1.3'),
('1.3.3','Cxc Inversiones popular',0,'Deudora','no','1.3'),
('1.3.4','Cxc Credifassil',0,'Deudora','no','1.3'),
('1.3.5','Cxc Negocios Diversos',0,'Deudora','no','1.3'),
('1.3.6','Cxc Concentra Cid',0,'Deudora','no','1.3'),
('1.3.7','Cxc Los peña',0,'Deudora','no','1.3'),
('2','PASIVO',0,'Acreedora','no','0'),
('2.1','CXP',0,'Acreedora','si','2'),
('2.1.1','Cxp Internet',0,'Acreedora','no','2.1'),
('2.1.2','Cxp Alquiler casa',0,'Acreedora','no','2.1'),
('2.1.3','Cxp Luz casa',0,'Acreedora','no','2.1'),
('2.1.4','Cxp Colegio',0,'Acreedora','no','2.1'),
('2.1.5','Cxp Guarderia',0,'Acreedora','no','2.1'),
('2.1.6','Cxp prestamo banco popular',0,'Acreedora','no','2.1'),
('2.1.7','Cxp ExtraCredito banco popular',0,'Acreedora','no','2.1'),
('2.1.8','Cxp prestamo bhd leon adelson',0,'Acreedora','no','2.1'),
('2.1.9','Cxp prestamo bhd leon rosalis',0,'Acreedora','no','2.1'),
('2.1.10','Cxp prestamo Mecho',0,'Acreedora','no','2.1'),
('2.1.11','Cxp prestamo jeuris',0,'Acreedora','no','2.1'),
('2.1.12','Cxp gastos legales',0,'Acreedora','no','2.1'),
('3','CAPITAL',0,'Acreedora','si','0'),
('3.1','Capital Inicio operacion',0,'Acreedora','no','3'),
('3.2','Capital Resumen de ganancia y perdida',0,'Acreedora','no','3'),
('4','INGRESO',0,'Acreedora','si','0'),
('4.1','Ingreso igualas',0,'Acreedora','no','4'),
('4.2','Ingreso sueldos',0,'Acreedora','no','4'),
('4.3','Ingreso horas extras',0,'Acreedora','no','4'),
('4.4','Ingreso regalia y bonos',0,'Acreedora','no','4'),
('4.5','Ingreso Sobrante',0,'Acreedora','no','4'),
('4.6','Ingreso interes prestamos',0,'Acreedora','no','4'),
('4.7','Ingreso otros',0,'Acreedora','no','4'),
('5','COSTO ',0,'Deudora','si','0'),
('6','GASTO ',0,'Deudora','si','0'),
('6.1','Gasto ropa y cosmetico',0,'Deudora','no','6'),
('6.2','Gasto Colegio y Guarderia',0,'Deudora','no','6'),
('6.3','Gasto Comunicacion',0,'Deudora','no','6'),
('6.4','Gasto Faltante',0,'Deudora','no','6'),
('6.5','Gasto Vehiculos',0,'Deudora','no','6'),
('6.6','Gasto cargos y comision bancos',0,'Deudora','no','6'),
('6.7','Gasto interes prestamos',0,'Deudora','no','6'),
('6.8','Gasto Medicina y consulta',0,'Deudora','no','6'),
('6.9','Gasto compras del hogar',0,'Deudora','no','6'),
('6.11','Gasto fiestas y chucherias',0,'Deudora','no','6'),
('6.21','Gasto Otros',0,'Deudora','no','6')
	



--drop table diario
--create table diario
--(
--Fecha datetime not null,
--Cuenta varchar(20) not null,
--Detalle varchar(100) not null,
--Debito float default 0,
--Credito float default 0
--)



--insert into diario
--values 
--(GETDATE(),'1.1.1','Inicio operacion',83200.51,0), --Banco Popular
--(GETDATE(),'1.1.2','Inicio operacion',2594.36,0), --Banco Progreso
--(GETDATE(),'1.1.3','Inicio operacion',0,0), --Banco BHD Leon Adelson
--(GETDATE(),'1.1.4','Inicio operacion',35.19,0),  --Banco BHD Leon Rosalis

--(GETDATE(),'1.2.1','Inicio operacion',333,0),  --Caja personales
--(GETDATE(),'1.2.2','Inicio operacion',4897,0),  -- Caja prestamo  

--(GETDATE(),'1.3.1','Inicio operacion',472448.44,0),  --Cxc prestamos 
--(GETDATE(),'1.3.2','Inicio operacion',59956.62,0),  --Cxc inversiones bhd fondo
--(GETDATE(),'1.3.3','Inicio operacion',350000,0),  --Cxc Inversiones popular	
--(GETDATE(),'1.3.4','Inicio operacion',7000,0),  --Cxc Credifassil
--(GETDATE(),'1.3.5','Inicio operacion',2500,0),	--Cxc Negocios Diversos
--(GETDATE(),'1.3.6','Inicio operacion',49189.83,0),  --Cxc Concentra Cid	
--(GETDATE(),'1.3.7','Inicio operacion',14648.4,0),   --Cxc Los peña 

--(GETDATE(),'2.1.1','Inicio operacion',0,1236.76),   --Cxp Internet
--(GETDATE(),'2.1.2','Inicio operacion',0,3000),   --Cxp Alquiler casa	
--(GETDATE(),'2.1.3','Inicio operacion',0,2596.65),   --Cxp Luz casa		
--(GETDATE(),'2.1.4','Inicio operacion',0,900),   --Cxp Colegio		
--(GETDATE(),'2.1.5','Inicio operacion',0,0),   --Cxp Guarderia
--(GETDATE(),'2.1.6','Inicio operacion',0,74136.08),   --	Cxp prestamo banco popular
--(GETDATE(),'2.1.7','Inicio operacion',0,150000),--Cxp ExtraCredito banco popular
--(GETDATE(),'2.1.8','Inicio operacion',0,70000),   --Cxp prestamo bhd leon adelson
--(GETDATE(),'2.1.9','Inicio operacion',0,67571.32), --Cxp prestamo bhd leon rosalis
--(GETDATE(),'2.1.10','Inicio operacion',0,52100),   --Cxp prestamo Mecho
--(GETDATE(),'2.1.11','Inicio operacion',0,51400),   --Cxp prestamo jeuris
--(GETDATE(),'2.1.12','Inicio operacion',0,1544.56),  --Cxp gastos legales

		
--(GETDATE(),'3.1','',0,572317.98)     --Capital Inicio operacion				

