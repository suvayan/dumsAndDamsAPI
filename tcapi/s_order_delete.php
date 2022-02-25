<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $oid = $_POST['oid'];
    $returnArr = array();

    if($oid == ''){
	    $returnArr = array("status"=> "fail", "message"=> "order id required", "data"=> "Something Went wrong  try again !");
    }else{
        
        $result = $mysqli->query("delete from tbl_order where id=".$oid);

        if($result){
            $returnArr = array("status"=> "success", "message"=> "order is successfully deleted", "data"=> []);
        }else{
            $returnArr = array("status"=> "success", "message"=> "faild to perform order delete operation", "data"=> []);
        }
    }

    echo json_encode($returnArr);
?>