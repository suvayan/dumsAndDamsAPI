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

    $url = dirname( dirname(__FILE__) ).'/assets/addon/';
    $imageName = '';
    if(!empty($_FILES["image"]['name'])){
        $imageName     = time().$_FILES["image"]['name'];
        $imageTempName = $_FILES["image"]['tmp_name'];
        move_uploaded_file($imageTempName, $url.$imageName);
    }
    

    $cid        = (int)$_POST['cid'];
    $title      = $_POST['title'];
    $price      = (float)$_POST['price'];
    $status     = 1;
    $image      = !empty($imageName)?'assets/addon'.$imageName : null;

    if($cid=='' && $title=='' && $price==''){
        $returnArr = array("status"=> "success", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sql = "insert into tbl_addon (cid, title, price, img, status) values ('$cid','{$title}','$price','{$image}','$status')";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "add_on insert successfull", "data"=> '');
        }else{
            $returnArr = array("status"=> "success", "message"=> "add_on insert failed", "data"=> '');
        }
    }

    echo json_encode($returnArr);
?>