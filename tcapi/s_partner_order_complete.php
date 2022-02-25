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
    $required = array();
    $oid=$pid='';
    $status = "Completed";


    if(!empty($_POST['oid'])){
        $oid= $_POST['oid'];
    }else{
        array_push($required, "oid");
    }

    if(!empty($_POST['pid'])){
        $pid= $_POST['pid'];
    }else{
        array_push($required, "pid");
    }

    if(!empty($required)){
        $returnArr = array("status"=> "fail", "message"=> "oid and pid are required");
    }else{
        $date = date('Y-m-d H:i:s');
        $queryOne = $mysqli->query("update tbl_sub_order set status = '{$status}', datetime='{$date}' where id in (select id from tbl_sub_order where oid = {$oid} and pid = {$pid})");

        if($queryOne){
            
            $queryTwo = $mysqli->query("select * from tbl_sub_order where oid = {$oid} and status= 'Confirmed'");
            if($queryTwo->num_rows == 0){
                $queryThree = $mysqli->query("update tbl_order set o_status='{$status}' where id = {$oid}");
                if($queryThree){
                    $returnArr = array("status"=> "success", "message"=> "order is completed");
                }else{
                    $returnArr = array("status"=> "fail", "message"=> "order is not completed");
                }
            }else{
                $returnArr = array("status"=> "success", "message"=> "order is completed");
            }
        }else{
            $returnArr = array("status"=> "fail", "message"=> "order is not completed");
        }

    }

    echo json_encode($returnArr);
?>