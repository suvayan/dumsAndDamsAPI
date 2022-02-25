<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $id = $_POST['id'];
    $oldPassword = $_POST['oldPassword'];
    $newPassword = $_POST['newPassword'];
    $returnArr = array();

    if($id == '' || $newPassword == '' || $oldPassword == ''){
        $returnArr = array("status"=> "fali", "message"=> "id, old password, new password are required", "data"=> "");
    }else{
        $oldPass = md5($oldPassword);
        $newPass = md5($newPassword);
        $sqlOne = "select * from tbl_user where id={$id} and password='{$oldPass}'";
        $resultOne = $mysqli->query($sqlOne);
        if($resultOne->num_rows){
            $queryTwo = "update tbl_user set password='{$newPass}' where id={$id}";
            $resultTwo = $mysqli->query($queryTwo);
            if($resultTwo){
                $returnArr = array("status"=> "success", "message"=> "password is updated successfully", "data"=> "");
            }else{
                $returnArr = array("status"=> "fali", "message"=> "password is not updated", "data"=> "");
            }
        }else{
            $returnArr = array("status"=> "fali", "message"=> "old password not matched", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>