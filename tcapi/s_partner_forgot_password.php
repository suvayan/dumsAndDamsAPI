<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    require_once (dirname( dirname(__FILE__) ).'/vendor/autoload.php');
    require_once (dirname( dirname(__FILE__) ).'/tcapi/send_email.php');
    // Use the REST API Client to make requests to the Twilio REST API
    use Twilio\Rest\Client;

    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    
    $returnArr = array();
    $required  = array();

    function getOtp(){
        $otp = rand(100000, 999999);
        return $otp;
    }


    $email='';

    if(empty($_POST['email'])){
        array_push($required,"email");
    }else{
        $email=$_POST['email'];
    }


    if(count($required) > 0){
        $returnArr = array("status"=> "success", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $checkEmail = $mysqli->query("select * from partner where email='{$email}'")->num_rows;
        if($checkEmail != 0){
            $otp = getOtp();
            $sendOtp = sedOtpToEmail($otp, $email);
            if($sendOtp){
                $result = $mysqli->query("insert into temp_partner_forgot_passwor_otp_tbl (email,otp) values ('{$email}',{$otp})");
                if($result){
                    $rowId = $mysqli->insert_id;
                    $obj = (object)array("row_id"=>$rowId, "otp"=>$otp);
                    $returnArr = array("status"=> "success", "message"=> "OTP is send", "data"=> $obj);
                }else{
                    $returnArr = array("status"=> "success", "message"=> "OTP not store in temp_tbl", "data"=> "");
                }
            }else{
                $returnArr = array("status"=> "success", "message"=> "there is an issue occurs to send otp", "data"=> "");
            }
        }else{
            $returnArr = array("status"=> "success", "message"=> "this email is not exists", "data"=> "");
        }
    }

    echo json_encode($returnArr);

?>