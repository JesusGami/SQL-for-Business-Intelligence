
-- 1. Generación de series 
select gs::date, gs2::date
from generate_series('2020-01-01', current_date::date, interval '1 day') as gs
inner join generate_series('2020-02-01', current_date::date, interval '1 day') as gs2
on gs::date = gs2::date

select gs::date, gs2::date
from generate_series('2020-01-01', current_date::date, interval '1 day') as gs
left join generate_series('2020-02-01', current_date::date, interval '1 day') as gs2
on gs::date = gs2::date


-- 2. Algunos JOINS
select * from payment

select gs::date, p.*
from generate_series('2007-02-01', '2007-02-28', interval '1 day') as gs
left join payment p on p.payment_date::date = gs::date

select gs::date, count(*)
from generate_series('2007-02-01', '2007-02-28', interval '1 day') as gs
left join payment p on p.payment_date::date = gs::date
group by 1
having count(*) = 1



