/*
The name of the bands with the oldest band members
*/
SELECT bm.band_name
FROM band_member bm
WHERE bm.person_birthdate <= ALL (
	SELECT bm2.person_birthdate
    FROM band_member bm2
    WHERE bm2.person_name <> bm.person_name )