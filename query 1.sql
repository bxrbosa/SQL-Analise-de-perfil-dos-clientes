-- (Query 1) Gênero dos leads
-- Colunas: gênero, leads (#)

select
    case
        when ibge.gender = 'male' then 'homens'
        when ibge.gender = 'female' then 'mulheres'
        end as "gênero",
    count(*) as "leads (#)"

from sales.customers as customers
left join temp_tables.igbe_genders as igbe
    on lower(cus.first_name) = lower(igbe.first_name)
group by ibge.gender