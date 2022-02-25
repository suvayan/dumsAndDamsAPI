<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    require_once (dirname( dirname(__FILE__) ).'/tcapi/PartnerPushNotification.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();
    
    $pid = $_POST['pid'];
    $oid = $_POST['oid'];
    
    if($pid == '' || $oid == ''){
        $returnArr = array("status"=> "success", "message"=> "pid, oid are required", "data"=> "");
    }else{
       $sql ="delete from temp_order_partner_tbl where oid = {$oid} and pid={$pid}"; 
       $result = $mysqli->query($sql);
       if($result){
           $returnArr = array("status"=> "success", "message"=> "Order is rejected successfully", "data"=> "");
       }else{
           $returnArr = array("status"=> "fali", "message"=> "Order rejection is failed", "data"=> "");
       }
    }
    
    echo json_encode($returnArr);
?> 