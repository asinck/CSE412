/*
All band members and bands that started a tour sometime during, or after, 2016.
*/
SELECT person_name, band_name
FROM person
WHERE person.band_name IN
	(SELECT band_name
	FROM tour
	WHERE tour_start_date >= '2016-01-01');