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
    $required = array();
    $url = dirname( dirname(__FILE__) ).'/assets/certificate/';
    $pid=$image='';
    
    if(!empty($_POST['pid'])){
        $pid = $_POST['pid'];
    }else{
        array_push($required,'pid');
    }

    if(!empty($_FILES["image"]['name'])){
        $imageName     = time().$_FILES["image"]['name'];
        $imageTempName = $_FILES["image"]['tmp_name'];
        if(move_uploaded_file($imageTempName, $url.$imageName)){
            $image = 'assets/certificate/'.$imageName;
        }
    }else{
        array_push($required,'image');
    }
    //print_r($required);

    $id = !empty($_POST['id'])?$_POST['id'] : '';

    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "success", "message"=> "pid and image required", "data"=> "");
    }else{
        if(!empty($id)){
            $sql = "update tbl_partner_vaccination_certificate set vac_two='{$image}' where id={$id} and pid={$pid}";
        }else{
            $sql = "insert into tbl_partner_vaccination_certificate (pid, vac_one) values ({$pid}, '{$image}')";
        }
        //echo $sql;
       // exit;
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "covid vaccination dose  certificate is successfully inserted", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "covid vaccination dose  certificate is not inserted", "data"=> "");
        }
    }


    echo json_encode($returnArr);
?>