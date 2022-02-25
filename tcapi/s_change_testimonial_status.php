<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();
    $id           = $_POST['id'];
    if($id == ''){
        $returnArr = array("status"=> "success", "message"=> "id is required", "data"=> "");
    }else{
        $getData      = $mysqli->query("select status from tbl_testimonial where id =".$id)->fetch_assoc();
        $status       = ($getData['status'] == 1)? 0 : 1;

        $sql = "update tbl_testimonial set status = '$status ' where id = '$id'";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "testimonial status change successfully", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "testimonial gets fail to change status", "data"=> "");
        }
    }


    echo json_encode($returnArr);
?>