-- S2:Q1
-- write query to return the email, first name ,last name & genre of all the rock
-- music listner . return your list order alphabetically by email starting with A
select distinct first_name,last_name,email
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
		select track_id from track
		join genre on track.genre_id= genre.genre_id
		where genre.name like 'Rock'
)
order by email
--similar code "select the code and then run"
WITH rock_tracks AS (
    SELECT track_id
    FROM track
    JOIN genre ON track.genre_id = genre.genre_id
    WHERE genre.name LIKE 'Rock'
),
rock_invoices AS (
    SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name, customer.email
    FROM customer
    JOIN invoice ON customer.customer_id = invoice.customer_id
    JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
    WHERE invoice_line.track_id IN (SELECT track_id FROM rock_tracks)
)
SELECT first_name, last_name, email
FROM rock_invoices
ORDER BY email;
