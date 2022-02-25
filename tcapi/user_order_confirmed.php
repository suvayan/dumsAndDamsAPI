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
    $id          = $_POST['id'];
    $uid         = $_POST['uid'];
    $p_method_id = $_POST['p_method_id'];
    $trans_id    = $_POST['trans_id'];
    $o_status    = "Confirmed";
    $a_status    = 1;

    if($id == '' && $uid == '' && $o_status == '' && $a_status == ''){
        $returnArr = array("status"=> "success", "message"=> "id, uid, o_status, are required", "data"=>"");
    }else{
        $sql = "update tbl_order set o_status='{$o_status}', a_status={$a_status}, p_method_id='{$p_method_id}', trans_id='{$trans_id}' where id={$id} and uid={$uid}";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "Your order is confirmed successfully", "data"=>"");
        }else{
            $returnArr = array("status"=> "success", "message"=> "Your order is not confirmed", "data"=>"");
        }
    }
    echo json_encode($returnArr);
?>