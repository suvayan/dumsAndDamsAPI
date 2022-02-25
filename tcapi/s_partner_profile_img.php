<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    //$data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();
    $url = dirname( dirname(__FILE__) ).'/assets/user/';
    $id         = $_POST['id'];
    $image  = '';

    if(!empty($_FILES["image"]['name'])){
        $imageName     = time().$_FILES["image"]['name'];
        $imageTempName = $_FILES["image"]['tmp_name'];
        if(move_uploaded_file($imageTempName, $url.$imageName)){
            $image = 'assets/user/'.$imageName;
        }
    }

    if($id == ''){
        $returnArr = array("status"=> "success", "message"=> "partner id is required", "data"=> "");
    }else{
        $result = $mysqli->query("update partner set pimg='{$image}' where id='{$id}'");
        if($result){
            $sql2 = "select * from partner where id={$id}";
            $result2 = $mysqli->query($sql2)->fetch_assoc();
            if($result2){
                $pushNotification = new PartnerPushNotification($result2['a_token'], 'Image update', 'You have successfully updated your image', 'alert.mp3');
                $pushNotification->sendNotification();
            }
            $returnArr = array("status"=> "success", "message"=> "partner image is successfully update", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "partner image is not update", "data"=> "");
        }
    }


    echo json_encode($returnArr);
?>