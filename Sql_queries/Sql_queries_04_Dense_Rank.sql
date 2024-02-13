-- RANK() or DANSE_RANK()

SELECT 
	  id,
	  type,
	  DENSE_RANK() OVER (ORDER BY type desc)
	FROM bill;