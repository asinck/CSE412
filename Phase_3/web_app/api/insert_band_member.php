<?php 


require 'h.php';

//Add band member
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
	$sql = "INSERT INTO `band_member` (`band_name`, `band_start_date`, `person_name`, `person_birthdate`, `member_start_date`, `member_end_date')";
	$sql .= "VALUES ('".$band_name."','".$band_start_date."','".$person_name."','".$person_birthdate."','".$member_start_date."','".$member_end_date."');";
	// send query
	$response = sql_set_query($sql);
	}
}

// return response in json
jr( $response );

?>