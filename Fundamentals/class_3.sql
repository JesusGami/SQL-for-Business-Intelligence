-- 1. ¿Todo nuestro inventario ha sido rentado?

-- select f.film_id, 
-- 		f.title, 
-- 		i.store_id,
-- 		i.inventory_id,
-- 		count(distinct r.rental_id) as rentals
-- from film f
-- left join inventory i 
-- on f.film_id = i.film_id
-- left join rental r
-- on r.inventory_id = i.inventory_id
-- group by 1,2,3,4
-- order by 3 nulls first

-- 2. La primera renta de los clientes y algunos atributos de ello

select r.customer_id, 
		min(r.rental_id) as first_order_id, 
		(
			select r2.rental_date 
			from rental r2
			where r2.rental_id = min(r.rental_id)
		)::date first_order_date
from rental r
group by 1
order by 1