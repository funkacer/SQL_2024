select s.kod, o.kod, s.nazev, o.nazev from 
(select * from oddily) o
join
(select * from sekce) s
on o.sekce = s.kod
order by o.kod;
