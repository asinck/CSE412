/*
All featured artists that have ever played for a band that ever had a concert in Yuma, Arizona on 2011-02-23 and the instrument that the featured artist plays and/or the role they had
*/
SELECT DISTINCT feat_artist_name, feat_artist_role
FROM featured_artist
WHERE feat_artist_name IN
	(SELECT feat_artist_name
	FROM featured_artist
	WHERE band_name IN
		(SELECT band_name
		FROM concert
		WHERE concert_city = 'Yuma, Arizona'
		AND concert_day = '2011-02-23')
	); 