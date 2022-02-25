<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    require_once (dirname( dirname(__FILE__) ).'/tcapi/PartnerPushNotification.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();
    $pid     = $_POST['id'];
    $status  = $_POST['status'];
    $ammount = (double)$_POST['amt'];
    $message = !empty($_POST['msg'])?$_POST['msg'] : null;
    $transaction_id = !empty($_POST['transaction_id'])?$_POST['transaction_id']:null;
    $date    = date('Y-m-d');
    $month   = date('m');
    $year    = date('Y');
    $time    = date('H:i:s');
    

    if($pid == '' && $status == '' && $ammount == '' && $transaction_id == ''){
        $returnArr = array("status"=> "success", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sqlOne    = "select wallet from partner where id='{$pid}'";
        $resultOne = $mysqli->query($sqlOne)->fetch_assoc();
        $userAmmount   = (double)$resultOne['wallet'];
        if(strtolower($status) == 'credit'){
            $finalAmmont = $userAmmount  + $ammount;
            $queryOne = $mysqli->query("insert into partner_wallet_report(pid,message,status,amt,date,transaction_id, month, year, time) values ('{$pid}','{$message}','{$status}','{$ammount}','{$date}','{$transaction_id}','{$month}','{$year}','{$time}')");
            $queryTwo = $mysqli->query("update partner set wallet='{$finalAmmont}' where id='{$pid}'");
            if($queryOne && $queryTwo){
                $returnArr = array("status"=> "success", "message"=> "successfully credit in wallet", "data"=> "current wallet balance '{$finalAmmont}'");
            }else{
                $returnArr = array("status"=> "success", "message"=> "proccess gets failed", "data"=> "");
            }
        }else{
            if($userAmmount > $ammount){
                $finalAmmont = $userAmmount  - $ammount;
                $queryOne = $mysqli->query("insert into partner_wallet_report(pid,message,status,amt,date,transaction_id) values ('{$pid}','{$message}','{$status}','{$ammount}','{$date}','{$transaction_id}')");
                $queryTwo = $mysqli->query("update partner set wallet='{$finalAmmont}' where id='{$pid}'");
                if($queryOne && $queryTwo){
                    $returnArr = array("status"=> "success", "message"=> "successfully debited from your wallet", "data"=> "current wallet balance '{$finalAmmont}'");
                }else{
                    $returnArr = array("status"=> "success", "message"=> "proccess gets failed", "data"=> "");
                }
            }else{
                $finalAmmont = $userAmmount;
                $returnArr = array("status"=> "success", "message"=> "insufficient balance", "data"=> "current wallet balance '{$finalAmmont}'");
            }
        }
    }
    echo json_encode($returnArr);
?>