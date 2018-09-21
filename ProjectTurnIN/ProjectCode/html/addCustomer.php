<!DOCTYPE html>
<html>
	<head>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>Pet Inn</title>
			<meta charset="utf-8">
			<!-- Optional theme -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
			<link type="text/css" rel="stylesheet" href="../css/style.css" />		
	</head>
	<body>
		<!-- <?php
		if(isset($_POST['insertClient'])){ 
			/* Attempt MySQL server connection. Assuming you are running MySQL
			server with default setting (user 'root' with no password) */
			
			//mysqli_connect accepts 4 parameters as serverHostName, userName, password, schemaName
			$link = mysqli_connect("", "", "", "");
			 
			// Check connection
			if($link == false){
				//die("ERROR: Could not connect. " . mysqli_connect_error());
			} else {
				echo "Connected...";
			}
			
			
			// Escape user inputs for security
			$result = mysqli_query($link, "SELECT MAX(ClientID) FROM Clients");
			$row = mysqli_fetch_array($result);
			//echo $row[0];
				
			$petid = $row[0]+1;
			$personid = 201;
			$name = "";
			$selected_type = "";
			$selected_gender = "";
			$selected_size = "";
				if(array_key_exists('petname', $_REQUEST)){
					$name = mysqli_real_escape_string($link, $_REQUEST['petname']);
				}
				if(array_key_exists('pettype', $_POST)){
				$selected_type = $_POST['pettype'];
				}
				if(array_key_exists('petgender', $_POST)){
				$selected_gender = $_POST['petgender'];
				}
				if(array_key_exists('petsize', $_POST)){
				$selected_size = $_POST['petsize'];
				}
				
				//$selected_val = $animals[$_POST['animal']];
				
				//echo "hi " . $selected_type . " " . $selected_gender . " " . $selected_size;
				
				if (!empty($petid) && !empty($personid) && !empty($name) && !empty($selected_type) && !empty($selected_gender) && !empty($selected_size)) {
				 $sql = "INSERT INTO pet VALUES ('$petid','$personid','$name','$selected_type','$selected_gender','$selected_size')";
				 if(mysqli_query($link, $sql)){
					 echo "<script type='text/javascript'>alert('Records added successfully.');</script>";
					header('Location: dashboard.php'); 
					$name = "";
					$selected_type = "";
					$selected_gender = "";
					$selected_size = "";
				 } else{
					 echo "<script type='text/javascript'>alert('ERROR: Could not able to execute');</script>";
					 //echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
				 }
			}
			else{
				echo "<script type='text/javascript'>alert('Please add name');</script>";
			}
			
			// close connection
			mysqli_close($link);
			}
		?> -->
		<?php include('header.php'); ?>
		<center>
				<div class="row AddPetRectangle">
					<form method="post">
						<div class="form-group">
							<div class="row">
								<div class="col-md-12 col-lg-12">
									<h3>ADD CLIENT</h3>
								</div>
							</div>
							<div class="row">
						        <div class="col-xs-6 form-group">
						            <label>FirstName</label>
						            <input type="text" class="form-control" name="firstName" id="firstName">
						        </div>
						        <div class="col-xs-6 form-group">
						            <label>LastName</label>
						            <input type="text" class="form-control" name="lastName" id="lastName">
						        </div>
						        <div class="col-xs-12 form-group">
						            <label>Address</label>
						            <input type="text" class="form-control" name="address" id="address">
						        </div>
						        <div class="col-xs-4 form-group">
						            <label>City</label>
						            <input type="text" class="form-control" name="city" id="city">
						        </div>
						        <div class="col-xs-4 form-group">
						            <label>County</label>
						            <input type="text" class="form-control" name="county" id="county">
						        </div>
						        <div class="col-xs-4 form-group">
						            <label>State</label>
						            <input type="text" class="form-control" name="state" id="state">
						        </div>
						        <div class="col-xs-4 form-group">
						            <label>Zip</label>
						            <input type="text" class="form-control" name="zipcode" id="zipcode">
						        </div>
						        <div class="col-xs-4 form-group">
						            <label>Phone</label>
						            <input type="text" class="form-control" name="phone" id="phone">
						        </div>
						        <div class="col-xs-4 form-group">
						            <label>Email</label>
						            <input type="email" class="form-control" name="email" id="email">
						        </div>
						    </div>
						
					<center>
						<input type="submit" id="addClientBtn" class="btn btn-primary" name="addClient" 
						onclick="insertClient();" value="Add" />
					</center>
					</form>
			</div>
		</center>
	<script src="../js/main.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>
