<?php 

require 'h.php';

// gets all the bands going on tour after or on a given date

$response = "ERROR: no accetable parameters were set.";
// build the sql query

// get user input
if( isset( $_GET['band_name'] ) ){
	
	//get bands on tour after the given date
	$sql = "SELECT * FROM `band_member` WHERE `band_name` = '" . $_GET['band_name']."'";
	$response = sql_get_query($sql);
}

// return response in json
jr( $response );
// die( $response )
?>