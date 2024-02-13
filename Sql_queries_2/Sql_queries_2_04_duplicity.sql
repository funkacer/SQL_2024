-- select * from public.bill2;

select *, lag(amount, 1) OVER (ORDER BY amount) < amount, --lze porovnat dvě čísla po sobě,
lag(amount, 1) OVER (ORDER BY amount) = amount, --lze odhalit duplicity
lead(amount, 1) OVER (ORDER BY amount) = amount --lze odhalit duplicity
from public.bill2
ORDER BY amount;