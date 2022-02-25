<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require_once (dirname( dirname(__FILE__) ).'/vendor/autoload.php');

function sedOtpToEmail($otp, $receiverEmail){
    $mail = new PHPMailer(true);

    try {
        //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      
        $mail->isSMTP();                                            
        $mail->Host       = 'smtp.hostinger.com';              
        $mail->SMTPAuth   = true;                                   
        $mail->Username   = 'service@dudeanddamsels.com';                     
        $mail->Password   = 'Farid@123';                               
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;           
        $mail->Port       = 465;                          
    
        $mail->setFrom('service@dudeanddamsels.com');
        $mail->addAddress($receiverEmail);     
        $mail->FromName = 'Verify OTP';
        $mail->isHTML(true);                               
        $mail->Subject = 'OTP to verify your email ';
        $mail->Body    = "Please, do not share your OTP : {$otp}";
    
        if($mail->send()){
            return true;
        }else{
            return false;
        }
    } catch (Exception $e) {
        //echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        return false;
    }
}
