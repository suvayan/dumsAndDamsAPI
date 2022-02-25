<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    require_once (dirname( dirname(__FILE__) ).'/vendor/autoload.php');
    // Use the REST API Client to make requests to the Twilio REST API
    use Twilio\Rest\Client;

    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $phone = $_POST['phone'];

    $returnArr = array();

    function getOtp(){
        $otp = rand(100000, 999999);
        return $otp;
    }

    function sendOtp($otp, $phone){
        // $sid = 'ACca0746aac5997b94cf5a6ccb76de06d7';
        // $token = '1490a6e31223ef8e00537a278c457ebb';
        $sid = 'ACca0746aac5997b94cf5a6ccb76de06d7';
        $token = '1490a6e31223ef8e00537a278c457ebb';
        $client = new Client($sid, $token);
        $sendOTP = $client->messages->create(
            "+91".$phone,
            array(  
                "messagingServiceSid" => "MG7f57ac27f2d011a2be0028896b3d0b10",      
                "body" => "Your OTP is ".$otp 
            ) 
        ); 
        return $sendOTP;
    }

    if(!empty($phone)){
        $otp = getOtp();
        $optSend = sendOtp($otp, $phone);
        if(!empty($optSend)){
            $sql = "insert into temp_partner_login_otp (phone, otp) values ('{$phone}', '{$otp}')";
            $result = $mysqli->query($sql);
            if($result){
                $obj = (object)array("row_id" => $mysqli->insert_id, "otp" => $otp);
                $returnArr = array("status"=> "success", "message"=> "OTP successfully sent", "data"=> $obj);
            }else{
                $returnArr = array("status"=> "fail", "message"=> "otp not send", "data"=> "");
            }
        }else{
            $returnArr = array("status"=> "fail", "message"=> "otp not send", "data"=> "");
        }
    }else{
        $returnArr = array("status"=> "fail", "message"=> "phone number is required", "data"=> "");
    }
    echo json_encode($returnArr)

?>