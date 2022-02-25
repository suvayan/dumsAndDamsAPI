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
        $result      = $mysqli->query("select * from tbl_testimonial where id =".$id);
        if($result->num_rows){
            $data = $result->fetch_assoc();
            $returnArr = array("status"=> "success", "message"=> "get testimonial successfully", "data"=> $data);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "testimonial gets fail", "data"=> "");
        }
    }


    echo json_encode($returnArr);
?>