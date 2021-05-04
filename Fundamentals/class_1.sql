-- 1. Vista de nuestras columnas que podemos "seleccionar"

-- SELECT * FROM PAYMENT
-- SELECT P.* FROM PAYMENT P


-- 2. Algunas "selecciones" y el uso de LIMIT/ORDER

-- select p.payment_id, p.customer_id, p.amount
-- from payment p
-- order by 2 desc , 3 asc
-- limit 5


-- 3. La clásula WHERE

-- select p.payment_id, p.customer_id, p.amount, p.payment_date
-- from payment p
-- where p.amount > 1 
-- 		and p.customer_id > 58
-- 		and extract(month from p.payment_date) = 2
-- order by 2 desc, 3

-- 4. Algunas agregaciones y el uso de GROUP BY

-- select p.payment_date::date, count(*)
-- from payment p
-- group by 1
-- order by 2 desc

-- select p.customer_id, sum(p.amount)
-- from payment p
-- group by 1

-- select p.customer_id, array_agg(p.payment_date::date)
-- from payment p
-- group by 1


