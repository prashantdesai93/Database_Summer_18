<!--Author:Taylor Conners-->
<?php
    require_once('access.php');
    if(!isset($_SESSION)){
        session_start();
    }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Place An Order</title>
</head>
<body>
    <?php include('header.php'); ?>
    <a href="./dashboard.php">Return to Dashboard</a>
    <?php
        //This block of code is executed when an order has been successfully placed.
        if(isset($_SESSION['order_finalorderid'])) {
            echo "<br>Order entered successfully into database: <br>Order Entry:<br>";
            $stmt=$db->prepare("SELECT * FROM orders WHERE OrderID = ? ");
            $stmt->execute(array($_SESSION['order_finalorderid']));
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<br>";
                printf("OrderID: %s  PetID: %s  TechID: %s  StartDate: %s  EndDate:  %s", $row['OrderID'], $row['PetID'], $row['TechID'], $row['StartDate'], $row['EndDate']);
            }
            echo "<br>Order Services: <br>";
            $stmt=$db->prepare("SELECT * FROM orderservices WHERE OrderID = ? ");
            $stmt->execute(array($_SESSION['order_finalorderid']));
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<br>";
                printf("OrderServiceID: %s  OrderID: %s  ServiceID %s", $row['OrderServiceID'], $row['OrderID'], $row['ServiceID']);
            }
            session_unset();
        }

        //Redirect them to the Order Form
        if(isset($_POST['submit_2'])){
            //Validate that the Pet belongs to the person.
            //printf("%s     %s", $_POST['person'], $_POST['pet']);
            $spf = sprintf("Location: ./orderForm.php");      
            header($spf);
        }

        $person_fname_lname = '';
        $person_id          = '';
        $pet_id             = '';
        $pet_name           = '';
        $person_ok          = false;

        //validate submissions
        if(isset($_POST['submit'])) {
            $person_ok = true;
            $pet_ok    = true;

            //check form for 'person'
            if(!isset($_POST['person'])) {
                $person_ok = false;
            } else {
                $person_fname_lname       = $_POST['person'];
                $person                   = explode(" ", $_POST['person']);
                $_SESSION['order_person'] = $person_fname_lname;
            }

            //check form for 'pet'
            if(!isset($_POST['pet'])) {
                $pet_ok=false;
            } else {
                $pet_name = $_POST['pet'];
                $_SESSION['order_pet'] = $pet_name;
            }

            //if the form submission contained a 'person'
            if($person_ok) {
                try{
                    //retrieve PersonID of user selection
                    
                    $stmt = $db->prepare("SELECT * FROM person WHERE person.FName regexp :f_name AND person.LName regexp :l_name ");
                    $stmt->bindParam(':f_name', $person[0]);
                    $stmt->bindParam(':l_name', $person[1]);
                    $stmt->execute();
                    while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $person_id = $row['PersonID'];
                        $_SESSION['order_personid']   = $person_id;
                        $_SESSION['order_streetname'] = $row['StreetName'];
                        $_SESSION['order_apartment']  = $row['Apartment'];
                        $_SESSION['order_zipcode']    = $row['Zipcode'];
                        $_SESSION['order_city']       = $row['City'];
                        $_SESSION['order_county']     = $row['County'];
                        $_SESSION['order_state']      = $row['State'];
                        $_SESSION['order_email']      = $row['Email'];
                    }
                }
                catch (PDOException $e) {
                    printf("%s", $e->getMessage());
                }
            }
            //if the form submission contained a 'pet'
            if($pet_ok) {
                try {
                    //retrieve PetID of pet
                    $stmt = $db->prepare("SELECT * FROM pet WHERE pet.PetName = ? ");
                    $stmt->execute(array($pet_name));
                    while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $pet_id                      = $row['PetID'];
                        $pet_name                    = $row['PetName'];
                        $_SESSION['order_petid']     = $pet_id;
                        $_SESSION['order_pet']       = $pet_name;
                        $_SESSION['order_pettype']   = $row['PetType'];
                        $_SESSION['order_petgender'] = $row['Gender'];
                        $_SESSION['order_petsize']   = $row['Size'];
                    }
                    //Validate that the selected pet belongs to the selected person
                    //if it belongs to another person, set pet to new person's first pet
                    $stmt = $db->prepare("SELECT * FROM pet, person WHERE pet.PersonID = $person_id AND pet.PetID = $pet_id");                   
                    $stmt->execute();
                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                    if ($row == null) {
                        $stmt = $db->prepare("SELECT * FROM pet WHERE pet.PersonID = $person_id");
                        $stmt->execute();
                        $row = $stmt->fetch(PDO::FETCH_ASSOC);
                        $pet_id                      = $row['PetID'];
                        $pet_name                    = $row['PetName'];
                        $_SESSION['order_petid']     = $pet_id;
                        $_SESSION['order_pet']       = $pet_name;
                        $_SESSION['order_pettype']   = $row['PetType'];
                        $_SESSION['order_petgender'] = $row['Gender'];
                        $_SESSION['order_petsize']   =$row['Size'];
                    }
                }
                catch (PDOException $e) {
                    printf("%s", $e->getMessage());
                }   
            }
        }
    ?>
    <h4>Select a Person: </h4>
    <form method="post" action="">
        Person:
        <select name="person">
            <?php
                try {
                    //Populate select with all 'person' rows
                    $stmt = $db->prepare("SELECT * FROM person WHERE person.PersonID IN (SELECT pet.PersonID FROM pet)");
                    $stmt->execute();
                    while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $val = $row['FName'] . " " . $row['LName'];
                        if($val === $person_fname_lname) {
                            echo "<option value = '" . $val . "' selected>" . $val . "</option>";
                            continue;
                        }
                        echo "<option value = '" . $val . "'>" . $val . "</option>";
                    }
                }
                catch (PDOException $e) {
                    printf("A problem has occured: %s", $e->getMessage());   
                }
            ?>
        </select><br>

        <?php if($person_ok) :?>
        <h4>Select a Pet: </h4>
        Pet:
        <select name="pet">
            <?php
                try {
                    $stmt = $db->prepare("SELECT * FROM pet WHERE pet.PersonID = ? ");
                    $stmt->execute(array($person_id));
                    while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        $val = $row['PetName'];
                        if($val === $pet_name) {
                                echo "<option value = '" . $val . "' selected>" . $val . "</option>";
                                continue;
                        }
                        echo "<option value = '" . $val . "'>" . $val . "</option>";
                    }
                }
                catch (PDOException $e) {
                    printf("A problem has occured: %s", $e->getMessage());      
                }
            ?>
        </select><br><br>
        <?php endif; ?>

        <input type = "submit" name = "submit" value = "Submit"><br>

        <?php if($person_ok && $pet_ok) :?>
        <h3>Place an order for:</h3>
        <?php printf("Person: %s ", $person_fname_lname);?>
        <br>
        <?php printf("Pet: %s ", $pet_name);?>
        <br>
        <br><input type = "submit" name = "submit_2" value = "Begin Order">
        <?php endif ;?>
    </form><br><br>
<?php include('footer.php'); ?>
<script src="../js/main.js"></script>
</body>
</html>