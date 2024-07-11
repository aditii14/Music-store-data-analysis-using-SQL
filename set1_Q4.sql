--S1:Q4
--which city has the best customer? we should like to throw a
--promotion music festival in the city we made the most money .write a 
--query that returns one city that has the highest sum of invoice total
--return both the city name & sum of all invoice total
select sum(total)as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc
limit 2

