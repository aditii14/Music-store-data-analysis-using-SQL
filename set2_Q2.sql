-- S2:Q2
--lets invite the artist who have write the most rock music 
--in our dataset write a query that return the artist name and the total track count of the top 10
--rock band 
select artist.name ,artist.artist_id, count(artist.artist_id) as number_of_songs
from track 
join album on track.album_id = album.album_id
join artist on artist.artist_id = album.artist_id
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10