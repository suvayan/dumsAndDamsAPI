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
    $required = array();
    $cid=$dstatus=$days=$tslot='';

    if(empty($_POST['cid'])){
        array_push($required,"cid");
    }else{
        $cid=$_POST['cid'];
    }

    if(empty($_POST['dstatus'])){
        array_push($required,"dstatus");
    }else{
        $dstatus=$_POST['dstatus'];
    }

    if(empty($_POST['days'])){
        array_push($required,"days");
    }else{
        $days=md5($data['days']);
    }

    if(empty($_POST['tslot'])){
        array_push($required,"tslot");
    }else{
        $tslot=$_POST['tslot'];
    }

    if(count($required) > 0){
        $returnArr = array("status"=> "fail", "message"=> "please, fill in the required fields", "data"=> "");
   }else{

        $query = "insert into partner(cid, dstatus, days, tslot) values ('{$cid}','{$dstatus}','{$days}','{$tslot}')";
        $result = $mysqli->query($query);
        
        if($result){
            $returnArr = array("status"=> "success", "message"=> "your registration is successfull", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "your registration has been failed", "data"=> "");
        }
   }

    echo json_encode($returnArr);
?>