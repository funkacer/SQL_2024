--2155
/*
SELECT *, price * quantity AS order_value FROM public.order_details
LEFT JOIN public.orders
ON order_details.order_id = orders.order_id
LEFT JOIN public.products
ON order_details.product_id = products.product_id;
*/

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
select * from customers, orders
where customers.customer_id = orders.customer_id or orders.customer_id is null; --nejde
