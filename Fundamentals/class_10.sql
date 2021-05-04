-- Manipulando fechas y horas

-- 1. EXTRACT

-- select p.*, 
-- 		extract(year from p.payment_date),
-- 		extract(month from p.payment_date),
-- 		extract(week from p.payment_date),
-- 		extract(dow from p.payment_date)
-- from payment p
-- where extract(dow from p.payment_date) in (0,6)

-- 2. ::date

-- select p.*, p.payment_date::date,
-- 		extract(year from p.payment_date),
-- 		extract(month from p.payment_date),
-- 		extract(week from p.payment_date),
-- 		extract(dow from p.payment_date)
-- from payment p
-- where extract(dow from p.payment_date) in (0,6)

--3. to_char

-- select p.*, 
-- 		to_char(p.payment_date::date, 'YYYY/Month/DD'),
-- 		extract(year from p.payment_date),
-- 		extract(month from p.payment_date),
-- 		extract(week from p.payment_date),
-- 		extract(dow from p.payment_date)
-- from payment p
-- where extract(dow from p.payment_date) in (0,6)

--4.Current date

-- select p.*, 
-- 		to_char(p.payment_date::date, 'YYYY/Month/DD'),
-- 		current_date,
-- 		extract(year from p.payment_date),
-- 		extract(month from p.payment_date),
-- 		extract(week from p.payment_date),
-- 		extract(dow from p.payment_date)
-- from payment p
-- where extract(dow from p.payment_date) in (0,6)

-- 5. age
-- select p.*, 
-- 		to_char(p.payment_date::date, 'YYYY/Month/DD'),
-- 		current_date,
-- 		extract(year from p.payment_date),
-- 		extract(month from p.payment_date),
-- 		extract(week from p.payment_date),
-- 		extract(dow from p.payment_date),
-- 		age(p.payment_date)
-- from payment p
-- where extract(dow from p.payment_date) in (0,6)

-- 6. INTERVAL
select p.*, 
		to_char(p.payment_date::date, 'YYYY/Month/DD'),
		current_date,
		extract(year from p.payment_date),
		extract(month from p.payment_date),
		extract(week from p.payment_date),
		extract(dow from p.payment_date),
		age(p.payment_date),
		p.payment_date - INTERVAL '7 days' as days_7_b4_pmt
from payment p
where extract(dow from p.payment_date) in (0,6)




