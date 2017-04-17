<?php 

require 'h.php';


//If user enters oldest they will get a list of all the bands who have the oldest members
//If user enters youngest they will get a list of all the bands who have the youngest members

$response = "ERROR: no accetable parameters were set.";
// build the sql query

// get user input
if( isset( $_GET['input'] ) ){

		if(strcmp($_GET['input'], "oldest") ==0 || strcmp($_GET['input'], "Oldest") ==0 )
		{
			$sql = "SELECT  bm.band_name, bm.person_name, bm.person_birthdate
					FROM band_member bm
					WHERE bm.person_birthdate <= ALL (
						SELECT bm2.person_birthdate
					    FROM band_member bm2
					    WHERE bm2.person_name <> bm.person_name )";
		}
		else if(strcmp($_GET['input'], "youngest") ==0 || strcmp($_GET['input'], "Youngest") ==0 )
		{
			$sql = "SELECT  bm.band_name, bm.person_name, bm.person_birthdate
					FROM band_member bm
					WHERE bm.person_birthdate >= ALL (
						SELECT bm2.person_birthdate
					    FROM band_member bm2
					    WHERE bm2.person_name <> bm.person_name )";
		}
	
		
	$response = sql_get_query($sql);
}

// return response in json
jr( $response );

?>