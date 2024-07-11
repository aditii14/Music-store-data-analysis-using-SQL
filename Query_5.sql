--Q5
-- who is the best customer ? the customer who has spent the most
-- money will be declared the best customer. write the query that returns
--the person who spent the most money
select customer.customer_id ,customer.first_name, customer.last_name, sum(total) as money_spend
from invoice
left join customer
on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by money_spend desc
limit 1
