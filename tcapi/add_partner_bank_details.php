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
    $pid=$name=$ac_no=$b_name=$ifsc='';

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

    if(!empty($_POST['ac_no'])){
        $ac_no=$_POST['ac_no'];
    }else{
        array_push($required, 'ac_no');
    }

    if(!empty($_POST['b_name'])){
        $b_name=$_POST['b_name'];
    }else{
        array_push($required, 'b_name');
    }

    if(!empty($_POST['ifsc'])){
        $ifsc=$_POST['ifsc'];
    }else{
        array_push($required, 'ifsc');
    }

    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "faild", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sql = "insert into partner_bank_details (pid, name, ac_no, b_name, ifsc) values ({$pid}, '{$name}', '{$ac_no}', '{$b_name}', '{$ifsc}')";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "partner bank details add successfull", "data"=> '');
        }else{
            $returnArr = array("status"=> "fail", "message"=> "partner bank details add faild", "data"=> '');
        }
    }
    echo json_encode($returnArr);
?>