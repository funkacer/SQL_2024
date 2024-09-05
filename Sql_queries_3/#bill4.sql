--CREATE BILL4 FROM _data/bill4.sql

--select * from bill3;

--select * into bill4 from bill3;

--delete from bill4  where id = 4;

--update bill4 SET amount = null WHERE id = 5;

--select amount * id from bill4;

--select id, amount, amount * id, COALESCE(amount, 1000), COALESCE(amount, 1000) * id from bill4;

select * from bill4;

--insert into bill4 select * from bill4;
--jde

--alter table bill4 add column order_price1 int, order_price2 int;
--nejde

--alter table bill4 add column order_price1 int;
--alter table bill4 add column order_price2 int;

--alter table bill4 drop column order_price1;


--update bill4 set order_price1 = amount * id, order_price2 = COALESCE(amount, 1000) * id;


--ALTER TABLE public.bill4 ADD CONSTRAINT unique_constrain UNIQUE (id);
--nejde, nejsou unique.

--ALTER TABLE public.bill4 ALTER COLUMN id SET NOT NULL;
--jde.

--ALTER TABLE public.bill4 ALTER COLUMN id DROP NOT NULL;
--jde.


--insert into bill4 select * from bill4;
--jde

--select * into bill4 from bill4;
--nejde, jen do nove tabulky

--insert into bill5 select * from bill4;
--nejde, jen do stavajici tabulky

--select * into bill5 from bill4;
--jde, ale neprenesou se contraints

--create table public.bill6 as select * from bill5;
--jde, ale neprenesou se contraints

/*
with t1 as (select *, row_number() over() from public.bill6)
--select * from t1 where row_number > 5;
delete from t1 where row_number > 5;
*/
--nejde

--alter table public.bill6 add column row_number int;
--ok

--drop table public.bill6;

--select * into public.bill6 from (select *, row_number() over() as rn from public.bill5) t1 where rn > 5;

--ALTER TABLE public.bill6 drop column rn;
--ALTER TABLE public.bill6 ADD CONSTRAINT unique_constraint UNIQUE (id);

--insert into public.bill6 select * from bill6;
--nejde kvuli unique constraint

--insert into public.bill6 select 4 as id, month, type, amount, order_price1, order_price2 from bill6 where id = 1;
--jde

--insert into public.bill6 set id = 7, type = 'M', amount = 1000;
--v Postgre nejde!!

--insert into public.bill6 VALUES (7);
--UPDATE public.bill6 SET type = 'M', amount = 1000 WHERE id = 7;
--tohle jde tak udělat

--select * from bill6;

--DROP TABLE public.bill7;

--create table public.bill7 (id int PRIMARY KEY, CONSTRAINT unique_constraint UNIQUE (id));
--jde, pk pojmenuje jako unique_constraint

--create table public.bill7 (id int, CONSTRAINT unique_constraint UNIQUE (id), CONSTRAINT pk_constraint PRIMARY KEY (id));
--jde, ale udělá jen to druhé

--create table public.bill7 (id int PRIMARY KEY, moje varchar(1) UNIQUE NOT NULL);
--jde, udělá bill7_pkey a bill7_moje_key constraint (autopojmenuje)

--ALTER TABLE public.bill7 DROP CONSTRAINT bill7_moje_key;
--ALTER TABLE public.bill7 DROP CONSTRAINT bill7_pkey;
--OK, musí se po jednom

--ALTER TABLE public.bill7 ADD PRIMARY KEY (id, moje);
--OK, udela jednu CONSTRAINT bill7_pkey
--insert into public.bill7 VALUES (1, 'A'), (2, 'B');

--insert into public.bill7 VALUES (1, 'A');
--to uz nejde kvuli RROR:  duplicate key value violates unique constraint "bill7_pkey"

--select * from bill7;

--musim predelat bill7:
--ALTER TABLE public.bill7 DROP CONSTRAINT bill7_pkey;
--ALTER TABLE public.bill7 ADD CONSTRAINT primary_key PRIMARY KEY (id);
--ALTER TABLE public.bill7 ALTER COLUMN moje SET NOT NULL;
--ALTER TABLE public.bill7 ADD CONSTRAINT unique_constraint UNIQUE (moje);

--DROP TABLE public.bill8;
--create table public.bill8 (id int, moje VARCHAR(1), CONSTRAINT bill8_primary_key PRIMARY KEY (id), CONSTRAINT bill8_foreign_key FOREIGN KEY (moje) REFERENCES public.bill7(moje));
--pozor constraint musí být unikátní napříč db, primary_key by tady nešlo protože už je v bill7 - ERROR:  relation "primary_key" already exists ;

--select * from bill7;

--insert into public.bill8 VALUES (1, 'C');
--ERROR:  Key (moje)=(C) is not present in table "bill7".insert or update on table "bill8" violates foreign key constraint "bill8_foreign_key"

--ALTER TABLE public.bill8 DROP CONSTRAINT bill8_foreign_key;
--insert into public.bill8 VALUES (1, 'C');
--uz jde

--select * from bill8;

--update, aby slo pridat foreign key:
--UPDATE public.bill8 SET moje = 'A' WHERE id = 1;

--ALTER TABLE public.bill8 ADD CONSTRAINT bill8_foreign_key FOREIGN KEY (moje) REFERENCES public.bill7(moje);
--OK

--insert into public.bill8 VALUES (1, 'C');
--nejde - ERROR:  Key (id)=(1) already exists.duplicate key value violates unique constraint "bill8_primary_key"

--insert into public.bill8 VALUES (2, 'C');
--nejde - ERROR:  Key (moje)=(C) is not present in table "bill7".insert or update on table "bill8" violates foreign key constraint "bill8_foreign_key"

--insert into public.bill8 VALUES (2, 'B');
--OK

--select * from bill8;

/*
CREATE TABLE public.Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT NOW()
);
*/

--insert into public.Orders VALUES (1, 1);

--select * from public.Orders;

/*
ALTER TABLE public.Orders
ALTER orderdate DROP DEFAULT;
*/

--insert into public.Orders VALUES (2, 2);

--select * from public.Orders;


--create index index_id ON public.Orders (id);

--drop index index_id;

--EXPLAIN select * from public.Orders where id = 2;
--EXPLAIN select * from public.Orders where id in (1,2);

--select *, '{1,2}'::integer[] from public.Orders where id = ANY ('{1,2}'::integer[]);


--drop table public.Orders;

/*
CREATE TABLE public.Orders (
    ID SERIAL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT NOW()
);
*/

--insert into public.Orders VALUES (1, 1), (2,2);

--jde:
--insert into public.Orders VALUES (1, 1), (2,2);

--jde, ale da id =1 a až pak začne zvyšovat:
--insert into public.Orders (OrderNumber) VALUES (1);

--select * from public.Orders;


--ALTER SEQUENCE orders_id_seq RESTART WITH 10 INCREMENT BY 3;

--2x, da id 10, 13
--insert into public.Orders (OrderNumber) VALUES (1);

--select * from public.Orders;

--toto skutečně použije dalěí čísla ze sequence, tak že další insert bude třeba 22
--3x:
--select nextval('orders_id_seq');
--insert into public.Orders (OrderNumber) VALUES (1);

--select * from public.Orders;

--nejde, ERROR:  default value for column id of table orders depends on sequence orders_id_seqcannot drop sequence orders_id_seq because other objects depend on it 
--DROP SEQUENCE orders_id_seq;

--ALTER TABLE public.Orders ALTER id DROP DEFAULT;
--nejde, ERROR:  Failing row contains (null, 1, 2024-04-15).null value in column "id" of relation "orders" violates not-null constraint 
--insert into public.Orders (OrderNumber) VALUES (1);
--jde:
--insert into public.Orders VALUES (1, 1);
--DROP SEQUENCE orders_id_seq;


--select * from public.Orders;

/*
CREATE SEQUENCE three
INCREMENT -1
MINVALUE 1 
MAXVALUE 3
START 3
CYCLE;
*/

--SELECT nextval('three');

--jde:
--ALTER TABLE public.Orders ALTER id SET DEFAULT nextval('three');

--7X:
--insert into public.Orders (OrderNumber) VALUES (1);

--select * from public.Orders;

--drop table orders;
--create table public.Orders (OrderId int NOT NULL, ProductName varchar(255), OrderDate date);

--insert into public.Orders VALUES (1, 'a', '1999-05-18');
--insert into public.Orders VALUES (1, 'a', '1999-5-18'); --to samé jako 05

--nejde - ERROR:  date/time field value out of range: "18.5.1999"
--insert into public.Orders VALUES (1, 'a', '18.5.1999');

--OK
--select * from public.Orders where orderdate = '1999-05-18';
--select * from public.Orders where orderdate = '1999-5-18';

--nejde - ERROR:  date/time field value out of range: "18.5.1999"
--select * from public.Orders where orderdate = '18.5.1999';

--ukáže datestyle
--show datestyle;

--jde:
--select to_char(orderdate, 'Mon/DD/YYYY') from public.Orders;
--select *, to_char(orderdate, 'DD.MM.YYYY') from public.Orders where to_char(orderdate, 'DD.MM.YYYY') = '18.05.1999';

--drop table orders;
--create table public.Orders (OrderId int NOT NULL, ProductName varchar(255), OrderDate timestamp);

/*
insert into public.Orders (OrderId, ProductName, OrderDate) VALUES
(1, 'Geitost','2008-11-11 13:23:44'),
(2, 'Camembert Pierrot', '2008-11-09 15:45:21'),
(3, 'Mozzarella di Giovanni', '2008-11-11 11:12:01'),
(4, 'Mascarpone Fabioli', '2008-10-29 14:56:59');
*/


--select * from public.Orders;

--nevybere nic:
--select * from public.Orders where orderdate = '2008-11-11';

--jde:
--select '2010-01-01 12:00:00'::timestamp::date;

--jde:
--select *, orderdate::date from public.Orders where orderdate::date = '2008-11-11';

--funguje, udělá date_trunc = "2008-11-11 00:00:00" (timestamp without time zone)
--select *, date_trunc('day', orderdate) from public.Orders where date_trunc('day', orderdate) = '2008-11-11';

--jde, ale nechápu:
--select date(substring('2011/05/26 09:00:00' from 1 for 10));

--taky jde, asi nejuniverzálnější
--select *, to_char(orderdate, 'DD.MM.YYYY') from public.Orders where to_char(orderdate, 'DD.MM.YYYY') = '11.11.2008';
--select *, to_char(orderdate, 'YYYY-MM-DD') from public.Orders where to_char(orderdate, 'YYYY-MM-DD') = '2008-11-11';

/*
select *, date_trunc('second', orderdate) as second, date_trunc('minute', orderdate) as minute, date_trunc('hour', orderdate) as hour,
	date_trunc('day', orderdate) as day, date_trunc('month', orderdate) as month, date_trunc('year', orderdate) as year from public.Orders;
*/

--select *, EXTRACT(MONTH FROM date_trunc('month', orderdate)) from public.Orders;

--select date '20221231';
--select date '20221231' - interval '1' day*(275-1);

--select EXTRACT(MONTH from (date '20221231' - interval '1' day*(270-1)));


/*
CREATE TABLE public.event (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    duration INTERVAL NOT NULL
);
*/

--VRÁTÍ ROVNOU TABULKU!!!
/*
INSERT INTO public.event (event_name, duration) 
VALUES
    ('pgConf', '1 hour 30 minutes'),
    ('pgDAY', '2 days 5 hours')
RETURNING *;
*/

/*
SELECT
    event_name,
    duration,
    EXTRACT(DAY FROM duration) AS days,
    EXTRACT(HOUR FROM duration) AS hours,
    EXTRACT(MINUTE FROM duration) AS minutes
FROM event;
*/

/*
SELECT *
FROM event
WHERE duration > INTERVAL '1 day';
*/

/*
WITH cte AS(
   SELECT SUM(duration) AS total_duration 
   FROM event
)
SELECT
    *,
	EXTRACT(DAY FROM total_duration) + EXTRACT(HOUR FROM total_duration)/24 + EXTRACT(MINUTE FROM total_duration)/(24*60) + EXTRACT(SECOND FROM total_duration)/(24*60*60) AS total_duration_in_days,
	INTERVAL '1' day*(EXTRACT(DAY FROM total_duration) + EXTRACT(HOUR FROM total_duration)/24 + EXTRACT(MINUTE FROM total_duration)/(24*60) + EXTRACT(SECOND FROM total_duration)/(24*60*60)) as total_duration_control
FROM cte;
*/

/*
SELECT TO_TIMESTAMP(
    '2017-03-31 9:30:20:002',
    'YYYY-MM-DD HH:MI:SS:MS'
);
*/

--SELECT TIMESTAMP '2017-1-1 5:5:5.125'; --"2017-01-01 05:05:05.125"

--SELECT date_part('century', TIMESTAMP '2017-01-01 15:22:11.125'); --21
--SELECT date_part('decade', TIMESTAMP '2017-01-01 15:22:11.125'); --201
--SELECT date_part('year', TIMESTAMP '2017-01-01 15:22:11.125');  --2017
--SELECT date_part('month', TIMESTAMP '2017-01-01 15:22:11.125'); --1
--SELECT date_part('day', TIMESTAMP '2017-01-01 15:22:11.125'); --1
--SELECT date_part('hour', TIMESTAMP '2017-01-01 5:2:3.125'); --5
--SELECT date_part('minute', TIMESTAMP '2017-01-01 15:2:3.125'); --2
--SELECT date_part('second', TIMESTAMP '2017-01-01 15:2:11.125'); --11.125

--SELECT date_part('minute', TIMESTAMP '2017-01-01 15:2:60.125'); --pozor tohle vrátí 3!!!
--select TIMESTAMP '2017-01-01 15:2:60.125'; --"2017-01-01 15:03:00.125"

--SELECT date_part('microseconds', TIMESTAMP '2017-01-01 15:22:11.125'); --11125000
--SELECT date_part('milliseconds', TIMESTAMP '2017-01-01 15:22:11.125'); --11125
--SELECT date_part('dow', TIMESTAMP '2017-01-01 15:22:11.125'); --0, day of week, 0 je neděle
--SELECT date_part('doy', TIMESTAMP '2017-01-05 15:22:11.125'); --5, day of year
--SELECT date_part('epoch', TIMESTAMP '2017-01-01 15:22:11.125'); --1483284131.125
--SELECT date_part('isodow', TIMESTAMP '2017-01-01 15:22:11.125'); --7, day of week, 7 je neděle
--SELECT date_part('isoyear', TIMESTAMP '2017-01-01 15:22:11.125'); --2016
--SELECT date_part('timezone', TIMESTAMP '2017-01-01 15:22:11.125'); --nejde
--SELECT date_part('timezone_hour', TIMESTAMP '2017-01-01 15:22:11.125'); --nejde
--SELECT date_part('timezone_minute', TIMESTAMP '2017-01-01 15:22:11.125'); --nejde

/*
SELECT EXTRACT(EPOCH FROM NOW()), TO_TIMESTAMP(EXTRACT(EPOCH FROM NOW())),
	TO_TIMESTAMP(EXTRACT(EPOCH FROM NOW()))::DATE, TO_TIMESTAMP(EXTRACT(EPOCH FROM NOW()))::TIME;
*/

--ok
/*
CREATE VIEW public.jc_bill8 AS
SELECT *
FROM bill8
WHERE id < (SELECT AVG(id) FROM bill);
*/

--select * from jc_bill8;

/*
CREATE OR REPLACE VIEW public.jc_bill8 AS
SELECT *
FROM bill8
WHERE id = 1;
*/

--DROP VIEW public.jc_bill8;

