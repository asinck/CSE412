<?php 

require 'h.php';

// gets all the bands going on tour after or on a given date

$response = "ERROR: no accetable parameters were set.";
// build the sql query

// get user input
if( isset( $_GET['start_date'] ) ){
	
	//get bands on tour after the given date
	$sql = "SELECT DISTINCT person.person_name, person.band_name
			FROM person
			WHERE person.band_name IN
			(SELECT band_name
			FROM tour
			WHERE tour_start_date >= '" . $_GET['start_date']."')";

	//echo $sql;
	//echo "<br/>";
		
	$response = sql_get_query($sql);
}

// return response in json
jr( $response );
// die( $response )
?>