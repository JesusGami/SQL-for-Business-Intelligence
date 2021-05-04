-- 1.JOINS, a veces el uso LEFT JOIN y NULL's importa y condiciones en el JOIN

-- select zebra::date, 'zebra'
-- from generate_series('2007-02-01', '2007-02-28', interval '1 day') as zebra
-- union
-- select monkey::date, 'monkey'
-- from generate_series('2007-03-01', '2007-03-28', interval '1 day') as monkey
-- order by 1,2

-- select zebra::date, 'zebra', p.*
-- from generate_series('2007-02-01', '2007-02-28', interval '1 day') as zebra
-- left join payment p on p.payment_date::date = zebra::date
-- where p.staff_id = 2
-- order by 3 nulls first

-- select zebra::date, 'zebra', p.*
-- from generate_series('2007-02-01', '2007-02-28', interval '1 day') as zebra
-- left join payment p on p.payment_date::date = zebra::date and p.staff_id = 2
-- order by 3 nulls first

-- 2.Encadenando condiciones(rental_id > 1400 y payment_hour está entre 8am al mediodía o  de 2pm a 3pm)

with base_table as (
		select zebra::date, 'zebra', p.*
		from generate_series('2007-02-01', '2007-02-28', interval '1 day') as zebra
		left join payment p on p.payment_date::date = zebra::date and p.staff_id = 2
		order by 3 nulls first
)

-- select * 
-- from base_table bt
-- where bt.rental_id > 1400
-- and 
-- (
-- 	extract(hour from bt.payment_date) in (8,9,10,11)
-- 	or extract(hour from bt.payment_date) in (14)
-- )
-- order by 6

select * 
from base_table bt
where bt.rental_id > 1400
and extract(hour from bt.payment_date) in (8,9,10,11,14)




