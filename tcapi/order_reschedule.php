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
    $odate = $_POST['odate'];
    $otime = $_POST['otime'];

    if($id == '' && $uid == '' && $odate == '' && $otime == ''){
        $returnArr = array("status"=> "success", "message"=> "id, uid, otime, otime are required", "data"=>"");
    }else{
        $sql = "update tbl_order set odate='{$odate}', otime='{$otime}' where id={$id} and uid={$uid}";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "Your order is rescheduled successfully", "data"=>"");
        }else{
            $returnArr = array("status"=> "success", "message"=> "Your order is not rescheduled", "data"=>"");
        }
    }
    echo json_encode($returnArr);
?>