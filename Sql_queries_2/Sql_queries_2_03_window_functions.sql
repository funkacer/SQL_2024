-- select * from public.bill2;

--last a nth se vztahují k řádku, který se právě vyhodnocuje
select *, row_number() over w, nth_value(type = 'F', 2) OVER w,
  first_value(type) OVER w, last_value(type) OVER w,
  lag(amount, 1) OVER w, lead(amount, 1) OVER w, 
  percent_rank () OVER w, cume_dist () OVER w, ntile (2) OVER w
  from public.bill2
  WINDOW w AS (partition BY month order BY amount); 