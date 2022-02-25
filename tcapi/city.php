<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), false);
    $returnArr = array();
    $city = $mysqli->query("select * from tbl_city where status=1");
    $data = array();
    if(!empty($city)){
        while($row = $city->fetch_assoc()){
            $data[] = $row;
        }
    }
        
    $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $data);   
    echo json_encode($returnArr);
?>