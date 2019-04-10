select * from diario order by fecha desc


--delete from diario where Fecha='2019-04-02 16:43:00.413'


select * from diario where cuenta like '1.2.4%'  order by fecha desc




update diario set Credito=debito 
where cuenta like '6.%'
and credito=0