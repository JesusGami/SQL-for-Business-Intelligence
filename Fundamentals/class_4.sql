-- 1. ¿Cuántos clitnes compran en diferentes tiendas?

-- select * 
-- from (
-- 	select t.customer_id, count(*) 
-- 		from(
-- 			select distinct r.customer_id, s.store_id
-- 			from rental r
-- 			left join staff s
-- 			on r.staff_id = s.staff_id
-- 			order by 1
-- 		) t
-- 	group by 1
-- 	) t2
-- where t2.customer_id < 10

-- 2. Ejemplos con CTE's (Common Table Expressions)

with base_table as (
		select distinct r.customer_id, s.store_id
		from rental r
		left join staff s
		on r.staff_id = s.staff_id
		order by 1),

another_base_table as (
		select bt.customer_id, 
		count(*)
		from base_table bt
		group by 1)

select * 
from another_base_table abt
where customer_id < 10

