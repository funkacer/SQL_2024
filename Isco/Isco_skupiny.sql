--drop table isco.isco_skupina;

--priprava
/*
select t1.kod skupina_kod, t1.nazev skupina_nazev, t3.hlavni_trida_kod, t3.hlavni_trida_nazev, t5.trida_kod, t5.trida_nazev from
(select kod, nazev, SPLIT_PART(strom, '/', 1) as hlavni_trida_kod, SPLIT_PART(strom, '/', 2) as trida_kod from isco.isco_podklad 
WHERE (CHAR_LENGTH(strom) - CHAR_LENGTH(REPLACE(strom, '/', ''))) 
/ CHAR_LENGTH('/') = 3) t1
left join isco.isco_hlavni_trida t3
on t1.hlavni_trida_kod = t3.hlavni_trida_kod
left join isco.isco_trida t5
on t1.trida_kod = t5.trida_kod
order by skupina_kod;
*/

--SELECT 130
/*
select t1.kod skupina_kod, t1.nazev skupina_nazev, t3.hlavni_trida_kod, t3.hlavni_trida_nazev, t5.trida_kod, t5.trida_nazev 
INTO isco.isco_skupina from
(select kod, nazev, SPLIT_PART(strom, '/', 1) as hlavni_trida_kod, SPLIT_PART(strom, '/', 2) as trida_kod from isco.isco_podklad 
WHERE (CHAR_LENGTH(strom) - CHAR_LENGTH(REPLACE(strom, '/', ''))) 
/ CHAR_LENGTH('/') = 3) t1
left join isco.isco_hlavni_trida t3
on t1.hlavni_trida_kod = t3.hlavni_trida_kod
left join isco.isco_trida t5
on t1.trida_kod = t5.trida_kod
order by skupina_kod;
*/

select * from isco.isco_skupina;


--kontrola
--5 kódů se v sas nevyskytuje, ale jinak  se vše propojí
/*
select * from 
(select * from public.isco_skupina) i
full outer join
(select b23 from vsevystup.earnings_sesb_a4_2018) e
on i.skupina = e.b23
--where i.skupina is null;
where e.b23 is null;
*/

/*
select  b23 from vsevystup.earnings_sesb_a4_2018
order by b23;
*/

--select count( distinct skupina) from public.isco_skupina

/*
--nejvic je "Montážní dělníci výrobků a zařízení"
select e.b23, nazev, count(*) from 
(select b23 from vsevystup.earnings_sesb_a4_2018) e
left join
(select * from public.isco_skupina) i
on e.b23 = i.skupina
--where i.skupina is null;
group by e.b23, nazev
order by count(*) desc;
*/

/*
select hlavni_trida, hlavni_trida_nazev, count(*) from 
(select b23 from vsevystup.earnings_sesb_a4_2018) e
left join
(select * from public.isco_skupina) i
on e.b23 = i.skupina
group by hlavni_trida, hlavni_trida_nazev
order by count(*) desc;
*/

/*
select trida, trida_nazev, count(*) from 
(select b23 from vsevystup.earnings_sesb_a4_2018) e
left join
(select * from public.isco_skupina) i
on e.b23 = i.skupina
group by trida, trida_nazev
order by count(*) desc;
*/

/*
with t1 as (select * from
(select b23 from vsevystup.earnings_sesb_a4_2018) e
left join
(select * from public.isco_skupina) i
on e.b23 = i.skupina)
select b23, nazev, count(*), round((count(*)*1.0 / (select count(*) from t1))*100, 1) as perc from t1
group by b23, nazev
order by count(*) desc;
*/