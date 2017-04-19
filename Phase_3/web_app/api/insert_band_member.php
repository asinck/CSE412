<?php 


require 'h.php';

//Add band member

// ?band_name=able mention&band_start_date=1988-09-11&person_name=TestTest&person_birthdate=2011-03-14&member_start_date=1989-12-04&member_end_date=2003-02-07






$response = "ERROR: Inputs improperly defined.";

// check all parameters are present
if( isset( $_GET['band_name'] ) && isset( $_GET['band_start_date'] ) && isset( $_GET['person_name'] ) && isset( $_GET['person_birthdate'] ) && isset( $_GET['member_start_date'] ) && isset( $_GET['member_end_date'] ) ) {
	// set all parameters
	$band_name = $_GET['band_name'];
	$band_start_date = $_GET['band_start_date'];
	$person_name = $_GET['person_name'];
	$person_birthdate = $_GET['person_birthdate'];
	$member_start_date = $_GET['member_start_date'];
	$member_end_date = $_GET['member_end_date'];


	// build query
	$sql = "INSERT INTO `band_member` (`band_name`, `band_start_date`, `person_name`, `person_birthdate`, `member_start_date`, `member_end_date`)";
	$sql .= "VALUES ('".$band_name."','".$band_start_date."','".$person_name."','".$person_birthdate."','".$member_start_date."','".$member_end_date."');";
	// send query
	$response = sql_set_query($sql);
	
}

// return response in json
jr( $response );

?>