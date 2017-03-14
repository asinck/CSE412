<?php 
require 'dbconnect.php';
// build sql query here
$sql = $_POST["query"];
// run query
$response = $conn->query($sql);
// will hold data
$results = "";
// check if rows response
if($response->num_rows > 0) {
	// store rows in an array
	$rows = array();
	// push rows and return
	while( $row = $response->fetch_assoc() ) {
		array_push($rows, $row);
	}
	$results = json_encode($rows);
}
// otherwise just return response
else {
	$results = $response;
}
// close connection
mysql_close();
// return results
echo $results;
die();
?>