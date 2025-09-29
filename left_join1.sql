--2155
/*
SELECT *, price * quantity AS order_value FROM public.order_details
LEFT JOIN public.orders
ON order_details.order_id = orders.order_id
LEFT JOIN public.products
ON order_details.product_id = products.product_id;
*/

--aliasy jdou i kombinovat
--date_trun vybere jen objednávky z ledna
--237
SELECT *, price * quantity AS order_value FROM public.order_details od
LEFT JOIN public.orders o
ON od.order_id = o.order_id
LEFT JOIN public.products
ON od.product_id = products.product_id
where date_part('month', order_date) = '01';


--select * from order_details; --order_id. product_id, quantity
--select * from orders; --customer id, date
--select * from products; --product name, category_id, unit, price

--2155
--to je ale jen join!
/*
SELECT *, price * quantity AS order_value FROM public.order_details, public.orders, public.products
WHERE order_details.order_id = orders.order_id and order_details.product_id = products.product_id;
*/

--832
/*
select * from customers
left join orders
on customers.customer_id = orders.customer_id;
*/

--830
/*
select * from customers, orders
where customers.customer_id = orders.customer_id;
*/

--tohle nejde, furt jen 830
/*
select * from customers, orders
where customers.customer_id = orders.customer_id or orders.customer_id is null; --nejde
*/
