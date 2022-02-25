<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $mid = $_POST['mid'];
    $returnArr = array();

    if($mid == ''){
	    $returnArr = array("status"=> "fail", "message"=> "cid id required", "data"=> "Something Went wrong  try again !");
    }else{
        $services = array();
        $service = $mysqli->query("select * from tbl_partner_service where status=1 and mid=".$mid);
        while($row = $service->fetch_assoc()){
            $services[] = $row;
        }
        $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $services);
    }

    echo json_encode($returnArr);
?>