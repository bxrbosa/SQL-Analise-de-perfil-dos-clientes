-- (Query 7) Veículos mais visitados por marca
-- Colunas: marca do veículo, modelo do veículo, veículos visitados (#)

select
    pro.brand,
    pro.model,
    count(*) as "veículos visitados (#)"

from sales.funnel as fun 
left join sales.products as pro 
    on fun.product_id = pro.product_id
group by pro.brand, pro.model
order by pro.brand, pro.model, "veículos visitados (#)"