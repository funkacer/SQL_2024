-- select * from public.bill2;

select type, amount, sum(amount) over w, rank() over w, dense_rank() over w, row_number() over(),
  row_number() over w as row_number_amount, row_number() over(order BY type) as row_number_type,
  row_number() over(partition BY type order BY amount) as row_number_in_type
  from public.bill2
  WINDOW w AS (order BY amount);