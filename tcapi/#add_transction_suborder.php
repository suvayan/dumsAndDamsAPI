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

    if(!empty($_POST['uid'])){
        $uid = $_POST['uid'];
    }else{
        array_push($required,"uid");
    }

    if(!empty($_POST['oid'])){
        $oid = $_POST['oid'];
    }else{
        array_push($required,"oid");
    }

    if(!empty($_POST['transaction_id'])){
        $transaction_id = $_POST['transaction_id'];
    }else{
        array_push($required,"transaction_id");
    }

    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "faild", "message"=> "oid, uid, transaction_id", "data"=> "");
    }else{
        $sql = "update tbl_sub_order set transaction_id = '{$transaction_id}' where id in (select id from tbl_sub_order where oid={$oid} and uid={$uid})";
        // $sql;exit;
        
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "Successfull", "data"=> "");
        }else{
            $returnArr = array("status"=> "faild", "message"=> "Faild", "data"=> "");
        }
    }

    echo json_encode($returnArr);

?>