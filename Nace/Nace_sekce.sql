--drop table nace.nace_sekce;

--sekce podklad
--21
/*
select kod as sekce_kod, nazev as sekce_nazev, ((length(strom) - length(replace(strom, '/', ''))) / length('/')) as pocet from nace.nace_podklad
WHERE length(strom) - length(replace(strom, '/', '')) = 1 --pocet = 1 nejde
ORDER BY sekce_kod;
*/

--sekce ostre
--SELECT 21
/*
select kod as sekce_kod, nazev as sekce_nazev INTO nace.nace_sekce from nace.nace_podklad
WHERE length(strom) - length(replace(strom, '/', '')) = 1
ORDER BY sekce_kod;
*/

select * from nace.nace_sekce;