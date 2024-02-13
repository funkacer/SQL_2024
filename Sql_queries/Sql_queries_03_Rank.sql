-- RANK() or DANSE_RANK()

SELECT 
	  id,
	  type,
	  RANK() OVER (ORDER BY type desc)
	FROM bill;
	
/*
SELECT 
	  id,
	  Amount,
	  RANK() OVER (ORDER BY Amount desc)
	FROM bill;
*/