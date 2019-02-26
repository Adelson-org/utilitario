use ContabilidadDB

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
('1.2.1','Caja gastos personales',0,'Deudora','no','1.2'),
--('1.2.2','Caja interes recibido por prestamo',0,'Deudora','no','1.2'),
--('1.2.4','Caja ingresos por prestamos',0,'Deudora','no','1.2'),
('1.2.4','Caja disponible para prestamo',0,'Deudora','no','1.2'),
('1.3','CXC',0,'Deudora','si','1'),
('1.3.1','Cxc inversiones prestamos',0,'Deudora','no','1.3'),
--('1.3.2','Cxc interes prestamos',0,'Deudora','no','1.3'),
('1.3.3','Cxc inversiones bhd fondo',0,'Deudora','no','1.3'),
('1.3.4','Cxc Inversiones popular',0,'Deudora','no','1.3'),
('1.3.5','Cxc Credifassil',0,'Deudora','no','1.3'),
('1.3.6','Cxc Negocios Diversos',0,'Deudora','no','1.3'),
('1.3.7','Cxc Concentra Cid',0,'Deudora','no','1.3'),
('1.3.8','Cxc Los peña',0,'Deudora','no','1.3'),
('2','PASIVO',0,'Acreedora','no','0'),
('2.1','CXP',0,'Acreedora','si','2'),
('2.1.1','Cxp Internet',0,'Acreedora','no','2.1'),
('2.1.2','Cxp Alquiler casa',0,'Acreedora','no','2.1'),
('2.1.3','Cxp Luz casa',0,'Acreedora','no','2.1'),
('2.1.5','Cxp Colegio',0,'Acreedora','no','2.1'),
('2.1.6','Cxp Combustible',0,'Acreedora','no','2.1'),
('2.1.7','Cxp Guarderia',0,'Acreedora','no','2.1'),
('2.1.8','Cxp prestamos',0,'Acreedora','no','2.1'),
--('2.1.9','Cxp intereses por prestamos',0,'Acreedora','no','2.1'),
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
	

drop table diario
create table diario
(
Fecha datetime not null,
Cuenta varchar(20) not null,
Detalle varchar(100) not null,
Debito float default 0,
Credito float default 0
)

--inicio oparacion con dinero que tengo en mi capital
insert into diario
values
(GETDATE(),'1.1.1','Inicio operacion',1086.67,0), --popular
(GETDATE(),'1.1.2','Inicio operacion',13.06,0),  --progreso
(GETDATE(),'1.1.3','Inicio operacion',91.39,0), --bhd adel
(GETDATE(),'1.1.4','Inicio operacion',4.44,0),  --bhd rosalis

(GETDATE(),'1.2.1','Inicio operacion',725,0),  --caja personal

(GETDATE(),'1.3.1','Inicio operacion',46500.04,0),  --cxc capital invertido prestamoo
(GETDATE(),'1.3.3','Inicio operacion',9929.09,0),   --cxc inversion bhd fondo
(GETDATE(),'1.3.4','Inicio operacion',350000,0),    --cxc inversiones popular

--@

(GETDATE(),'3.1','Inicio operacion',0,408349.69) --capital inicio operacion 



-- ingresos interes y capoital cobrado
insert into diario
values
(GETDATE(),'1.2.4','interes recibido de prestamo',219.30,0), --caja interes cobrado 
--@
(GETDATE(),'4.6','interes recibido de prestamo',0,219.30) --ingreso interes prestamo 103


insert into diario
values
(GETDATE(),'1.2.4','capital recibido',2310.70,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recibido',0,2310.70) --Cxc inversiones prestamos 927


--inicio oparacion con ingresos por cobrar de sueldo
insert into diario
values
(GETDATE(),'1.3.7','Sueldo',49189.83,0), --Cxc concentra cid
(GETDATE(),'1.3.8','Sueldo',14648.40,0), -- cxc los pena
--@
(GETDATE(),'4.2','Sueldo',0,63838.23) --ingreso de sueldo




--inicio oparacion con ingresos por cobrar de iguala
insert into diario
values
(GETDATE(),'1.3.6','iguala',2500,0), --Cxc Negocios Diversos
(GETDATE(),'1.3.5','iguala',3500,0), --Cxc Credifassil
--@
(GETDATE(),'4.1','iguala',0,6000) --ingreso de iguala



-- cxp
insert into diario
values
(GETDATE(),'6.3','internet',1235,0), --gasto comunicacion
--@
(GETDATE(),'2.1.1','internet',0,1235) --cxp internet


--cxp
insert into diario
values
(GETDATE(),'6.5','combustible',1200,0), --vehiculo
--@
(GETDATE(),'2.1.6','combustible',0,1200) --cxp combustible


--cxp
insert into diario
values
(GETDATE(),'1.1.1','Extra credito popular',10500,0), --banco popular
(GETDATE(),'1.3.1','Extra credito popular',39500,0), --cxc inversiones prestamo
--@
(GETDATE(),'2.1.8','Extra credito popular',0,50000) --cxp capital prestamo



--*******************************************************
--                     para asientos
--*******************************************************
insert into diario
values
(GETDATE(),'6.9','gasto del dia',295,0), 
--@
(GETDATE(),'1.2.1','gasto del dia',0,295) 
 

--ajuste del capital en caja
insert into diario
values
(GETDATE(),'6.4','ajuste de capital faltante',1500,0), --faltante
--@
(GETDATE(),'1.2.4','ajuste de capital faltante',0,1500) --caja capital cobrado
 
 
 --retiro de banco
insert into diario
values
(GETDATE(),'1.2.1','retiro del bopular',4000,0), --caja personal
(GETDATE(),'1.2.4','retiro del bopular',6000,0), --caja para prestamo
--@
(GETDATE(),'1.1.1','retiro del bopular',0,10000) --banco popular
 
 
 
 --inversiones y retiros
insert into diario
values
(GETDATE(),'1.3.1','invertido en prestamo',10000,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.1','invertido en prestamo',0,3500), --caja gastos personales
(GETDATE(),'1.2.4','invertido en prestamo',0,500),--caja capital cobrado
(GETDATE(),'1.2.4','invertido en prestamo',0,6000)--caja capital para invertir


--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado el 11/02',142.79,0), --cxc inversiones prestamos
--@
(GETDATE(),'4.6','interes cobrado el 11/02',0,142.79) --caja gastos personales


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado cobrado el 11/02',1497.21,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado cobrado el 11/02',0,1497.21) --cxc inversiones prestamos


--gastos
insert into diario
values
(GETDATE(),'6.9','gastos generales',140,0), --compra del hogar
(GETDATE(),'6.11','gastos generales',95,0), --compra del hogar
--@
(GETDATE(),'1.2.1','gastos generales',0,235) --caja gastos personales 95




--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',159.15,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,159.15) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',1740.85,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,1740.85) --cxc inversiones prestamos


--gastos
insert into diario
values
(GETDATE(),'6.8','proteina',503,0), --medicina
(GETDATE(),'6.9','avena leche y otros',320,0), --compra del hogar
--(GETDATE(),'6.21','seguro deudor del extracredito popular',440,0), --seguro deudor
--@
(GETDATE(),'1.1.1','gastos generales',0,823) --banco popular  440


--gastos
insert into diario
values
(GETDATE(),'6.8','pastilla antigripal',50,0), --medicina
(GETDATE(),'6.11','frutas y otros',110,0), --checheria y fiesta
(GETDATE(),'6.9','compras del hogar',135,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','frutas y otros',0,295) --caja gasto personal


--------****************13/02/19***************-------

--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',5000,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,5000) --caja capital cobrado


--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',228.79,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,228.79) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',2036.21,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,2036.21) --cxc inversiones prestamos



--gastos efectivo
insert into diario
values
(GETDATE(),'6.1','crema para la piel adelson',100,0), --salud
(GETDATE(),'6.11','arina y pan',65,0), --chucheria y fiesta
(GETDATE(),'6.9','compras del hogar',115,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','frutas y otros',0,280) --caja gasto personal



--*******************************************************






--------****************14/02/19***************-------

--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',25000,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.1.1','Invertido en prestamo',0,25000) --Banco Popular


--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',119.73,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,119.73) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',1175.27,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,1175.27) --cxc inversiones prestamos


--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',60,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',75,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','gastos',0,135) --caja gasto personal







--transferencia 
insert into diario
values
(GETDATE(),'1.1.1','Prestamo recibido',75000,0), --banco popular
--@
(GETDATE(),'2.1.8','Prestamo recibido',0,75000) --Cxp capital prestamos



--*******************************************************




--------****************15/02/19***************-------

--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',17000.02,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.1.1','Invertido en prestamo',0,9000), --Banco Popular
(GETDATE(),'1.2.4','Invertido en prestamo',0,8000) --caja capital recibido



--transferencia popular a caja personal
insert into diario
values
(GETDATE(),'1.2.1','retiro para gastos',1000,0), --caja personal
--@
(GETDATE(),'1.1.1','retiro para gastos',0,1000) --banco popular




--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',642.18,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,642.18) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',7067.82,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,7067.82) --cxc inversiones prestamos





--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',60,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',220,0), --gasto compras del hogar
(GETDATE(),'6.8','Medicina',257,0), --Gasto Medicina y consulta
--@
(GETDATE(),'1.2.1','gastos',0,537) --caja gasto personal



--gastos banco popular
insert into diario
values
(GETDATE(),'2.1.6','combustible carro',600,0), --cxp combustible
(GETDATE(),'6.21','Seguro deudor por prestamo',2340,0), --gasto otros
(GETDATE(),'6.21','Seguro deudor por Extra Credito',390,0), --gasto otros
--@
(GETDATE(),'1.1.1','combustible y seguuro deudor por prestamos',0,3330) --banco popular


--recibido de cxc e ingresos
insert into diario
values
(GETDATE(),'1.1.4','quincena rosalis 15/02/19',8630.76,0), --bhd leon rosalis
--@
(GETDATE(),'4.3','quincena rosalis 15/02/19',0,1306.56), --Ingreso horas extras
(GETDATE(),'1.3.8','quincena rosalis 15/02/19',0,7324.2) --Cxc Los peña



--Prestamos recibidos 
insert into diario
values
(GETDATE(),'1.1.4','Prestamo recibido',70000,0), --bhd leon rosalis
--@
(GETDATE(),'2.1.8','Prestamo recibido',0,70000) --Cxp capital prestamos



--gastos banco bhd rosalis
insert into diario
values
(GETDATE(),'6.21','Seguro deudor por prestamo',4578,0), --gasto otros
(GETDATE(),'6.21','intento de retiro sin fondo',40,0), --gasto otros
--@
(GETDATE(),'1.1.4','seguro deudor por prestamos',0,4618) --banco bhd rosalis 4578



--retiro del popular para caja para prestamo
insert into diario
values
(GETDATE(),'1.2.4','retiro para prestar',50000,0), --Caja gastos para prestamo
--@
(GETDATE(),'1.1.1','retiro para prestar',0,20000), --banco popular
(GETDATE(),'1.1.4','retiro para prestar',0,30000) --bhd leon rosalis


--gastos banco popular
insert into diario
values
(GETDATE(),'6.21','cargo y tarjeta popular',72.50,0), --gasto otros
--(GETDATE(),'6.21','Ajuste por descuadre',89.58,0), --gasto otros 89.58
(GETDATE(),'6.9','compra en aprezio',3029.58,0), --compra casa 
--@
(GETDATE(),'1.1.1','compra y otros',0,3102.08) --banco popular 


--*******************************************************







--------****************16/02/19***************-------

--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',10000.02,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,10000) --caja para prestamo




--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',729.43,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,729.43) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',2900.57,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,2900.57) --cxc inversiones prestamos


--*******************************************************








--------****************17/02/19***************-------

--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',26499.79,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,26499.79) --caja para prestamo


--transf. por nota de credito
insert into diario
values
(GETDATE(),'1.2.4','Nota de credito por saldo a prestamo',1000,0), --caja para prestamo
--@
(GETDATE(),'1.3.1','Nota de credito por saldo a prestamo',1000,0) --cxc inversiones prestamos




--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',786.95,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,671.66), --ingresos por prestamo
(GETDATE(),'4.7','interes cobrado',0,115.29) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',6043.25,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,6043.25) --cxc inversiones prestamos


--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',75,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',140,0), --gasto compras del hogar
(GETDATE(),'6.3','recarga',40,0), --Gasto Comunicacion
--@
(GETDATE(),'1.2.1','gastos',0,255) --caja gasto personal


--*******************************************************




--------****************18/02/19***************-------

--transf. por nota de credito
insert into diario
values
(GETDATE(),'1.1.3','deposito al bhd adelson',56300,0), --bhd leon adelson
--@
(GETDATE(),'1.2.4','deposito al bhd adelson',0,14500), --caja capital para invertir
(GETDATE(),'1.2.4','deposito al bhd adelson',0,9771.88), --caja capital reibido
(GETDATE(),'1.2.4','deposito al bhd adelson',0,2028.12), --caja interes recibido
(GETDATE(),'1.1.4','deposito al bhd adelson',0,30000) --bhd leon adelson

--cobro igualas
insert into diario
values
(GETDATE(),'1.1.1','pago carlos y nestol',6000,0), --banco popular
--@
(GETDATE(),'1.3.5','pago carlos y nestol',0,3500), --Cxc Credifassil
(GETDATE(),'1.3.6','pago carlos y nestol',0,2500) --Cxc Negocios Diversos




--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',859.71,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,859.71) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',4040.29,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,4040.29) --cxc inversiones prestamos





--transf. 1000 de capital recibido a caja persona
insert into diario
values
(GETDATE(),'1.2.1','para gastos personal',1000,0), --caja personal
--@
(GETDATE(),'1.2.4','para gastos personal',0,1000) --caja capital cobrado



--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',6170,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,1000), --caja para prestamo
(GETDATE(),'1.1.4','Invertido en prestamo',0,5000), --bhd rosalis
(GETDATE(),'4.6','ingresos por prestamo',0,170) --ingresos interes prestamo




--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',73,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',170,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','gastos',0,243) --caja gasto personal


--*******************************************************






--------****************19/02/19***************-------

--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',9500,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.1.1','Invertido en prestamo',0,4500), --banco popular
(GETDATE(),'1.2.4','Invertido en prestamo',0,5000) --caja capital cobrado



--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',615.63,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,615.63) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',5014.37,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,5014.37) --cxc inversiones prestamos






--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',60,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',112,0), --gasto compras del hogar
(GETDATE(),'2.1.1','internet',1235,0), --cxp internet
--@
(GETDATE(),'1.1.1','internet',0,1235), --banco popular
(GETDATE(),'1.2.1','gastos',0,172) --caja gasto personal


--*******************************************************






--------****************20/02/19***************-------

--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',31000,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.1.1','Invertido en prestamo',0,14500), --banco popular
(GETDATE(),'1.2.4','Invertido en prestamo',0,6500), --caja capital cobrado
(GETDATE(),'1.1.3','Invertido en prestamo',0,1000), --Banco BHD Leon adelson
(GETDATE(),'1.1.4','Invertido en prestamo',0,9000) --Banco BHD Leon Rosalis



----ajuste descuadre
--insert into diario
--values
--(GETDATE(),'1.1.1','Por descuadre',529.59,0), --banco popular
----@
--(GETDATE(),'4.5','Por descuadre',0,529.59) --ingresos sobrante


--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',100,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',145,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','gastos',0,245) --caja gasto personal



--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.4','interes cobrado',312.54,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,312.54) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.4','capital recuperado',2612.46,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,2612.46) --cxc inversiones prestamos


--cxc inversiones prestamo
insert into diario
values
(GETDATE(),'6.4','descuento para reenganche',1942.79,0), --gastos faltante
--@
(GETDATE(),'1.3.1','descuento para reenganche',0,1942.79) --cxc inversiones prestamos



--*******************************************************






--------****************21/02/19***************-------

--transferencia
insert into diario
values
(GETDATE(),'1.2.4','retiro para parestamo',10000,0), --Caja disponible para prestamo
--@
(GETDATE(),'1.1.3','retiro para parestamo',0,10000) --banco bhd leon adelson



--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',17863.15,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,17863.15) --Caja disponible para prestamo




--nota de credito por reenganche
insert into diario
values
(GETDATE(),'1.2.4','Invertido en prestamo',4362.21,0), --Caja disponible para prestamo
--@
(GETDATE(),'1.3.1','Invertido en prestamo',0,4362.21) --cxc inversiones prestamos




--gastos tarjeta
insert into diario
values
(GETDATE(),'6.11','chucheria',65,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',199.86,0), --gasto compras del hogar
--@
(GETDATE(),'1.1.3','gastos',0,264.86) --Banco BHD Leon Adelson


--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',30,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',358,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','gastos',0,388) --caja personal




----ingresos cobrados
insert into diario
values
(GETDATE(),'1.2.4','Ingresos por prestamo',4540,0), --Caja disponible para prestamo
--@
(GETDATE(),'1.3.1','Ingresos por prestamo',0,4540) --cxc inversiones prestamos



--*******************************************************






--------****************22/02/19***************-------

--transferencia
insert into diario
values
(GETDATE(),'1.2.4','retiro para prestamos',30000,0), --caja disponible para prestamo
--@
(GETDATE(),'1.1.3','retiro para prestamos',0,30000) --bhd leon adelson


--transferencia
insert into diario
values
(GETDATE(),'1.2.1','para gastos personal',2000,0), --caja personal
--@
(GETDATE(),'1.2.4','para gastos personal',0,2000) --caja disponible para prestamo


--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',17000,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,17000) --Caja disponible para prestamo



----ingresos cobrados
insert into diario
values
(GETDATE(),'1.2.4','Ingresos por prestamo',4995,0), --Caja disponible para prestamo
--@
(GETDATE(),'1.3.1','Ingresos por prestamo',0,4995) --cxc inversiones prestamos



--gastos tarjeta
insert into diario
values
(GETDATE(),'2.1.6','gas carro',600,0), --Cxp combustible
(GETDATE(),'6.9','comida',24,0), --gasto compras del hogar
--@
(GETDATE(),'1.1.3','gastos',0,624) --Banco BHD Leon Adelson




--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',35,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',110,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','gastos',0,145) --caja personal



--*******************************************************






--------****************23/02/19***************-------

--transferencia
insert into diario
values
(GETDATE(),'1.2.4','retiro para prestamos',14400,0), --caja disponible para prestamo
--@
(GETDATE(),'1.1.3','retiro para prestamos',0,14400) --bhd leon adelson


--comision por retiro con fondo insuficiente
insert into diario
values
(GETDATE(),'6.21','comision por retiro con fondo insuficiente',40,0), --otros gastos
--@
(GETDATE(),'1.1.3','comision por retiro con fondo insuficiente',0,40) --bhd leon adelson



--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',29499.77,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,29499.77) --Caja disponible para prestamo  1485.66



--capital invertido ajuste
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',1485.66,0), --cxc inversiones prestamos
--@
(GETDATE(),'4.5','Invertido en prestamo',0,1485.66) --ingresos sobrante






----ingresos cobrados
insert into diario
values
(GETDATE(),'1.2.4','Ingresos por prestamo',2510,0), --Caja disponible para prestamo
--@
(GETDATE(),'1.3.1','Ingresos por prestamo',0,2510) --cxc inversiones prestamos




--gastos tarjeta
insert into diario
values
(GETDATE(),'6.21','gastos comision',56.85,0), --otros gastos
--@
(GETDATE(),'1.1.1','gastos comision',0,56.85) --Banco popular




--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',320,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',205,0), --gasto compras del hogar
(GETDATE(),'6.5','pasaje rosalis',25,0),--Gasto Vehiculos
--@
(GETDATE(),'1.2.1','gastos',0,550) --caja personal



--ajuste sobrante
insert into diario
values
(GETDATE(),'1.2.1','Ingresos sobrante',10,0), --caja personal
--@
(GETDATE(),'4.5','Ingresos sobrante',0,10) --ingresos sobrante


--*******************************************************





--------****************24/02/19***************-------


----ingresos cobrados
insert into diario
values
(GETDATE(),'1.2.4','Ingresos por prestamo',4130,0), --Caja disponible para prestamo
--@
(GETDATE(),'1.3.1','Ingresos por prestamo',0,4130) --cxc inversiones prestamos


--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',9500,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,9500) --Caja disponible para prestamo 




--ingresos otros
insert into diario
values
(GETDATE(),'1.2.4','recibido de mario por prestamo',10000,0), --caja disponible para prestamo
--@
(GETDATE(),'4.7','recibido de mario por prestamo',0,10000) --otros ingresos




--gastos efectivo
insert into diario
values
--(GETDATE(),'6.11','chucheria',320,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',311,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','gastos',0,311) --caja personal


--*******************************************************







--------****************25/02/19***************-------

--transferencia
insert into diario
values
(GETDATE(),'1.2.4','para prestamos',40000,0), --caja disponible para prestamo
(GETDATE(),'1.1.3','Para ahorro',60000,0), --bhd leon adelson Gasto interes prestamos
(GETDATE(),'6.7','intereses a pagar',3500,0), --Gasto interes prestamos
--@
(GETDATE(),'2.1.8','inversion de mecho',0,52100), --cxp capital prestamo
(GETDATE(),'2.1.8','inversion de jeuris',0,51400) --cxp capital prestamo



--Egresos capital invertido
insert into diario
values
(GETDATE(),'1.3.1','Invertido en prestamo',28000,0), --cxc inversiones prestamos
--@
(GETDATE(),'1.2.4','Invertido en prestamo',0,28000) --Caja disponible para prestamo  1485.66



----ingresos cobrados
insert into diario
values
(GETDATE(),'1.2.4','Ingresos por prestamo',6020,0), --Caja disponible para prestamo
--@
(GETDATE(),'1.3.1','Ingresos por prestamo',0,6020) --cxc inversiones prestamos



--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',55,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',165,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','gastos',0,220) --caja personal



----ajuste sobrante
--insert into diario
--values
--(GETDATE(),'1.2.1','Ingresos sobrante',10,0), --caja personal
----@
--(GETDATE(),'4.5','Ingresos sobrante',0,10) --ingresos sobrante


--*******************************************************









--reiniciando saldos
update cuentas set Saldo=0;

--actualizar nivel 3 (0.0.0)
update a  set a.Saldo=
isnull((select SUM(b.debito-b.credito) from diario b where a.Cuenta=b.cuenta),0)
from cuentas  a 
where a.Naturaleza='deudora'

update a  set a.Saldo=
isnull((select SUM(b.credito-b.debito) from diario b where a.Cuenta=b.cuenta),0)
from cuentas a 
where a.Naturaleza='acreedora'


--actualizar nivel 2 (0.0)
update a  set a.Saldo=
isnull((select SUM(b.saldo) from cuentas b where b.madre=a.cuenta),0)
from cuentas  a 
where a.Saldo=0


--actualizar nivel 1 (0)
update a  set a.Saldo=
isnull((select SUM(b.saldo) from cuentas b where b.madre=a.cuenta ),0)
from cuentas  a 
where a.Saldo=0 and LEN(a.Cuenta)=1

select * from cuentas 

