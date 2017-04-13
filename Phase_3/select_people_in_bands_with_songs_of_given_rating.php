<?php 

require "../h.php";


//user enters a raiting and query gets a list of all the people who have been in a band with a song that had that rating or better

$response = "ERROR: no accetable parameters were set.";
// build the sql query

// get user input
if( isset( $_GET['input'] ) ){
	//convert to an int
	$rating = (int)$_GET['input'];

	
	$sql = "SELECT staff.person_name
			FROM staff JOIN band_member ON staff.person_name = band_member.person_name
			WHERE band_member.band_name IN (
				SELECT song.band_name
			    FROM song
			    WHERE song.song_billboard_rating <= " . $rating ." )";

		
	$response = sql_get_query($sql);
}

// return response in json
jr( $response );

?>