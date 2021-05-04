-- 1. Insertando datos externos

-- select c.customer_id
-- from customer c

-- create table customer_source(
-- 	customer_id integer,
-- 	source text
-- )

with base_table as(
select cs.*, p.*
from customer_source cs
join payment p  
on p.customer_id = cs.customer_id
)

select bt.source, count(*),sum(bt.amount)::money
from base_table bt
group by 1
order by 2 desc