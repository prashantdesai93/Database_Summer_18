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
	<body>
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
		
			$selectedName = "";
			
			$selectedDType = "";
			$selectedCType = "";
			
			$selectedGenderM = "";
			$selectedGenderF = "";
			
			$selectedSizeS = "";
			$selectedSizeM = "";
			$selectedSizeL = "";
			$selectedSizeXL = "";
	if (isset($_GET['id']) && is_numeric($_GET['id']))
			{
				$id = $_GET['id'];
		
				$sql = "SELECT PetID, PetName, PetType, Gender, Size FROM pet where PetID = $id";
				$resultSelectedPet = mysqli_query($link, $sql);
				
				if (mysqli_num_rows($resultSelectedPet) > 0) {
					while($row = mysqli_fetch_assoc($resultSelectedPet)) {
								$selectedName = $row["PetName"];
								if(strcmp($row["PetType"], "Dog") == 0){
									$selectedDType = "selected";
								} else{
									$selectedCType = "selected";
								}
								
								if(strcmp($row["Gender"], "M") == 0){
									$selectedGenderM = "selected";
								} else{
									$selectedGenderF = "selected";
								}
								
								if(strcmp($row["Size"], "S") == 0){
									$selectedSizeS = "selected";
								} else if(strcmp($row["Size"], "M") == 0){
									$selectedSizeM = "selected";
								} else if(strcmp($row["Size"], "L") == 0){
									$selectedSizeL = "selected";
								} else{
									$selectedSizeXL = "selected";
								}
							}
				} else {
							echo "0 results";
				}
				
				$personid = 201;
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
				
				if(isset($_POST['insertPet'])){ 
					$sqlUpdate = "UPDATE pet set PetName='$name', PetType='$selected_type', Gender='$selected_gender', Size='$selected_size' where PetID = $id";
					if(mysqli_query($link, $sqlUpdate)){
						echo "<script type='text/javascript'>alert('Record Updated successfully.');</script>";
						header('Location: dashboard.php'); 
				 } else{
					 echo "<script type='text/javascript'>alert('ERROR: Could not able to execute');</script>";
				 }
				}
			} else{ 
	if(isset($_POST['insertPet'])){ 
		
		// Escape user inputs for security
		$result = mysqli_query($link, "SELECT MAX(PetID) FROM pet");
		$row = mysqli_fetch_array($result);
			
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
		}
		?>
		
		<?php include('header.php'); ?>
		<!--Remaining section-->
		<center>
			<div>
				<div class="row AddPetRectangle">
					<form method="post">
						<div class="form-group">
							<div class="row">
								<div class="col-md-12 col-lg-12">
									<h3>ADD PET</h3>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 col-lg-12 addPetLabels">
									Name
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 col-lg-12 addPetInput">
									<input type="text" class="form-control" name="petname" id="petName" value="<?php echo $selectedName; ?>">
								</div>         	
							</div>
						
							<div class="row">
								<div class="col-md-12 col-lg-12 addPetLabels">
									Pet Type
								</div>
							</div>
						    <select class="form-control addPetInput" name="pettype" id="sel1">
								<option <?php echo $selectedDType; ?> >Dog</option>
								<option <?php echo $selectedCType; ?> >Cat</option>
						    </select>
							
							<div class="row">
								<div class="col-md-12 col-lg-12 addPetLabels">
									Gender
								</div>
							</div>
						    <select class="form-control addPetInput" name="petgender" id="sel1">
								<option <?php echo $selectedGenderM; ?> >M</option>
								<option <?php echo $selectedGenderF; ?> >F</option>
						    </select>
							
							<div class="row">
								<div class="col-md-12 col-lg-12 addPetLabels">
									Pet Size
								</div>
							</div>
						    <select class="form-control addPetInput" name="petsize" id="sel1">
								<!-- <option>Small (0-15 lbs)</option>
								<option>Medium (16-40 lbs)</option>
								<option>Large (41-100 lbs)</option>
								<option>Giant (101+ lbs)</option> -->
								<option <?php echo $selectedSizeS; ?> >S</option>
								<option <?php echo $selectedSizeM; ?> >M</option>
								<option <?php echo $selectedSizeL; ?> >L</option>
								<option <?php echo $selectedSizeXL; ?> >XL</option>
						    </select>
						</div>
						
					<center><input type="submit" id="addPetBtn" class="btn btn-default addPet" name="insertPet" onclick="InsertPet();" value="Add" /></center>
					</form>
					
							
				</div>
			</div>
		</center>
		<!------------------------------------>
		<?php include('footer.php'); ?>
	<script src="../js/main.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>
