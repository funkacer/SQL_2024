--DROP TABLE isco.isco;
--TRUNCATE TABLE isco.isco_podklad;

--select * from isco.isco_podklad;

--1990
/*
select *
 from isco.isco_podklad;
*/

--617
/*
select *
 from isco.isco_podklad
 WHERE substring(strom, length(strom), 1) = '/';
*/

--1373
/*
select *
 from isco.isco_podklad
 WHERE substring(strom, length(strom), 1) <> '/';
*/

--testovací tabulka
--select * into isco.isco_pok from isco.isco_podklad;

--1373
/*
SELECT strom || '/' from isco.isco_pok
 WHERE right(strom, 1) <> '/';
*/

/*
UPDATE isco.isco_pok SET strom = strom || '/'
 WHERE right(strom, 1) <> '/';
*/

--0
--select * from isco.isco_pok WHERE substring(strom, length(strom), 1) <> '/';

--drop table isco.isco_pok;

--ostre
--UPDATE 1373
/*
UPDATE isco.isco_podklad SET strom = strom || '/'
 WHERE right(strom, 1) <> '/';
*/

--0
/*
select *
 from isco.isco_podklad
 --WHERE substring(strom, length(strom), 1) <> '/';
 WHERE right(strom, 1) <> '/';
*/

--taky jde right
--1990
/*
select *
 from isco.isco_podklad
 --WHERE substring(strom, length(strom), 1) = '/';
 WHERE right(strom, 1) = '/';
*/

--HURAAAAAAAAAAAAAAAAAAAA!!!
/*
select *, position('/' in strom), position('/' in reverse(strom)),
(CHAR_LENGTH(strom) - CHAR_LENGTH(REPLACE(strom, '/', ''))) 
/ CHAR_LENGTH('/') as max_split_part,
split_part(strom, '/', (CHAR_LENGTH(strom) - CHAR_LENGTH(REPLACE(strom, '/', ''))) 
/ CHAR_LENGTH('/')) as posledni_split_part
 from isco.isco_podklad
ORDER BY strom;
*/

/*
select strom, position('/' in reverse(strom))
 from isco.isco_podklad
 order by position('/' in reverse(strom)) DESC;
*/

select max(position('/' in reverse(strom)))
 from isco.isco_podklad;