--https://www.postgresql.org/docs/current/functions-datetime.html

with t1 AS (SELECT EXTRACT(YEAR FROM now()) AS rok, EXTRACT(MONTH FROM now()) AS mesic, generate_series(0,22) as posun_zpet)
SELECT rok,
	mesic,
	posun_zpet,
	date(concat(rok::varchar, '-', mesic::varchar, '-01')) datum,
	concat(posun_zpet, ' month')::Interval interval,
	date(concat(rok::varchar, '-', mesic::varchar, '-01')) - concat(posun_zpet, ' month')::Interval datum_zpet,
	EXTRACT(YEAR FROM date(concat(rok::varchar, '-', mesic::varchar, '-01')) - concat(posun_zpet, ' month')::Interval) AS rok_zpet,
	EXTRACT(MONTH FROM date(concat(rok::varchar, '-', mesic::varchar, '-01')) - concat(posun_zpet, ' month')::Interval) AS mesic_zpet
	from t1;

/*
SELECT now() datum,
 date_trunc('year', now()) year_trunc,
 date_trunc('month', now()) month_trunc,
 date_trunc('day', now()) day_trunc,
 date_trunc('hour', now()) hour_trunc,
 date_trunc('minute', now()) minute_trunc,
 date_trunc('second', now()) second_trunc;
 
 SELECT now() datum,
 extract('year' from now()) year_trunc,
 extract('month' from now()) month_trunc,
 extract('day' from now()) day_trunc,
 extract('hour' from now()) hour_trunc,
 extract('minute' from now()) minute_trunc,
 extract('second' from now()) second_trunc;
 */