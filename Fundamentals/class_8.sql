-- Subconsultas correlacionadas

-- 1. Obtener la cantidad total de las rentas de los clientes así como el total en el mes cuando hizo su primera orden

-- select p.customer_id, sum(p.amount) as ltv, (select extract(month from min(p2.payment_date)) 
-- 											 from payment p2 
-- 											 where p2.customer_id = p.customer_id) as first_order
-- from payment p
-- group by 1


with base_table as (
select p.customer_id, sum(p.amount) as ltv, (select extract(month from min(p2.payment_date)) 
											 from payment p2 
											 where p2.customer_id = p.customer_id) as first_order
from payment p
group by 1)

select bt.*, (
	select sum(p3.amount) 
	from payment p3
	where p3.customer_id = bt.customer_id
	and extract(month from p3.payment_date) = bt.first_order
) as rental_amount_month1
from base_table bt