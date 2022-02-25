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

    //$partnerCancels  = '{"pid":"1","oid":"1","sub_order_ids":["1","2","3"]}';

    $partnerCancels = $_POST['partnerCancels'];

    if(!empty($partnerCancels)){
        $id       = array();
        $break = json_decode($partnerCancels);
        $pid = $break->pid;
        $oid = $break->oid;
        foreach($break->sub_order_ids as $row){
            $id[] = $row;
        }
        if(!empty($id)){
                $ids = implode(',',$id);
                $sql = "update tbl_sub_order set status='Pending', pid='' where id in ({$ids}) and oid = {$oid} and pid={$pid}";
                $result = $mysqli->query($sql);
                $sqlOne = "update temp_order_partner_tbl set status=0 where oid = {$oid} and pid={$pid}";
                $resultOne = $mysqli->query($sqlOne);
                $sql2 = "select * from partner where id={$pid}";
                $result2 = $mysqli->query($sql2)->fetch_assoc();
                if($result2){
                  $pushNotification = new PartnerPushNotification($result2['a_token'], "Order Cancelled", "You have cancelled Order: {$oid}", "alert.mp3");
                }
                $pushNotification->sendNotification();
                if($resultOne){
                    $returnArr = array("status"=> "success", "message"=> "Successfull", "data"=> "");
                }else{
                    $returnArr = array("status"=> "fali", "message"=> "Failed L1", "data"=> "");
                }
            }else{
                $returnArr = array("status"=> "fali", "message"=> "Failed L2", "data"=> "");
            }
    }else{
        $returnArr = array("status"=> "fali", "message"=> "sub_order_ids is required", "data"=> "");
    }
    echo json_encode($returnArr);
?> 