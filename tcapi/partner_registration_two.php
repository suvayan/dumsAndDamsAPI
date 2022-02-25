<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
  
    $returnArr = array();
    $required = array();
    $pid=$title=$image='';
    

    if(empty($_POST['pid'])){
        array_push($required,"pid");
    }else{
        $pid=$_POST['pid'];
    }

    if(empty($_POST['title'])){
        array_push($required,"title");
    }else{
        $title=$_POST['title'];
    }

    if(empty($_FILES["image"]['name'])){
        array_push($required,"img");
    }

    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "faild", "message"=> "pid, title, image is required");
    }else{
        $url = dirname( dirname(__FILE__) ).'/assets/partner/';
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://api.dudeanddamsels.com/tcapi/ss.php?pid={$pid}");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $responce = curl_exec($ch);
        $decodeResponce = json_decode($responce);

        $count = (int)$decodeResponce->data->count;
        
        if($decodeResponce->status === 'success'){
            $imageName     = time().$_FILES["image"]['name'];
            $imageTempName = $_FILES["image"]['tmp_name'];
            move_uploaded_file($imageTempName, $url.$imageName);
            $sql = "";
            if(empty($decodeResponce->data->{$title})){
                $increase =  (int)$count + 1;
                $sql = "update tbl_partner_cards set {$title}='{$imageName}', count={$increase} where pid='{$pid}'";
            }else{
                $sql = "update tbl_partner_cards set {$title}='{$imageName}' where pid='{$pid}'";
            }
            
            $result = $mysqli->query($sql);
            if($result){
                $returnArr = array("status"=> "success", "message"=> "{$title} is successfully updated");
            }else{
                $returnArr = array("status"=> "fail", "message"=> "{$title} is not updated");
            }
        }else{
            $imageName     = time().$_FILES["image"]['name'];
            $imageTempName = $_FILES["image"]['tmp_name'];
            move_uploaded_file($imageTempName, $url.$imageName);
            $increase =  (int)$count + 1;
            $result = $mysqli->query("INSERT INTO `tbl_partner_cards`(`pid`, `{$title}`, `count`) VALUES ({$pid}, '{$imageName}', {$increase})");
            if($result){
                $returnArr = array("status"=> "success", "message"=> "{$title} is successfully inserted");
            }else{
                $returnArr = array("status"=> "fail", "message"=> "{$title} is not inserted");
            }
        }

        echo json_encode($returnArr);
    }
        
?>