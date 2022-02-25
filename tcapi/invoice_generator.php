<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    use Dompdf\Dompdf;
    use Dompdf\Options;
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\SMTP;
    use PHPMailer\PHPMailer\Exception;
    require_once (dirname( dirname(__FILE__) ).'/vendor/autoload.php');


    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();

    $oid = !empty($_POST['oid'])? $_POST['oid']: null;
    $uid = !empty($_POST['uid'])? $_POST['uid']: null;
    $pid = !empty($_POST['pid'])? $_POST['pid']: null;

    function getAutoInvoiceNo($mysqli){
        $number = mt_rand(10000000, 99999999);
        $invoiceNumber = $number;
        $query = $mysqli->query("select * from tbl_invoice where invoice_no='{$invoiceNumber}'");
        if($query->num_rows > 0){
            getAutoInvoiceNo($mysqli);
        }else{
            return $invoiceNumber;
        }
    }

    function getInvoice($url){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL,$url);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }
    
    function getUserEmail($mysqli, $uid){
        $result = $mysqli->query("select email from tbl_user where id={$uid}");
        if($result->num_rows > 0){
            $date = $result->fetch_assoc();
            return $date['email'];
        }
    }
    
    function sendInvoiceToEmail($to, $title, $oid, $file_name){
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
            $mail->addAddress($to);     
            $mail->FromName = $title;
            $mail->addAttachment("../assets/invoice/{$file_name}"); 
            $mail->isHTML(true);                               
            $mail->Subject = "Invoice";
            $mail->Body    = "Invoice of OrderId: {$oid}";
        
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

    function createPdf($url, $invoiceNumber, $file, $email, $oid){
        $options = new Options();
        $options->setIsRemoteEnabled(true);
        $dompdf = new Dompdf();
        $file_name  = "{$invoiceNumber}{$file}";
        $path       = '../assets/invoice/';
        $total_path = "{$path}{$file_name}";
        $myfile     = fopen($total_path, "w");
        fclose($myfile);
        $dompdf->setOptions($options);
        $html   = getInvoice($url);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();
        $output = $dompdf->output();
        //$dompdf->stream();
        if(file_put_contents($total_path, $output)){
            //echo "rtrtrtrt";
            if(sendInvoiceToEmail($email, $invoiceNumber, $oid, $file_name)){
                return $file_name;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    if(empty($oid) || empty($uid) || empty($pid)){
        $returnArr = array("status"=> "faild", "message"=> "required all mandetory fields");
    }else{
        $getmail = getUserEmail($mysqli, $uid);
        $invoiceNumber = getAutoInvoiceNo($mysqli);
        $reciptInvoice = createPdf("http://api.dudeanddamsels.com/tcapi/recipt_invoice.php?oid={$oid}&uid={$uid}&pid={$pid}&number={$invoiceNumber}", $invoiceNumber,"-recipt.pdf", $getmail, $oid);
        //echo $reciptInvoice;exit;
        $taxInvoice = createPdf("http://api.dudeanddamsels.com/tcapi/tax_invoice.php?oid={$oid}&uid={$uid}&pid={$pid}&number={$invoiceNumber}", $invoiceNumber,"-tax.pdf", $getmail, $oid);
        
        $reciptInvoicePath = "http://api.dudeanddamsels.com/assets/invoice/{$reciptInvoice}";
        $taxInvoicePath = "http://api.dudeanddamsels.com/assets/invoice/{$taxInvoice}";

        $query = "insert into tbl_invoice (uid, pid, oid, invoice_no, recipt_invoice, tax_invoice) values ({$uid},{$pid},{$oid},'{$invoiceNumber}','{$reciptInvoicePath}','{$taxInvoicePath}')";
        $result = $mysqli->query($query);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "invoice generate succesfully");
        }else{
            $returnArr = array("status"=> "faild", "message"=> "invoice is not generated");
        }
    }

    echo json_encode($returnArr);

   
?>