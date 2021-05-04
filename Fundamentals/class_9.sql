-- Common Table Expressions (CTE's)

-- 1. El top 1 por género de 'rental amount' 

-- with nc17 as (
-- 	select f.film_id, f.title, f.rating, sum(p.amount)
-- 	from film f
-- 	join inventory i on f.film_id = i.film_id
-- 	join rental r on r.inventory_id = i.inventory_id
-- 	join payment p on p.rental_id = r.rental_id
-- 	where f.rating = 'NC-17'
-- 	group by 1,2,3
-- 	order by sum(p.amount) desc
-- 	limit 1
-- ),
-- r as(
-- 	select f.film_id, f.title, f.rating, sum(p.amount)
-- 	from film f
-- 	join inventory i on f.film_id = i.film_id
-- 	join rental r on r.inventory_id = i.inventory_id
-- 	join payment p on p.rental_id = r.rental_id
-- 	where f.rating = 'R'
-- 	group by 1,2,3
-- 	order by sum(p.amount) desc
-- 	limit 1
-- ),
-- g as(
-- 	select f.film_id, f.title, f.rating, sum(p.amount)
-- 	from film f
-- 	join inventory i on f.film_id = i.film_id
-- 	join rental r on r.inventory_id = i.inventory_id
-- 	join payment p on p.rental_id = r.rental_id
-- 	where f.rating = 'G'
-- 	group by 1,2,3
-- 	order by sum(p.amount) desc
-- 	limit 1
-- )

-- select * from nc17
-- union
-- select * from r
-- union
-- select * from g

-- Window functions

with same_table as(
select f.film_id, 
		f.title, 
		f.rating, 
		sum(p.amount),
		row_number() over(partition by f.rating order by sum(p.amount) desc)
from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id = i.inventory_id
join payment p on p.rental_id = r.rental_id
--where f.rating = 'NC-17'
group by 1,2,3
order by 3 
--limit 1
) 

select st.* 
from same_table st
where st.row_number = 1





	