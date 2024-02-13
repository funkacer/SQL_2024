SELECT *, price * quantity AS order_value FROM public.order_details
LEFT JOIN public.orders
ON order_details.order_id = orders.order_id
LEFT JOIN public.products
ON order_details.product_id = products.product_id