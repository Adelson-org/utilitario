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



