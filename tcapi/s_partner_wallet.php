<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();
    $pid     = $_POST['id'];
    $report  = array();

    if($pid == ''){
        $returnArr = array("status"=> "success", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sqlOne    = "select * from partner_wallet_report where pid='{$pid}'";
        $resultOne = $mysqli->query($sqlOne);
        while($row = $resultOne->fetch_assoc()){
            $report[] = $row;
        }

        if(!empty($report) && count($report) > 0){
            $returnArr = array("status"=> "success", "message"=> "your walet details", "data"=> $report);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "your walet details", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>