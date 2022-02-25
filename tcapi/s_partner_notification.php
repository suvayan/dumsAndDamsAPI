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

    $pid = $_POST['id'];

    if(empty($pid)){
        $returnArr = array("status"=> "fail", "message"=> "partner id is not found", "data"=> "");
    }else{
        $notifications = array();
        $notification = $mysqli->query("select * from tbl_partner_notification where pid ={$pid} order by id DESC");
        while($row = $notification->fetch_assoc()){
            $notifications[] = $row;
        }
        $returnArr = array("status"=> "success", "message"=> "partner notification", "data"=> $notifications);
    }
    echo json_encode($returnArr);
?>