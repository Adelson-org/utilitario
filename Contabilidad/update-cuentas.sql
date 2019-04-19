use ContabilidadDB

--reiniciando saldos
update cuentas set Saldo=0;

--actualizar nivel 3 (0.0.0)
update a  set a.Saldo=
cast(isnull((select SUM(b.debito-b.credito) from diario b where a.Cuenta=b.cuenta),0) as decimal(12,2))
from cuentas  a 
where a.Naturaleza='deudora'

update a  set a.Saldo=
cast(isnull((select SUM(b.credito-b.debito) from diario b where a.Cuenta=b.cuenta),0) as decimal(12,2))
from cuentas a 
where a.Naturaleza='acreedora'


--actualizar nivel 2 (0.0)
update a  set a.Saldo=
cast(isnull((select SUM(b.saldo) from cuentas b where b.madre=a.cuenta),0) as decimal(12,2))
from cuentas  a 
where a.Saldo=0


--actualizar nivel 1 (0)
update a  set a.Saldo=
cast(isnull((select SUM(b.saldo) from cuentas b where b.madre=a.cuenta ),0) as decimal(12,2))
from cuentas  a 
where a.Saldo=0 and LEN(a.Cuenta)=1

select * from cuentas order by cuenta


