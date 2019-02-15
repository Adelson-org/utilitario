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
('1.2.1','Caja para gastos personales',0,'Deudora','no','1.2'),
('1.2.2','Caja interes recibido por prestamo',0,'Deudora','no','1.2'),
('1.2.3','Caja capital recibido por prestamos',0,'Deudora','no','1.2'),
('1.2.4','Caja capital para prestamos solicitado',0,'Deudora','no','1.2'),
('1.3','CXC',0,'Deudora','si','1'),
('1.3.1','Cxc inversiones prestamos',0,'Deudora','no','1.3'),
('1.3.2','Cxc interes prestamos',0,'Deudora','no','1.3'),
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
('2.1.8','Cxp capital prestamos',0,'Acreedora','no','2.1'),
('2.1.9','Cxp intereses por prestamos',0,'Acreedora','no','2.1'),
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
(GETDATE(),'1.1.2','Inicio operacion',13.03,0),  --progreso
(GETDATE(),'1.1.3','Inicio operacion',91.39,0), --bhd adel
(GETDATE(),'1.1.4','Inicio operacion',4.44,0),  --bhd rosalis

(GETDATE(),'1.2.1','Inicio operacion',725,0),  --caja personal

(GETDATE(),'1.3.1','Inicio operacion',46500.04,0),  --cxc capital invertido prestamoo
(GETDATE(),'1.3.3','Inicio operacion',9929.09,0),   --cxc inversion bhd fondo
(GETDATE(),'1.3.4','Inicio operacion',350000,0),    --cxc inversiones popular

--@

(GETDATE(),'3.1','Inicio operacion',0,408349.66) --capital inicio operacion 



-- ingresos interes y capoital cobrado
insert into diario
values
(GETDATE(),'1.2.2','interes recibido de prestamo',219.30,0), --caja interes cobrado 
--@
(GETDATE(),'4.6','interes recibido de prestamo',0,219.30) --ingreso interes prestamo 103


insert into diario
values
(GETDATE(),'1.2.3','capital recibido',2310.70,0), --caja capital cobrado
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
(GETDATE(),'1.2.3','ajuste de capital faltante',0,1500) --caja capital cobrado
 
 
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
(GETDATE(),'1.2.3','invertido en prestamo',0,500),--caja capital cobrado
(GETDATE(),'1.2.4','invertido en prestamo',0,6000)--caja capital para invertir


--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.2','interes cobrado el 11/02',142.79,0), --cxc inversiones prestamos
--@
(GETDATE(),'4.6','interes cobrado el 11/02',0,142.79) --caja gastos personales


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.3','capital recuperado cobrado el 11/02',1497.21,0), --caja capital cobrado
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
(GETDATE(),'1.2.2','interes cobrado',159.15,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,159.15) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.3','capital recuperado',1740.85,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,1740.85) --cxc inversiones prestamos


--gastos
insert into diario
values
(GETDATE(),'6.8','proteina',503,0), --medicina
(GETDATE(),'6.9','avena leche y otros',320,0), --compra del hogar
(GETDATE(),'6.21','seguro deudor del extracredito popular',440,0), --seguro deudor
--@
(GETDATE(),'1.1.1','gastos generales',0,1263) --banco popular


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
(GETDATE(),'1.2.3','Invertido en prestamo',0,5000) --caja capital cobrado


--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.2','interes cobrado',228.79,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,228.79) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.3','capital recuperado',2036.21,0), --caja capital cobrado
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
(GETDATE(),'1.1.1','Invertido en prestamo',0,25000) --caja capital cobrado


--intereses cobrados
insert into diario
values
(GETDATE(),'1.2.2','interes cobrado',119.73,0), --Caja interes recibido por prestamo
--@
(GETDATE(),'4.6','interes cobrado',0,119.73) --ingresos por prestamo


--capital cobrado
insert into diario
values
(GETDATE(),'1.2.3','capital recuperado',1175.27,0), --caja capital cobrado
--@
(GETDATE(),'1.3.1','capital recuperado',0,1175.27) --cxc inversiones prestamos


--gastos efectivo
insert into diario
values
(GETDATE(),'6.11','chucheria',60,0), --chucheria y fiesta
(GETDATE(),'6.9','comida',75,0), --gasto compras del hogar
--@
(GETDATE(),'1.2.1','gastos',0,135) --caja gasto personal





--transferencia entre cajas
insert into diario
values
(GETDATE(),'1.2.1','para cena',25,0), --caja personal
--@
(GETDATE(),'1.2.3','para cena',0,25) --caja capital cobrado


--transferencia 
insert into diario
values
(GETDATE(),'1.1.1','Prestamo recibido',75000,0), --banco popular
--@
(GETDATE(),'2.1.8','Prestamo recibido',0,75000) --Cxp capital prestamos



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


select * from cuentas 
