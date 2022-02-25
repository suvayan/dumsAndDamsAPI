<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    //$data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();
    $methods = array();
    $method  = $mysqli->query("select * from tbl_payment_list where status = 1");

    while($row = $method->fetch_assoc()){
        $methods[] = $row;
    }
    
    $returnArr = array("status"=> "success", "message"=> "payment method list", "data"=> $methods);

    echo json_encode($returnArr);
?>