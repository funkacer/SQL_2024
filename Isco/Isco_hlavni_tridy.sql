--DROP TABLE isco.isco_hlavni_trida;

--priprava
/*
select kod hlavni_trida_kod, nazev hlavni_trida_nazev from isco.isco_podklad
--WHERE length(strom) = 2;
WHERE (CHAR_LENGTH(strom) - CHAR_LENGTH(REPLACE(strom, '/', ''))) 
/ CHAR_LENGTH('/') = 1
ORDER BY hlavni_trida_kod;
*/

--SELECT 10
/*
select kod hlavni_trida_kod, nazev hlavni_trida_nazev INTO isco.isco_hlavni_trida from isco.isco_podklad
--WHERE length(strom) = 2;
WHERE (CHAR_LENGTH(strom) - CHAR_LENGTH(REPLACE(strom, '/', ''))) 
/ CHAR_LENGTH('/') = 1
ORDER BY hlavni_trida_kod;
*/

select * from isco.isco_hlavni_trida;
