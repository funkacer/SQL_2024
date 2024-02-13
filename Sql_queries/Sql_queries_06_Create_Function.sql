-- Create function (? temporary)
/*
CREATE FUNCTION public.get_gender(text) RETURNS text
    AS $$ SELECT CASE WHEN $1 = 'M' THEN 'male'
	        WHEN $1 = 'F' THEN 'female'
	        ELSE 'n/a'
	   END $$
    LANGUAGE SQL
    IMMUTABLE
    RETURNS NULL ON NULL INPUT;
*/

SELECT 
	  *,
	  get_gender(type) as gender
	FROM public.bill2;
	
--zajímavé
/*
--prepare temporary function
PREPARE upd_tbl AS
UPDATE tbl t SET set_name = $2 WHERE tbl_id = $1;
--call temporary function (it is not possible to use it in a query, only standalone!!!)
EXECUTE upd_tbl(123, 'foo_name');
*/