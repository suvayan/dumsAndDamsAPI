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

    $uid = $_POST['id'];

    if(empty($uid)){
        $returnArr = array("status"=> "fail", "message"=> "user id is not found", "data"=> "");
    }else{
        $result = $mysqli->query("select * from tbl_user where id =".$uid)->fetch_assoc();
        if(!empty($result)){
            $returnArr = array("status"=> "success", "message"=> "user details", "data"=> $result);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "server error", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>