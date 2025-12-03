-- (Query 2) Status profissional dos leads
-- Colunas: status profissional, leads (%)

select
    case
        when professional_status = 'freelancer' then 'freelancer'
        when professional_status = 'retired' then 'aposentado'
        when professional_status = 'clt' then 'clt'
        when professional_status = 'self_employed' then 'autônomo(a)'
        when professional_status = 'other' then 'outro(a)'
        when professional_status = 'businessman' then 'empresário(a)'
        when professional_status = 'civil_servant' then 'funcionário(a) público(a)'
        when professional_status = 'student' then 'estudante'
        end as "status profissional",
    (count(*)::float)/(select count(*) from sales.customers)::float * 100 as "leads (%)"

from sales.customers
group by professional_status
order by "leads (%)"