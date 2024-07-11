--S3:Q2
-- we want to find out the ost popular music genre for each country
-- we determine the most popular genre as the genre as the genre with the highest
-- amount of purchases.write a query that return each that return each country along with
-- the top genre . for  countries where the maximum number of purchasees
-- is shared return all genre
with genre_purchase_count as 
(
	select count(invoice_line.quantity)as purchase, customer.country, genre.name as g_name, genre.genre_id
	from invoice_line 
	join invoice on invoice.invoice_id = invoice_line.invoice_id
	join customer on customer.customer_id = invoice.customer_id
	join track on track.track_id = invoice_line.track_id
	join genre on genre.genre_id = track.genre_id
	group by customer.country, genre.name,genre.genre_id
	
),
	
popular_genre AS (
    SELECT 
        country, 
        g_name, 
        genre_id, 
        purchase,
        ROW_NUMBER() OVER (PARTITION BY country ORDER BY purchase DESC) AS row_no
    --Assigns a row number to each genre per country, ordering by the number of purchases in descending order.
	FROM genre_purchase_count
)
select * from popular_genre 
where row_no=1;