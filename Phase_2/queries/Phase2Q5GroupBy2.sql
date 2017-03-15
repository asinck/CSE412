/*
All bands that released an album after the average year in which albums were released
*/
SELECT band_name
FROM album
WHERE album_release_year >
	(SELECT AVG(album_release_year)
	FROM album)
GROUP BY band_name;