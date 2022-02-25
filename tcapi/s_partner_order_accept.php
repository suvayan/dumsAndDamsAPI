<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    require_once (dirname( dirname(__FILE__) ).'/tcapi/PartnerPushNotification.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();

    //$partnerAccepts  = '{"pid":"1","oid":"1","sub_order_ids":["1","2","3"]}';

    $partnerAccepts = $_POST['partnerAccepts'];
    
    
    // $break = json_decode($partnerAccepts);
    
    // echo $break->pid;
    // exit;

    if(!empty($partnerAccepts)){
        $id       = array();
        $break = json_decode($partnerAccepts);
        $pid = $break->pid;
        $oid = $break->oid;
        foreach($break->sub_order_ids as $row){
            $id[] = $row;
        }
        if(!empty($id)){
            $ids = implode(',',$id);
            $sql = "update tbl_sub_order set status='Confirmed', pid={$pid} where id in ({$ids}) and oid = {$oid}";
            $result = $mysqli->query($sql);
            if($result){
                $sql2 = "select * from partner where id={$pid}";
                $result2 = $mysqli->query($sql2)->fetch_assoc();
                if($result2){
                  $pushNotification = new PartnerPushNotification($result2['a_token'], "Order Accepted", "You have accepted Order: {$oid} successfully", "alert.mp3");
                }
                $pushNotification->sendNotification();
                $returnArr = array("status"=> "success", "message"=> "Successfull", "data"=> "");
            }else{
                $returnArr = array("status"=> "fali", "message"=> "Failed", "data"=> "");
            }
        }else{
            $returnArr = array("status"=> "fali", "message"=> "sub_order_ids is required", "data"=> "");
        }
    }else{
        $returnArr = array("status"=> "fali", "message"=> "Pleace check any order", "data"=> "");
    }
    echo json_encode($returnArr);
?> 