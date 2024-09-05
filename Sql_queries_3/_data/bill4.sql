SET ROLE funka;

--select * from bill3;

select * into bill4 from bill3;

delete from bill4  where id = 4;

update bill4 SET amount = null WHERE id = 5;

insert into bill4 select * from bill4;


alter table bill4 add column order_price1 int;
alter table bill4 add column order_price2 int;

--alter table bill4 drop column order_price1;


update bill4 set order_price1 = amount * id, order_price2 = COALESCE(amount, 1000) * id;



