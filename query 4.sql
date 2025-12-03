-- (Query 4) faixa salarial dos leads
-- Colunas: faixa salarial, leads (%), ordem

select
    case
        when income < 5000 then '0-5.000'
        when income < 10000 then '5.000-10.000'
        when income < 15000 then '10.000-15.000'
        when income < 20000 then '15.000-20.000'
        else '20.000+' end as "faixa salarial",
    (count(*)::float)/(select count(*) from sales.customers)::float * 100 as "leads (%)",
    case
        when income < 5000 then 1
        when income < 10000 then 2
        when income < 15000 then 3
        when income < 20000 then 4
        else 5 end as "ordem"
from sales.customers
group by "ordem"
order by "ordem" desc