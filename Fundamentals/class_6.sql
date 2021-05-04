-- 1. Clientes cuya primer orden fue en fin de semana, fue por más de $5 y han gastado al menos $100 en total
-- Domingo = 0 y sábado = 6

-- select p.*, extract(dow from p.payment_date),
-- 		(
-- 		select sum(p3.amount) from payment p3
-- 		where p3.customer_id = p.customer_id
-- 		) as clv

-- from payment p

-- where p.payment_id = (
-- 		select min(p2.payment_id)
-- 		from payment p2
-- 		where p2.customer_id = p.customer_id
-- 		)
-- and extract(dow from p.payment_date) in (0,6)
-- and p.amount > 5
-- group by 1
-- having (
-- 	select sum(p3.amount) from payment p3
-- 	where p3.customer_id = p.customer_id
-- ) > 100


select t.* from (
	select p.*, extract(dow from p.payment_date),
			(
			select sum(p3.amount) from payment p3
			where p3.customer_id = p.customer_id
			) as clv

	from payment p

	where p.payment_id = (
			select min(p2.payment_id)
			from payment p2
			where p2.customer_id = p.customer_id
			)
	and extract(dow from p.payment_date) in (0,6)
	and p.amount > 5
) t 
where t.clv > 100


