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
    $id    = $_POST['oid'];
    $uid   = $_POST['uid'];
    $o_status = "Cancelled";//$_POST['o_status'];
    $a_status = 0;//$_POST['a_status'];

    if($id == '' && $uid == '' && $o_status == '' && $a_status == ''){
        $returnArr = array("status"=> "success", "message"=> "id, uid, o_status, are required", "data"=>"");
    }else{
        $sql = "update tbl_order set o_status='{$o_status}', a_status={$a_status} where id={$id} and uid={$uid}";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "Your order is {$o_status} successfully", "data"=>"");
        }else{
            $returnArr = array("status"=> "success", "message"=> "Your order is not {$o_status}", "data"=>"");
        }
    }
    echo json_encode($returnArr);
?>