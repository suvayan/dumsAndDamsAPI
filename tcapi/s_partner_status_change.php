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
    $id        = $_POST['id'];
    $status    = $_POST['status'];

    if($id == '' || $status == ''){
        $returnArr = array("status"=> "success", "message"=> "partner id and status is required", "data"=> "");
    }else{
        $result = $mysqli->query("update partner set status='{$status}' where id='{$id}'");
        if($result){
            $returnArr = array("status"=> "success", "message"=> "partner status change successfully", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "partner status  not change", "data"=> "");
        }
    }


    echo json_encode($returnArr);
?>