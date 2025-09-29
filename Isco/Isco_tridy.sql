--drop table isco.isco_trida;

--priprava
/*
select t1.kod trida_kod, t1.nazev trida_nazev, t3.hlavni_trida_kod, t3.hlavni_trida_nazev from
(select kod, nazev, SPLIT_PART(strom, '/', 1) as hlavni_trida_kod from isco.isco_podklad 
WHERE (CHAR_LENGTH(strom) - CHAR_LENGTH(REPLACE(strom, '/', ''))) 
/ CHAR_LENGTH('/') = 2) t1
left join isco.isco_hlavni_trida t3
on t1.hlavni_trida_kod = t3.hlavni_trida_kod
order by trida_kod;
*/

--SELECT 43
/*
select t1.kod trida_kod, t1.nazev trida_nazev, t3.hlavni_trida_kod, t3.hlavni_trida_nazev INTO isco.isco_trida
from
(select kod, nazev, SPLIT_PART(strom, '/', 1) as hlavni_trida_kod from isco.isco_podklad 
WHERE (CHAR_LENGTH(strom) - CHAR_LENGTH(REPLACE(strom, '/', ''))) 
/ CHAR_LENGTH('/') = 2) t1
left join isco.isco_hlavni_trida t3
on t1.hlavni_trida_kod = t3.hlavni_trida_kod
order by trida_kod;
*/

select * from isco.isco_trida;

