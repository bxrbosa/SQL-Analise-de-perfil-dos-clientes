-- (Query 3) faixa etária dos leads
-- Colunas: faixa etária, leads (%)

select
    case
        when datediff('years', birth_date, current_date) < 20 then '0-20'
        when datediff('years', birth_date, current_date) < 40 then '20-40'
        when datediff('years', birth_date, current_date) < 60 then '40-60'
        when datediff('years', birth_date, current_date) < 80 then '60-80'
        else '80+' end as "faixa etária",
    (count(*)::float)/(select count(*) from sales.customers) as "leads (%)"

from sales.customers
group by "faixa etária"
order by "faixa etária" desc