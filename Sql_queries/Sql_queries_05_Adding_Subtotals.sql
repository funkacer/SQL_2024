-- Adding Subtotals

SELECT  
	  Type,
	  id,
	  SUM (Amount) AS total_amount
	FROM bill
	GROUP BY ROLLUP (Type,id)
	ORDER BY Type, id;

/*
-- mysql
SELECT  
	  Type,
	  id,
	  SUM (Amount) AS total_amount
	FROM bill
	GROUP BY Type,id WITH ROLLUP;
*/