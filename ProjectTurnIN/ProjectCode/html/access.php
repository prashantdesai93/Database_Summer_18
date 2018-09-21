<!--Author:Taylor Conners-->
<?php
    //The following fields must be entered in order to use 'placeOrder.php' and 'orderForm.php'
    //host_name: host endpoint of database instance
    //db_name: name of mysql database located at host_name
    //user_name: username with necessary database access privileges
    //password: password for specified username
    $db = new PDO("mysql:host=host_name;dbname=db_name", "user_name", "password", array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
?>