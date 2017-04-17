<?php


// shortcut for sending back a json object (jr = json response)
function jr($obj) {
	echo( json_encode( $obj ) );
}

require "set_query.php";
require "get_query.php";

?>