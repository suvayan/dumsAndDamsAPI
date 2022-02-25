<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();
    $required  = array();
    $id = '';

    if(empty($_POST['id'])){
        array_push($required,"id");
    }else{
        $id=$_POST['id'];
    }

    $a_token = !empty($_POST['a_token'])?$_POST['a_token']:null;
    $i_token = !empty($_POST['i_token'])?$_POST['i_token']:null;

    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "fali", "message"=> "user id is required", "data"=> "");
    }else{
        $result = $mysqli->query("update tbl_user set a_token='{$a_token}', i_token='{$i_token}' where id={$id}");
        if($result){
            $returnArr = array("status"=> "success", "message"=> "tokens are added", "data"=> "");
        }else{
            $returnArr = array("status"=> "fali", "message"=> "tokens are not added", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>  