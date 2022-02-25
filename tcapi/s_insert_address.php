<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data        = json_decode(file_get_contents('php://input'), false);
    $returnArr   = array();
    $pid         = !empty($_POST['pid']) ? $_POST['pid'] : null;
    $house_no    = !empty($_POST['house_no']) ? $_POST['house_no'] : null;
    $street_name = !empty($_POST['street_name']) ? $_POST['street_name'] : null;
    $location    = !empty($_POST['location']) ? $_POST['location'] : null;
    $city        = !empty($_POST['city']) ? $_POST['city'] : null;
    $pincode     = !empty($_POST['pincode']) ? $_POST['pincode'] : null;


    $sql   = "insert into tbl_prtner_address (pid, house_no, street_name, location, city, pincode) values ({$pid}, '{$house_no}', '{$street_name}', '{$location}', '{$city}', '{$pincode}')";
    $query = $mysqli->query($sql);
    if($query){
            $returnArr = array("status"=> "success", "message"=> "successfully data insert", "data"=>(object)array("id"=>$mysqli->insert_id));  
    }else{
            $returnArr = array("status"=> "fail", "message"=> "faild to insert data");  
    }
    echo json_encode($returnArr);
?>