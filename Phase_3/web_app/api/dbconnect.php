<?php 
// Connect to database.

$servername = "localhost";
$dbname = "cse412database";
$username = "teamlogin412";
$password = "mOuh~5Og3tHC";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

mysql_connect("localhost",$username,$password);

?>