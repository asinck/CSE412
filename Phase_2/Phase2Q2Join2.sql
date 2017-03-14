/*
All people in bands where the band had a top 100 hit
*/
SELECT staff.person_name
FROM staff JOIN band_member ON staff.person_name = band_member.person_name
WHERE band_member.band_name IN (
	SELECT song.band_name
    FROM song
    WHERE song.song_billboard_rating < 100
)