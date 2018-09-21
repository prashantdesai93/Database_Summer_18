<?php

/*

DELETE.PHP

*/
/*Author:Prashant Desai*/

// connect to the database
//mysqli_connect accepts 4 parameters as serverHostName, userName, password, schemaName
			$link = mysqli_connect("", "", "", "");

		// Check connection
		if($link === false){
			//die("ERROR: Could not connect. " . mysqli_connect_error());
		} else {
			//echo "Connected...";
		}



// check if the 'id' variable is set in URL, and check that it is valid

if (isset($_GET['id']) && is_numeric($_GET['id']))

{

// get id value

$id = $_GET['id'];
// delete the entry

 if(mysqli_query($link, "DELETE FROM pet WHERE petid=$id")){
	//echo "<script type='text/javascript'>alert('Pet Deleted successfully.');</script>";
  	header("Location: dashboard.php");
	} else{
	echo "<script type='text/javascript'>alert('Delete order for this pet first then delete the pet.');</script>";}
  	header("Location: dashboard.php");

}


?>
