with t1 as (SELECT bill.amount as amount1, bill2.amount as amount2
	FROM bill
		   join bill2
		   on bill.id = bill2.id)
select corr(amount1, amount2) from t1;