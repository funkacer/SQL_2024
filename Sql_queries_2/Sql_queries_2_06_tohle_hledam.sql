SELECT 
	  id,
	  type,
	  amount,
	  RANK() OVER (ORDER BY type desc),
	  DENSE_RANK() OVER (ORDER BY type desc),
	  row_number() OVER (ORDER BY type desc),
	  row_number() OVER (ORDER BY type desc) - RANK() OVER (ORDER BY type desc) as order_from_zero,
	  row_number() OVER (PARTITION BY type) as order_from_one,
	  RANK() OVER(PARTITION BY amount ORDER BY type) as stejny_amount_jiny_type
	FROM bill;
	

SELECT 
	  id,
	  type,
	  amount,
	  RANK() OVER (ORDER BY amount ),
	  DENSE_RANK() OVER (ORDER BY amount),
	  row_number() OVER (ORDER BY amount),
	  row_number() OVER (ORDER BY amount) - RANK() OVER (ORDER BY amount) as order_from_zero,
	  row_number() OVER (PARTITION BY amount) as order_from_one,
	  RANK() OVER(PARTITION BY amount ORDER BY type) as stejny_amount_jiny_type
	FROM bill2;

SELECT 
	  id,
	  type,
	  amount,
	  RANK() OVER (ORDER BY amount ),
	  DENSE_RANK() OVER (ORDER BY amount),
	  row_number() OVER (ORDER BY amount),
	  row_number() OVER (ORDER BY amount) - RANK() OVER (ORDER BY amount) as order_from_zero,
	  row_number() OVER (PARTITION BY amount) as order_from_one,
	  RANK() OVER(PARTITION BY amount ORDER BY type) as stejny_amount_jiny_type
	FROM bill3;

/*
with t1 as (select distinct t.amount, type, lag(t.amount, 1)  OVER (order by t.amount) = t.amount and lag(type, 1) OVER (order by t.amount) != type as mycheck from
(SELECT amount, count(*) FROM bill3
group by amount
having count(*) > 1
order by count(*) desc) t
JOIN
(select * from bill3) tt
on tt.amount = t.amount
ORDER by t.amount)
--select * from t1;
select * from
(select amount from t1 where mycheck = true) t
join
(select * from bill3) tt
on t.amount = tt.amount;

--select * from bill2;
*/

select *, row_number() OVER(ORDER BY amount), RANK() OVER(ORDER BY amount), RANK() OVER(PARTITION BY type ORDER BY amount) ,
RANK() OVER(PARTITION BY amount ORDER BY type) as tohle_hledam, RANK() OVER(PARTITION BY amount
), RANK() OVER(ORDER BY type) from bill3;

/*
with t1 as (select *, 
RANK() OVER(PARTITION BY nace ORDER BY nazev) as tohle_hledam from nace_podklad2)
select * from nace_podklad2 where nace in (select nace from t1 where tohle_hledam > 1)
ORDER BY nace;
*/
