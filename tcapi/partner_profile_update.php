<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();

    $id       = $_POST['id'];
    $name     = !empty($_POST['name'])?$_POST['name'] : null;
    $email    = !empty($_POST['email'])?$_POST['email'] : null;
    $mobile   = !empty($_POST['mobile'])?$_POST['mobile'] : null;
    $city     = !empty($_POST['city'])?$_POST['city'] : null;
    $address  = !empty($_POST['address'])?$_POST['address'] : null;
    $category = !empty($_POST['category'])?$_POST['category'] : null;
    $bio      = !empty($_POST['bio'])?$_POST['bio'] : null;
    $result = $mysqli->query("update partner set name='{$name}', email='{$email}', mobile='{$mobile}', city='{$city}', address='{$address}', category_id='{$category}', bio='{$bio}' where id='{$id}'");

    if($result){
        $returnArr = array("status"=> "success", "message"=> "partner data is successfully update", "data"=> "");
    }else{
        $returnArr = array("status"=> "fail", "message"=> "partner data is not update", "data"=> "");
    }
    echo json_encode($returnArr);
?>