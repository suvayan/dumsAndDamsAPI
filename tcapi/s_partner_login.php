<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    require_once (dirname( dirname(__FILE__) ).'/tcapi/PartnerPushNotification.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();

    $required = array();
    $email=$password='';

    if(empty($_POST['email'])){
        array_push($required,"email");
    }else{
        $email=$_POST['email'];
    }

    if(empty($_POST['password'])){
        array_push($required,"password");
    }else{
        $password=md5($_POST['password']);
    }

    if(empty($email) && empty($password)){
        $returnArr = array("status"=> "fail", "message"=> "email and password are required", "data"=> "");
    }elseif(!empty($email) && empty($password)){
        $returnArr = array("status"=> "fail", "message"=> "password is required", "data"=> "");
    }elseif(empty($email) && !empty($password)){
        $returnArr = array("status"=> "fail", "message"=> "email is required", "data"=> "");
    }else{
        $sql = "select * from partner where email='{$email}' and password='{$password}'";
        $result = $mysqli->query($sql)->fetch_assoc();
        if(!empty($result)){
            // $pushNotification = new PartnerPushNotification();
            // $pushNotification.$token = $result['a_token'];
            // $pushNotification.$title = 'Login Successful';
            // $pushNotification.$body = 'You have logged in successfully';
            // $pushNotification.$sound = 'alert.mp3';
            
            $pushNotification = new PartnerPushNotification($result['a_token'], 'Login Successful', 'You have logged in successfully', 'alert.mp3');
            $pushNotification->sendNotification();
            $returnArr = array("status"=> "success", "message"=> "your login successfull", "data"=> $result);
        }else{
            $returnArr = array("status"=> "fali", "message"=> "your login failed", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>