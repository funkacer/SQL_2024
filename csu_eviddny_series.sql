with t1 as (select 20240630 as "konecep", 182 as "eviddny")
select *, TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD')::DATE as konecday, (TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD') - concat(("eviddny"-1)::VARCHAR, ' DAYS')::INTERVAL)::DATE as "startday",
EXTRACT( DAY FROM( (TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD')) - (TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD') - concat(("eviddny"-1)::VARCHAR, ' DAYS')::INTERVAL) ))+1 as kaldny_blbe,
EXTRACT( DAY FROM( (TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD') + interval '12 hours') - (TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD') - concat(("eviddny"-1)::VARCHAR, ' DAYS')::INTERVAL) ))+1 as kaldny,
extract('dow' from TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD')::DATE) as dow_konecday,
extract('dow' from TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD') - concat(("eviddny"-1)::VARCHAR, ' DAYS')::INTERVAL) as dow_startday,

(select count(d::date) as d
    from generate_series(TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD') - concat(("eviddny"-1)::VARCHAR, ' DAYS')::INTERVAL, TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD'), '1 day'::interval) d
    ) kaldny,

(select count(d::date) as d
    from generate_series(TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD') - concat(("eviddny"-1)::VARCHAR, ' DAYS')::INTERVAL, TO_TIMESTAMP("konecep"::VARCHAR, 'YYYYMMDD'), '1 day'::interval) d
    where extract('dow' from d) not in (0, 6)) pracdny
	  
from t1;

/*
with t1 as (select TO_TIMESTAMP('20240630', 'YYYYMMDD')::DATE as konecday, (TO_TIMESTAMP('20240630', 'YYYYMMDD') - concat((182-1)::VARCHAR, ' DAYS')::INTERVAL)::DATE as "startday")
select generate_series(startday, konecday, '1 day'::interval) d, extract('dow' from generate_series(startday, konecday, '1 day'::interval)) dow,
extract('dow' from generate_series(startday, konecday, '1 day'::interval)) not in (0, 6) pracden from t1;
*/

/*
with t1 as (select TO_TIMESTAMP('20240630', 'YYYYMMDD')::DATE as konecday, (TO_TIMESTAMP('20240630', 'YYYYMMDD') - concat((182-1)::VARCHAR, ' DAYS')::INTERVAL)::DATE as "startday")
select count(d::date) as d from generate_series((select startday from t1), (select konecday from t1), '1 day'::interval) d
where extract('dow' from d) not in (0, 6);
*/

/*
with t1 as (select TO_TIMESTAMP('20240630', 'YYYYMMDD')::DATE as konecday, (TO_TIMESTAMP('20240630', 'YYYYMMDD') - concat((182-1)::VARCHAR, ' DAYS')::INTERVAL)::DATE as "startday")
select d::date as d, extract('dow' from d) as dow from generate_series((select startday from t1), (select konecday from t1), '1 day'::interval) d
where extract('dow' from d) not in (0, 6);
*/

/*
select count(d::date) as d
    from generate_series(from_date, to_date, '1 day'::interval) d
    where extract('dow' from d) not in (0, 6)
*/
