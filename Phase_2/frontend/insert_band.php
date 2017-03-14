<?php 
require 'dbconnect.php';
// build sql query here
$sql = "INSERT INTO `band` (`band_name`, `band_start_date`, `band_end_date`, `band_billboard_rating`) VALUES ('".$_POST["bandname"]."', '".$_POST["startdate"]."', '".$_POST["enddate"]."', '".$_POST["billboardrating"]."');";
// run query
$response = $conn->query($sql);
// close connection
mysql_close();
// return results
echo $response;
die();
?>