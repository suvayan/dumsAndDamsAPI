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
    if($id==''){
        $returnArr = array("status"=> "success", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sql = "delete from tbl_partner_service where id='$id'";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "partner service delete successfull", "data"=> '');
        }else{
            $returnArr = array("status"=> "success", "message"=> "partner service delete faild", "data"=> '');
        }
    }

    echo json_encode($returnArr);
?>