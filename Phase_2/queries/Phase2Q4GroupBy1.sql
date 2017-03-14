/*
All bands that have more than 10 staff members
*/
SELECT COUNT(person_name)NUMBER_OF_STAFF, band_name AS BAND_NAME
FROM staff
GROUP BY band_name
HAVING COUNT(person_name) > 10;