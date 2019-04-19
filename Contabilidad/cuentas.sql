
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
('1.2.1','Caja personal',0,'Deudora','no','1.2'),
('1.2.2','Caja prestamo',0,'Deudora','no','1.2'),
('1.3','CXC',0,'Deudora','si','1'),
('1.3.1','Cxc inversiones prestamos',0,'Deudora','no','1.3'),
('1.3.2','Cxc inversiones bhd fondo',0,'Deudora','no','1.3'),
('1.3.3','Cxc Inversiones popular (06/06)',0,'Deudora','no','1.3'),
('1.3.4','Cxc Credifassil (30)',0,'Deudora','no','1.3'),
('1.3.5','Cxc Negocios Diversos (15)',0,'Deudora','no','1.3'),
('1.3.6','Cxc Concentra Cid (30)',0,'Deudora','no','1.3'),
('1.3.7','Cxc Los peña (15 y 30)',0,'Deudora','no','1.3'),
('2','PASIVO',0,'Acreedora','no','0'),
('2.1','CXP',0,'Acreedora','si','2'),
('2.1.1','Cxp Altice Internet (15)',0,'Acreedora','no','2.1'),
('2.1.2','Cxp Alquiler casa (30)',0,'Acreedora','no','2.1'),
('2.1.3','Cxp Luz casa',0,'Acreedora','no','2.1'),
('2.1.4','Cxp Colegio (30)',0,'Acreedora','no','2.1'),
('2.1.5','Cxp Guarderia',0,'Acreedora','no','2.1'),
('2.1.6','Cxp prestamo banco popular (12)',0,'Acreedora','no','2.1'),
('2.1.7','Cxp ExtraCredito banco popular (06)',0,'Acreedora','no','2.1'),
('2.1.8','Cxp prestamo bhd leon adelson (03)',0,'Acreedora','no','2.1'),
('2.1.9','Cxp prestamo bhd leon rosalis (15)',0,'Acreedora','no','2.1'),
('2.1.10','Cxp prestamo Mecho (25/05)',0,'Acreedora','no','2.1'),
('2.1.11','Cxp prestamo jeuris (25/04)',0,'Acreedora','no','2.1'),
('2.1.12','Cxp gastos legales (15 y 30)',0,'Acreedora','no','2.1'),
('2.1.13','Cxp Altice 200 min (los 30)',0,'Acreedora','no','2.1'),
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
	





