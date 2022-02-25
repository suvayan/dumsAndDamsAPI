<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $uid = $_POST['uid'];
    $returnArr = array();

    if($uid == ''){
	    $returnArr = array("status"=> "fail", "message"=> "user id required", "data"=> "Something Went wrong  try again !");
    }else{
        $reports = array();
        $report = $mysqli->query("select * from wallet_report where uid=".$uid);
        
        while($row = $report->fetch_assoc()){
            $reports[] = $row;
        }
        $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $reports);
    }

    echo json_encode($returnArr);
?>