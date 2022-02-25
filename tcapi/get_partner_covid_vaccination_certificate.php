<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    //$data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();
    $required = array();
    $pid = '';
    if(!empty($_POST['pid'])){
        $pid = $_POST['pid'];
    }else{
        array_push($required, 'pid');
    }

    if(empty($required) && count($required) > 0){
        $returnArr = array("status"=> "success", "message"=> "partner id is required", "data"=> "");
    }else{
        $sql = "select * from tbl_partner_vaccination_certificate where pid={$pid}";
        $result = $mysqli->query($sql);
        if($result){
            $data = $result->fetch_assoc();
            $returnArr = array("status"=> "success", "message"=> "partner certificate", "data"=> $data);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "no partner certificate", "data"=> "");
        }
    }


    echo json_encode($returnArr);
?>