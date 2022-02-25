<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();
    $url = dirname( dirname(__FILE__) ).'/assets/partner/';
    $imageName = '';
    $videoName = '';

    $title    = !empty($_POST['title'])?$mysqli->real_escape_string($_POST['title']) : null;
    $discount = !empty($_POST['discount'])?$mysqli->real_escape_string($_POST['discount']) : null;
    $ttken    = !empty($_POST['ttken'])?$_POST['ttken'] : null;
    $mqty     = !empty($_POST['mqty'])?$_POST['mqty'] : null;
    $price    = !empty($_POST['price'])?$_POST['price'] : null;
    $status   = !empty($_POST['status'])?$_POST['status'] : null;
    $s_show   = !empty($_POST['s_show'])?$_POST['s_show'] : null;
    $mid      = !empty($_POST['mid'])?$_POST['mid'] : null;
    $sid      = !empty($_POST['sid'])?$_POST['sid'] : null;
    $cid      = !empty($_POST['cid'])?$_POST['cid'] : null;
    $sdesc    = !empty($_POST['sdesc'])?$mysqli->real_escape_string($_POST['sdesc']) : null;

    if(!empty($_FILES["image"]['name'])){
        $imageName     = time().$_FILES["image"]['name'];
        $imageTempName = $_FILES["image"]['tmp_name'];
        $imageUpload = move_uploaded_file($imageTempName, $url.$imageName);
    }else{
        $imageName = null;
    }

    if(!empty($_FILES["video"]['name'])){
        $videoName     = time().$_FILES["video"]['name'];
        $videoTempName = $_FILES["video"]['tmp_name'];
        $videoUpload = move_uploaded_file($videoTempName, $url.$videoName);
    }else{
        $videoName = null;
    }
    
    $sql = "insert into tbl_partner_service(img, video, title, discount, ttken, mqty, price, status, s_show, mid, sid, cid, sdesc) values ('{$imageName}','{$videoName}','{$title}','{$discount}','{$ttken}','{$mqty}','{$price}','{$status}','{$s_show}','{$mid}','{$sid}','{$cid}','{$sdesc}')";

    $result = $mysqli->query($sql);

    if($result){
        $returnArr = array("status"=> "success", "message"=> "partner services is inserted successfully", "data"=> "");
    }else{
        $returnArr = array("status"=> "fail", "message"=> "partner services is not inserted", "data"=> "");
    }
    echo json_encode($returnArr);


?>