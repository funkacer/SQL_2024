SELECT sum(order_price1), sum(order_price2), count(*), count(order_price1), count(order_price2)
 FROM public.bill4
 where order_price1 is not null;
 
select order_price1, order_price2, order_price1 + order_price2
 FROM public.bill4;

select order_price1, order_price2, coalesce(order_price1, 0)  + coalesce(order_price2, 0)
 FROM public.bill4;

with t1 as (select *, row_number() OVER() as row_id FROM public.bill4)
select order_price1, order_price2, order_price1 + order_price2 as sum, coalesce(order_price1, 0)  + coalesce(order_price2, 0) sum_opr,
 sum(order_price1) OVER(ORDER BY row_id), sum(order_price2) OVER(ORDER BY row_id),
 sum(order_price1 + order_price2) OVER(ORDER BY row_id), sum(coalesce(order_price1, 0)  + coalesce(order_price2, 0)) OVER(ORDER BY row_id)
 FROM t1
UNION ALL
select sum(order_price1), sum(order_price2), sum(order_price1 + order_price2), sum(coalesce(order_price1, 0)  + coalesce(order_price2, 0)),
null, null, null, null FROM t1;
 
--select * FROM public.bill4;