<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();
    $required = array();
    $pid=$name=$upi='';

    if(!empty($_POST['pid'])){
        $pid=$_POST['pid'];
    }else{
        array_push($required, 'pid');
    }

    if(!empty($_POST['name'])){
        $name=$_POST['name'];
    }else{
        array_push($required, 'name');
    }

    if(!empty($_POST['upi'])){
        $upi=$_POST['upi'];
    }else{
        array_push($required, 'upi');
    }


    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "faild", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sql = "insert into partner_upi_details (pid, name, upi) values ({$pid}, '{$name}', '{$upi}')";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "partner upi details add successfull", "data"=> '');
        }else{
            $returnArr = array("status"=> "fail", "message"=> "partner upi details add faild", "data"=> '');
        }
    }
    echo json_encode($returnArr);
?>