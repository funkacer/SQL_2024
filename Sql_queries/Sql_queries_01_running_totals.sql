-- Running Totals

SELECT id,month
	 , Amount
	 , SUM(Amount) OVER (ORDER BY id) as total_sum
	FROM bill;