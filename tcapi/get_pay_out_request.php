<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();
    $required = array();
    $data = array();
    $pid='';

    if(!empty($_POST['pid'])){
        $pid=$_POST['pid'];
    }else{
        array_push($required, 'pid');
    }


    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "faild", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sql = "select * from payout_setting where pid={$pid}";
        $result = $mysqli->query($sql);
        if($result->num_rows){
            while($row = $result->fetch_assoc()){
                $data[] = $row;
            }
            $returnArr = array("status"=> "success", "message"=> "payout details", "data"=> $data);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "no payout details", "data"=> $data);
        }
    }
    echo json_encode($returnArr);
?>