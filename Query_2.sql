--Q2
-- which countries have the most invoices?
select count(*) ,billing_country 
from invoice
group by billing_country
order by count desc

