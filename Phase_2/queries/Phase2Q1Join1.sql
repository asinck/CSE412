/*
All bassoon players on tour after the start of 2000
*/
SELECT plays.person_name
FROM plays JOIN band_member ON plays.person_name = band_member.person_name
WHERE plays.instrument_name = 'bassoon' AND band_member.band_name IN (
	SELECT band_member.band_name
    FROM band_member JOIN tour ON band_member.band_name = tour.band_name
    WHERE tour.tour_start_date > 2000-01-01 
)