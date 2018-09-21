<!DOCTYPE html>
<html>
	<!--Author:Prashant Desai-->
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Pet Inn</title>
		<meta charset="utf-8">
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">-->
		<link type="text/css" rel="stylesheet" href="../css/style.css" />

	</head>

	<body class="bg">
	<div class="page-header">
	  <h1 class="headStyle">Pet Inn <small class="sloganStyle">WE CARE FOR YOUR PET</small></h1>
	</div>
	
	<ul class="nav nav-pills navStyle">
	  <!--<li class="active"><a style="color: white;" href="#menu1" data-toggle="tab" id="menu_text" onclick="signUpClick();">Sign Up</a></li>
	  <li class="active"><a style="color: white;" href="#menu1" data-toggle="tab" id="menu_text" onclick="signInClick();">Sign In</a></li>-->
	  <!--<li role="presentation"><a href="#">Messages</a></li>-->
	</ul>
	
	<!--<div class="container rectangle" id="signUpRect">
		<div class="row signIn">Sign Up</div>
		<div class="row">
			<div class="col-md-6 col-lg-6 signInLabels">
				First Name
			</div>
			<div class="col-md-6 col-lg-6 signInLabels">
				Last Name
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-6">
				<input type="text" class="form-control" id="firstName">
			</div>
			<div class="col-md-6 col-lg-6">
				<input type="text" class="form-control" id="lastName">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-lg-6 signInLabels">
				Apt. No.
			</div>
			<div class="col-md-6 col-lg-6 signInLabels">
				StreetName
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-6">
				<input type="text" class="form-control" id="aptNo">
			</div>
			<div class="col-md-6 col-lg-6">
				<input type="text" class="form-control" id="streetName">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-lg-6 signInLabels">
				City
			</div>
			<div class="col-md-6 col-lg-6 signInLabels">
				State
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-6">
				<input type="text" class="form-control" id="city">
			</div>
			<div class="col-md-6 col-lg-6">
				<input type="text" class="form-control" id="state">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-lg-6 signInLabels">
				Country
			</div>
			<div class="col-md-6 col-lg-6 signInLabels">
				Zip Code
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-6">
				<input type="text" class="form-control" id="country">
			</div>
			<div class="col-md-6 col-lg-6">
				<input type="text" class="form-control" id="zipCode">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 col-lg-12 signInLabels">
				Email
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<input type="email" class="form-control" id="email">
			</div>         	
		</div>
		
		<div class="row">
			<div class="col-md-12 col-lg-12 signInLabels">
				Password
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<input type="password" class="form-control" id="password">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 col-lg-12 signInLabels">
				Confirm Password
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<input type="password" class="form-control" id="confirmPassword">
			</div>
		</div>
		
		<center><button type="submit" id="signUpBtn" class="btn btn-default btnSignUp">Sign Up</button></center>
	</div>-->
	
	<div class="container SignInRectangle" id="signInRect" <!--style="display: none;"-->>
		<div class="row signIn">Sign In</div>
		
		<div class="row">
			<div class="col-md-12 col-lg-12 signInLabels">
				Email
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<input type="email" class="form-control" id="email1" value="admin">
			</div>         	
		</div>
		
		<div class="row">
			<div class="col-md-12 col-lg-12 signInLabels">
				Password
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<input type="password" class="form-control" id="password1" value="admin">
			</div>
		</div>
		
		<center><button type="submit" id="signIpBtn" class="btn btn-default btnSignUp" onclick="signIn();">Sign In</button></center>
	</div>
	
		<script src="../js/main.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>

</html>
