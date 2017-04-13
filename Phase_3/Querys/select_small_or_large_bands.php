<?php 

require "../h.php";


//If user enters large they will get a list of all the bands who have more than ten members
//If user enters small they will get a list of all the bands who have less than ten members

$response = "ERROR: no accetable parameters were set.";
// build the sql query

// get user input
if( isset( $_GET['input'] ) ){

	
		if(strcmp($_GET['input'], "large") ==0 || strcmp($_GET['input'], "Large") ==0 )
		{
			$sql = "SELECT COUNT(person_name)NUMBER_OF_STAFF, band_name AS BAND_NAME
				FROM staff
				GROUP BY band_name
				HAVING COUNT(person_name) > 10;";
		}
		else if(strcmp($_GET['input'], "small") ==0 || strcmp($_GET['input'], "Small") ==0 )
		{
			$sql = "SELECT COUNT(person_name)NUMBER_OF_STAFF, band_name AS BAND_NAME
				FROM staff
				GROUP BY band_name
				HAVING COUNT(person_name) < 10;";
		}
	
		
	$response = sql_get_query($sql);
}

// return response in json
jr( $response );

?>