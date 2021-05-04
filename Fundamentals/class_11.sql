-- La clásula CASE 

-- 1. Obtener el número de personas cuyo primer apellido inicie con una vocal


-- select c.*, substring(c.last_name, '^[AEIOUaeiou]') as x
-- from customer c

select t.my_case_outcome, count(*) 
from (
	select c.*,
		CASE
			WHEN substring(c.last_name, '^[AEIOUaeiou]') is not null then 'last_starts_vowel'
			ELSE 'no_vowel'
			END as my_case_outcome,
		CASE
			WHEN substring(c.last_name, '^[AEIOUaeiou]') is not null then substring(c.last_name, '^[AEIOUaeiou]')
			ELSE 'no_vowel'
			END as the_letter_or_not
	from customer c
) t
group by 1

-- sum(case when x.thing = 'whatever' then 1 else 0 end) as counts_of_whatever