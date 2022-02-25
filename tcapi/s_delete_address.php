<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), false);
    $returnArr = array();
    $id = !empty($_POST['id']) ? $_POST['id'] : null;

    if(empty($id)){
        $returnArr = array("status"=> "fail", "message"=> "id is required");
    }else{
        $sql   = "delete from tbl_prtner_address where id={$id}";
        $query = $mysqli->query($sql);
        if($query){
            $returnArr = array("status"=> "success", "message"=> "Success");  
        }else{
            $returnArr = array("status"=> "fail", "message"=> "Faild");  
        }
    }
    echo json_encode($returnArr);
?>