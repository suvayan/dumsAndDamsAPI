<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $uid            = $_POST['uid'];
    $oid            = $_POST['oid'];
    $transaction_id = $_POST['transaction_id'];
    $returnArr = array();

    $sql   = "update tbl_sub_order set transaction_id = '{$transaction_id}' where id in (select id from tbl_sub_order where oid={$oid} and uid={$uid})";
    $query = $mysqli->query($sql);

    if($query){
        $returnArr = array("status"=> "success", "message"=> "Success", "data"=> "");
    }else{
        $returnArr = array("status"=> "fail", "message"=> "Faild", "data"=> "");
    }
    echo json_encode($returnArr);
?>