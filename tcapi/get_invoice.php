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

    $oid = !empty($_POST['oid'])? $_POST['oid']: null;
    $uid = !empty($_POST['uid'])? $_POST['uid']: null;
    $pid = !empty($_POST['pid'])? $_POST['pid']: null;

    $data = array();

    $query = "select * from tbl_invoice where oid = {$oid} and uid = {$uid} and pid = {$pid}";
    $result = $mysqli->query($query);
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            $data[] = $row;
        }
        $returnArr = array("status"=> "success", "message"=> "successfull", "data"=> $data);
    }else{
        $returnArr = array("status"=> "fail", "message"=> "faild", "data"=> $data);
    }
    echo json_encode($returnArr);
?>