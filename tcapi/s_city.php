<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $uid = $data['uid'];
    $returnArr = array();

    if($uid == ''){
	    $returnArr = array("status"=> "fail", "message"=> "user id required", "data"=> "Something Went wrong  try again !");
    }else{
        $cities = array();
        $city = $mysqli->query("select * from tbl_city where status=1");
        $poli = array();
        while($row = $city->fetch_assoc()){
	        $poli['id'] = $row['id'];
	        $poli['cname'] = $row['cname'];
	        $poli['status'] = $row['status'];
            $cities[] = $poli;
        }
        $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $cities);
    }

    echo json_encode($returnArr);
?>