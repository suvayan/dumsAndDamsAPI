<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\SMTP;
    use PHPMailer\PHPMailer\Exception;
    require_once (dirname( dirname(__FILE__) ).'/vendor/autoload.php');

    $returnArr = array();

    $email    = !empty($_POST['email'])? $_POST['email'] : null;
    $title    = !empty($_POST['title'])? $_POST['title'] : null;
    $subject  = !empty($_POST['subject'])? $_POST['subject'] : null;
    $body     = !empty($_POST['body'])? $_POST['body'] : null;

    if(empty($email) || empty($subject) || empty($body) || empty($title)){
        $returnArr = array('status'=>'success','message'=>'email, title, subject and body is require');
    }else{
        // $mail = new PHPMailer(true);
        // try {
        //     //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      
        //     $mail->isSMTP();                                            
        //     $mail->Host       = 'smtp.hostinger.com';              
        //     $mail->SMTPAuth   = true;                                   
        //     $mail->Username   = 'service@dudeanddamsels.com';                     
        //     $mail->Password   = 'Farid@123';                               
        //     $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;           
        //     $mail->Port       = 465;                          
        
        //     $mail->setFrom('service@dudeanddamsels.com');
        //     $mail->addAddress('service@dudeanddamsels.com');     
        //     $mail->FromName = $email;
        //     $mail->isHTML(true);                               
        //     $mail->Subject = $title;
        //     $mail->Body    = $body;
        
        //     if($mail->send()){
        //         $returnArr = array('status'=>'success','message'=>'successfully email send');
        //     }else{
        //         $returnArr = array('status'=>'fail','message'=>'email sending failed');
        //     }
        // } catch (Exception $e) {
        //     $returnArr = array('status'=>'fail','message'=>'email sending failed');
        // }
        $to = "service@dudeanddamsels.com";
        $header = "FROM: {$email}";
        $message = $body;
        $subject = $subject;

        if(mail($to,$subject,$message,$header)) {
            $returnArr = array('status'=>'success','message'=>'successfully email send');
        }else{
            $returnArr = array('status'=>'fail','message'=>'email sending failed');
        }
    }

    echo json_encode($returnArr);
?>