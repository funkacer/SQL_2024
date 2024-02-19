select *, b1.amount - b2.amount as diff from 
(select * from bill) b1
join
(select * from bill2) b2
on b1.id = b2.id
order by b1.id;
