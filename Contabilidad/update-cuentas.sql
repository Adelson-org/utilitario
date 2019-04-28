
-- reiniciando saldos
UPDATE cuentas SET Saldo=0;

-- actualizar nivel 3 (0.0.0)
UPDATE cuentas a  SET a.Saldo=
IFNULL((SELECT SUM(b.debito-b.credito) FROM diario b WHERE a.Cuenta=b.cuenta),0)
WHERE a.Naturaleza='deudora'

UPDATE a  SET a.Saldo=
CAST(ISNULL((SELECT SUM(b.credito-b.debito) FROM diario b WHERE a.Cuenta=b.cuenta),0) AS DECIMAL(12,2))
FROM cuentas a 
WHERE a.Naturaleza='acreedora'


--actualizar nivel 2 (0.0)
UPDATE a  SET a.Saldo=
CAST(ISNULL((SELECT SUM(b.saldo) FROM cuentas b WHERE b.madre=a.cuenta),0) AS DECIMAL(12,2))
FROM cuentas  a 
WHERE a.Saldo=0


--actualizar nivel 1 (0)
UPDATE a  SET a.Saldo=
CAST(ISNULL((SELECT SUM(b.saldo) FROM cuentas b WHERE b.madre=a.cuenta ),0) AS DECIMAL(12,2))
FROM cuentas  a 
WHERE a.Saldo=0 AND LEN(a.Cuenta)=1

SELECT * FROM cuentas ORDER BY cuenta


