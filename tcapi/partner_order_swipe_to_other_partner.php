<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $oid   = $_POST['oid'];
    $uid   = $_POST['uid'];
    $pid   = $_POST['pid'];
    $spid  = $_POST['spid'];
    $returnArr = array();

    $sqlOne = "select * from temp_order_partner_tbl where oid={$oid} and uid={$uid} and pid={$spid}";
    $resultOne = $mysqli->query($sqlOne);

    if($resultOne->num_rows == 0){
        $sqlTwo = "insert into temp_order_partner_tbl(oid, uid, pid) values ({$oid}, {$uid}, {$spid})";
        $resultTwo = $mysqli->query($sqlTwo);
        if($resultTwo){
            $sqlThree = "delete from temp_order_partner_tbl where oid={$oid} and uid={$uid} and pid={$pid}";
            $resultThree = $mysqli->query($sqlThree);
            if($resultThree){
                $returnArr = array("status"=> "success", "message"=> "partner swipe successfully", "data"=> "");
            }else{
                $returnArr = array("status"=> "fail", "message"=> "partner swipe failed", "data"=> "");
            }
        }
    }else{
        $sqlThree = "delete from temp_order_partner_tbl where oid={$oid} and uid={$uid} and pid={$pid}";
        $resultThree = $mysqli->query($sqlThree);
        if($resultThree){
            $returnArr = array("status"=> "success", "message"=> "partner swipe successfully", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "partner swipe failed", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>