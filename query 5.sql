-- (Query 5) Classificação dos veículos visitados
-- Colunas: classificação do veículo, veículos visitados (#)
-- Regra de negòcio: Veículos novos até 2 anos e seminovos acima de 2 anos

with
    classificação_veiculos as (

        select
            fun.visit_page_date,
            pro.model_year,
            extract('year' from visit_page_date) - pro.model_year::int as idade_veiculo,
            case
                when (extract('year' from visit_page_date) - pro.model_year::int) <= 2 then 'Novo'
                else 'Seminovo' end as "classificação do veículo"

        from sales.funnel as fun 
        left join sales.products as pro 
            on fun.product_id = pro.product_id
    )

select
    "classificação do veículo",
    count(*) as "veículos visitados (#)"
from classificação_veiculos
group by "classificação do veículo"