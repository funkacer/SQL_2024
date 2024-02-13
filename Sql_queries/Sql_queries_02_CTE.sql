-- CTE = Common Table Expressions

WITH idtempp as (
	  SELECT id as id
	  FROM bill 
	  WHERE type = 'M'
	)
	
	SELECT *
	FROM bill
	WHERE id in (SELECT id from idtempp);
