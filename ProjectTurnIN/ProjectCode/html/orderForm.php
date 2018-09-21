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
    <title>Order Form</title>
</head>
<body>
<?php include('header.php'); ?>
<a href = "./placeorder.php">Select Another Pet/Person</a>
<!--<button type="button" class="btn btn-primary" onclick="placeOrder();">Place Order</button>-->
<?php

    $person_id   = $_SESSION['order_personid'];
    $pet_id      = $_SESSION['order_petid'];
    $person_name = $_SESSION['order_person'];
    $pet_name    = $_SESSION['order_pet'];
    $pet_type    = $_SESSION['order_pettype'];
    $pet_gender  = $_SESSION['order_petgender'];
    $pet_size    = $_SESSION['order_petsize'];

    $service_ok      = false;
    $serve_id_string = '';

    if (isset($_SESSION['order_servicecount'])) {
        for ($i=0; $i<$_SESSION['order_servicecount'];$i++) {
            if (isset($_POST['serviceid_' . $i])) {
                $service_ok                        = true;
                $_SESSION['order_serviceid_' . $i] = $i;
                $serve_id_string                   = $serve_id_string . $i . "xxx , xxx";
                //break;
            } else {
                unset($_SESSION['order_serviceid_' . $i]);
            }
            //$service_ok = false;
        }
    }

    $start_date_ok = true;
    if(!isset($_POST['start_date'])) {
        $start_date_ok = false;
    }

    $end_date_ok = true;
    if(!isset($_POST['end_date'])) {
        $end_date_ok = false;
    }

    $technician_ok = true;
    if(!isset($_POST['technician'])) {
        $technician_ok = false;
    } else {
        $_SESSION['order_technician'] = $_POST['technician'];
    }

    if($service_ok && $start_date_ok && $end_date_ok && $technician_ok) {
        $_SESSION['order_startdate'] = $_POST['start_date'];
        $_SESSION['order_enddate']   = $_POST['end_date'];

        //retrieve tech id
        $query_parts = explode(" ", $_POST['technician']);
        $tech_id     = $query_parts[2];
        //$stmt = $db->prepare("SELECT * FROM tech WHERE ")

        //Calculate the total cost of the order before moving on:
        $query_parts     = explode("xxx", $serve_id_string);
        $serve_id_string = '';
        for($i=0;$i<count($query_parts)-2;$i++) {
            $serve_id_string .= $query_parts[$i];
        }
        //echo "<br>" . $serve_id_string;
        $total_cost = 0;
        $sql        = "SELECT * FROM services WHERE ServiceID IN (" . $serve_id_string . ") ";
        $stmt       = $db->prepare($sql);
        $stmt->execute();
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $total_cost+=$row['Cost'];
            //echo $row['Cost'];
        }

        //Enter the order
        $stmt = $db->prepare("SELECT max(OrderID) AS oid_ FROM orders");
        $stmt->execute();
        while($row=$stmt->fetch(PDO::FETCH_ASSOC)) {
            $new_id = $row['oid_'] + 1;     
        }

        $stmt = $db->prepare("INSERT INTO orders (OrderID, PetID, TechID, StartDate, EndDate) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute(array($new_id, $pet_id, /*$_SESSION['order_techid']*/$tech_id, $_SESSION['order_startdate'], $_SESSION['order_enddate']));

        $_SESSION['order_finalorderid'] = $new_id;
        
        $stmt = $db->prepare("SELECT max(OrderServiceID) AS oid_ FROM orderservices");
        $stmt->execute();
        while($row=$stmt->fetch(PDO::FETCH_ASSOC)) {
            $new_id_os = $row['oid_'];     
        }

        //enter order services
        for ($i=0; $i<$_SESSION['order_servicecount'];$i++) {
            if (isset($_SESSION['order_serviceid_' . $i])) {
                $new_id_os++;
                $stmt = $db->prepare("INSERT INTO orderservices (OrderServiceID, OrderID, ServiceID) VALUES (?, ?, ?)");
                $stmt->execute(array($new_id_os, $new_id, $_SESSION['order_serviceid_' . $i]));
            }
        }

        //echo "<br>" . $total_cost;
        $_SESSION['order_totalcost'] = $total_cost;
        if(isset($_POST['submit'])) {
            $spf = sprintf("Location: ./placeOrder.php");      
            header($spf);
        }
    } else {
        if (isset($_SESSION['order_startdate'])){
            unset($_SESSION['order_startdate']);
        }
        if (isset($_SESSION['order_enddate'])){
            unset($_SESSION['order_enddate']);
        }
        echo "<br>Error: All fields must contain a value to place an order.";
    }

    
?>
<?php printf("<h3>Pet Owner: " . $person_name . "</h3><h3>Pet Name: " . $pet_name . "</h3><br>");?>

<form method="post" action="">
    Services:
    <?php
        try {
            
            $stmt=$db->prepare("SELECT * FROM services");
            $stmt->execute();
            printf('<table bgcolor="bdc0ff" cellpadding="20">');
            printf("<tr><b><th>ServiceID</th><th>Service Type</th> <th>Service Description</th> <th>Cost</th></b></tr>");
            $_SESSION['order_servicecount'] = count($stmt->fetch());
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                if(isset($_POST['serviceid_' . $row['ServiceID']])) {
                    printf("<tr><b><td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td></b></tr>", '<input type = "checkbox" name = serviceid_' . $row["ServiceID"] . ' value=' . $row["ServiceID"] .' checked>'
                       , $row["ServiceType"], $row["Description"], $row["Cost"]);
                    continue;
                }
                printf("<tr><b><td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td></b></tr>", '<input type = "checkbox" name = serviceid_' . $row["ServiceID"] . ' value=' . $row["ServiceID"] .'>'
                       , $row["ServiceType"], $row["Description"], $row["Cost"]);
                //$_SESSION["serviceid_" . $row["ServiceID"]] = false;
            }
            printf("</table>");
            echo "<br>";

        }
        catch(PDOException $e) {
            prinf("There was a problem connecting to the database: %s", $e->getMessage());
        }
        //printf("%s    %s", $_SESSION['order_person'], $_SESSION['order_pet']);
        
    ?><br>

    Technician:
    <select name="technician"> 
    <?php
        try{
            $stmt=$db->prepare("SELECT * FROM tech INNER JOIN (SELECT person.PersonId, person.FName, person.LName FROM person) AS view1 ON tech.PersonID = view1.PersonID");
            $stmt->execute();
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $val = $row['FName'] . " " . $row['LName'] . " " . $row['TechID'];
                if ($val === $_SESSION['order_technician']) {
                    $_SESSION['order_techid'] = $row['TechID'];
                    echo "<option value = '" . $val . "' selected>" . $val . "</option>";
                    continue;
                }
                echo "<option value = '" . $val . "'>" . $val . "</option>";
            }
        }
        catch(PDOException $e) {
            prinf("There was a problem connecting to the database: %s", $e->getMessage());
        }
    ?>
    </select> <br>

    Start Date: <input type="date" name="start_date" value=""><br>
    End Date: <input type="date" name="end_date" value=""><br>
    <input type="submit" name="submit" value="Submit"><br>
</form>

<?php include('footer.php'); ?>
<script src="../js/main.js"></script>
</body>
</html>