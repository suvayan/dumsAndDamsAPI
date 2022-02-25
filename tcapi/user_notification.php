<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    require_once (dirname( dirname(__FILE__) ).'/tcapi/UserPushNotification.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();

    $id    = !empty($_POST['id'])?$_POST['id'] : null;
    $title = !empty($_POST['title'])?$_POST['title'] : null;
    $body  = !empty($_POST['body'])?$_POST['body'] : null;
    $date  = date('Y-m-d H:i:s');
    
    $sql = "insert into tbl_notification (uid, datetime, title, description) values ({$id}, '{$date}', '{$title}', '{$body}')";
    $result = $mysqli->query($sql);
    
    $sqlPush = "select 	* from tbl_user where id={$id}";
    $resultPush = $mysqli->query($sqlPush)->fetch_assoc();
    

    if(empty($resultPush['a_token']) && empty($resultPush['i_token'])){

    }else{
        if(!empty($resultPush['a_token']) && empty($resultPush['i_token'])){
            $pushNotification = new UserPushNotification($resultPush['a_token'], $title, $body, 'alert.mp3');
            $pushNotification->sendNotification();
        }elseif(empty($resultPush['a_token']) && !empty($resultPush['i_token'])){
            $pushNotification = new UserPushNotification($resultPush['i_token'], $title, $body, 'alert.mp3');
            $pushNotification->sendNotification();
        }else{
            $pushNotificationAndroid = new UserPushNotification($resultPush['a_token'], $title, $body, 'alert.mp3');
            $pushNotificationAndroid->sendNotification();
            $pushNotification = new UserPushNotification($resultPush['i_token'], $title, $body, 'alert.mp3');
            $pushNotification->sendNotification();
        }
    }
    
?>