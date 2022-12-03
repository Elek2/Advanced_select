SELECT g.name Жанр, count(art.name) Количество_исполнителей FROM artists art 
	JOIN genre_artist ga ON art.id = ga.artist_id 
	JOIN genres g ON ga.genre_id  = g.id 
	GROUP BY g.name
	ORDER BY count(art.name) desc 

SELECT COUNT(t.name) Колич_треков_в_2019_2020 FROM tracks t
	JOIN albums a ON t.album_id  = a.id 
	WHERE a.year between 2019 and 2020 

SELECT a.name Альбом, AVG(t.lenght) Среднее_время_трека FROM tracks t
	JOIN albums a ON t.album_id  = a.id 
	GROUP BY a.name  

SELECT DISTINCT art.name Исполнители_без_альбома_в_2020 FROM artists art 
	JOIN artist_album aa ON art.id = aa.artist_id
	JOIN albums alb ON aa.album_id = alb.id 
	WHERE alb.year != 2020
	
SELECT DISTINCT c.name Сборники_в_которых_Проба_Пера FROM collections c 
	JOIN track_collection tc ON c.id = tc.collection_id
	JOIN tracks t ON tc.track_id = t.id 
	JOIN albums alb ON t.album_id = alb.id 
	JOIN artist_album aa ON alb.id = aa.album_id 
	JOIN artists a ON aa.artist_id = a.id 
	WHERE a.name = 'Проба Пера'
		
SELECT albums.name Альбомы_с_неск_жанрами, count(g.name) FROM albums 
	JOIN artist_album aa ON albums.id = aa.album_id
	JOIN artists ON aa.artist_id = artists.id 
	JOIN genre_artist ga ON ga.artist_id  = artists.id 
	JOIN genres g ON ga.genre_id  = g.id 						
	GROUP BY albums.name
	having count(g.name) > 1

SELECT t.name Треки_не_в_сборниках FROM collections c 
	JOIN track_collection tc ON c.id = tc.collection_id
	RIGHT JOIN tracks t ON tc.track_id = t.id 
	GROUP BY t.name, c.name
	HAVING c.name IS NULL

SELECT art.name Автор_самой_короткой_песни FROM artists art 
	JOIN artist_album aa ON art.id = aa.artist_id
	JOIN albums alb ON aa.album_id = alb.id
	JOIN tracks t ON t.album_id = alb.id
	WHERE t.lenght = (SELECT MIN(lenght) FROM tracks)
	
SELECT alb.name Альбомы_с_минимумом_треков, count(t.id) Кол_во_треков FROM albums alb 
	JOIN tracks t ON t.album_id = alb.id
	group by alb.name
	having count(t.id) = (
		SELECT MIN (t.count) FROM (
			SELECT count(id) FROM tracks
				group by album_id) t)	
	
	