-- 1. Subconsultas

-- select 'above' as grouping,f.*
-- from film f 
-- where f.replacement_cost > (select avg(f2.replacement_cost) from film f2)
-- 	UNION
-- select 'below_eq' as grouping,f.*
-- from film f 
-- where f.replacement_cost <= (select avg(f2.replacement_cost) from film f2)

-- select t.grouping, count(*) 
-- from (
-- 	select 'above' as grouping,f.*
-- 	from film f 
-- 	where f.replacement_cost > (select avg(f2.replacement_cost) from film f2)
-- 		UNION
-- 	select 'below_eq' as grouping,f.*
-- 	from film f 
-- 	where f.replacement_cost <= (select avg(f2.replacement_cost) from film f2)
-- ) t
-- group by 1

-- Condición en el JOIN

-- 1. Todos los atributos de las primeras órdenes de los clientes

-- select p.customer_id, p.amount, min(p.payment_date)
-- from payment p
-- group by 1,2

select p.*
from payment p
join (
	select p2.customer_id, min(p2.payment_date) as first_date
	from payment p2
	group by 1
) t 
on t.customer_id = p.customer_id and p.payment_date = t.first_date

--select p.* from payment p

