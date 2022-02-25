<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    
    
    $rid=$otp=$password = '';
    $returnArr = array();
    $required  = array();


    function deleteTempRow($mysqli, $rid, $otp){
        $sql = "delete from temp_forgot_passwor_otp_tbl where id='{$rid}' and otp='{$otp}'";
        $result = $mysqli->query($sql);
        return $result;
    }

    if(empty($_POST['row_id'])){
        array_push($required,"rid");
    }else{
        $rid = $_POST['row_id'];
    }

    if(empty($_POST['otp'])){
        array_push($required,"otp");
    }else{
        $otp   = $_POST['otp'];
    }

    if(empty($_POST['password'])){
        array_push($required,"password");
    }else{
        $password = md5($_POST['password']);
    }
    //print_r($required);
    if(count($required) > 0){
        $returnArr = array("status"=> "success", "message"=> "required all mandetory fields", "data"=> "");
    }else{

        $queryOne = "select * from temp_forgot_passwor_otp_tbl where id='{$rid}' and otp='{$otp}'";
        $resultOne = $mysqli->query($queryOne);
        $tempRowDelete = deleteTempRow($mysqli, $rid, $otp);
        if($resultOne->num_rows && $tempRowDelete){
            $row      = $resultOne->fetch_assoc();
            $email    = $row['email'];
            $setNewPassword = $mysqli->query("update tbl_user set password='{$password}' where email='{$email}'");
            if($setNewPassword){
                $returnArr = array("status"=> "success", "message"=> "password change successfully", "data"=> "");
            }else{
                $returnArr = array("status"=> "fali", "message"=> "password not changed", "data"=> "");
            }
        }else{
            $returnArr = array("status"=> "fali", "message"=> "OTP not matched", "data"=> "");
        }
    }
        echo json_encode($returnArr);
?>