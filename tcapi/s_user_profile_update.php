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

    $id        = $_POST['id'];
    $name      = !empty($_POST['name'])?$_POST['name'] : '';
    $email     = !empty($_POST['email'])?$_POST['email'] : '';
    $mobile    = !empty($_POST['mobile'])?$_POST['mobile'] : '';
    $result    = $mysqli->query("update tbl_user set name='{$name}', email='{$email}', mobile='{$mobile}' where id='$id'");
    if($result){
        $returnArr = array("status"=> "success", "message"=> "user data is successfully update", "data"=> "");
    }else{
        $returnArr = array("status"=> "fail", "message"=> "user data is not update", "data"=> "");
    }
    echo json_encode($returnArr);
?>