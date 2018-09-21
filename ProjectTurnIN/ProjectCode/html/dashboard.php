<!DOCTYPE html>
<html>
	<!--Author:Prashant Desai-->
	<head>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>Pet Inn</title>
			<meta charset="utf-8">
			<!-- Optional theme -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
			<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">-->
			<link type="text/css" rel="stylesheet" href="../css/style.css" />

	</head>
	<style>
		.footer{
			position:absolute;
			bottom:0;
		}
		
		.nav-pills>li+li {
			 margin-left: 0px !important; 
		}
		
		.navHeaderStyle{
			padding-right: 0px !important; 
			padding-left: 0px !important; 
			text-align: center; 
			font-size: 2rem;
		}
	</style>
	<body>
	
		<?php include('header.php'); ?>
		<!--Remaining section-->
		
		<div class="container">
		  <ul class="nav nav-pills row" style="background: #dee6f1;">
			<!--<li class="active col-md-4 col-lg-4 navHeaderStyle"><a data-toggle="pill" href="#home">Clients</a></li>-->
			<li class="active col-md-6 col-lg-6 navHeaderStyle"><a data-toggle="pill" href="#menu1">Pets</a></li>
			<li class="col-md-6 col-lg-6 navHeaderStyle"><a data-toggle="pill" href="#menu2">Place an Order</a></li>
		  </ul>

		  <div class="tab-content">
			<!--<div id="home" class="tab-pane fade in active">
			<div class="row">
				<div class="col-md-12 col-lg-12">
				  <h3>Clients</h3>
				</div>
				<!--<div class="col-md-2 col-lg-2" style="margin-top: 1%;">
					<button type="button" class="btn btn-primary" onclick="addClient()">Add Client</button>
				</div>			  
			</div>
			</div>-->
			
			<div id="menu1" class="tab-pane fade in active">
			  <div class="row">
				<div class="col-md-10 col-lg-10">
				  <h3>Pets</h3>
				</div>
				<div class="col-md-2 col-lg-2" style="margin-top: 1%;">
					<button type="button" class="btn btn-primary" onclick="addPet();">Add Pet</button>
				</div>			  
			</div>
			  
			  <table class="table table-striped">
				  <thead>
					<tr>
					  <th scope="col">Name</th>
					  <th scope="col">Type</th>
					  <th scope="col">Gender</th>
					  <th scope="col">Size</th>
					</tr>
				  </thead>
				  <tbody>				
					<?php
					/* Attempt MySQL server connection. Assuming you are running MySQL
						server with default setting (user 'root' with no password) */
					  //mysqli_connect accepts 4 parameters as serverHostName, userName, password, schemaName
						$link = mysqli_connect("", "", "", "");
						
						// Check connection
						if($link === false){
							die("ERROR: Could not connect. " . mysqli_connect_error());
						} else {
							//echo "Connected...";
						}
						
						$sql = "SELECT PetID, PetName, PetType, Gender, Size FROM pet order by PetID DESC";
						$result = mysqli_query($link, $sql);
						
						if (mysqli_num_rows($result) > 0) {
							// output data of each row
							while($row = mysqli_fetch_assoc($result)) {
								echo "<tr><td class='nr'>" . $row["PetName"]. "</td><td>" . $row["PetType"]. "</td><td>" . $row["Gender"]. "</td><td>" . $row["Size"]. "</td><td><a href='addPet.php?id=" . $row['PetID'] . "'>Edit</a></td><td><a href='deletePet.php?id=" . $row['PetID'] . "'>Delete</a></td></tr>";
							}
						} else {
							echo "0 results";
						}
						
						// close connection
						mysqli_close($link);
					?>
				  </tbody>
			  </table>
			</div>
			
			<div id="menu2" class="tab-pane fade">
			  <div class="row">
				<div class="col-md-10 col-lg-10">
				   <h3>Place an Order</h3>
				</div>
				<div class="col-md-2 col-lg-2" style="margin-top: 1%;">
					<button type="button" class="btn btn-primary"><a href="./placeOrder.php" style="color: #fff !important;">Place Order</a></button>
				</div>			  
			</div>
		     </div>
		  </div>
		</div>
		
		<!------------------------------------>
		<?php include('footer.php'); ?>
	<script src="../js/main.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>
