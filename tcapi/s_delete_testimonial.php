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
        $sql = "delete from tbl_testimonial  where id = '$id'";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "testimonial deleted successfully", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "testimonial gets fail to delet", "data"=> "");
        }
    }


    echo json_encode($returnArr);
?>