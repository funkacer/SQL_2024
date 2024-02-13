-- select * from public.bill2;

--product
--CREATE AGGREGATE public.cumulative_mul(int8) (SFUNC = int8mul, STYPE = int8);

with t1 as (select id, amount, row_number() OVER (ORDER by amount) from public.bill)
select id, amount, row_number, sum(amount) OVER w, public.cumulative_mul(amount/100) OVER w
  from t1
  Window w AS (ORDER by row_number)
  ORDER BY amount;