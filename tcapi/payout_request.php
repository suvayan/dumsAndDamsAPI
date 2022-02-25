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
    $pid=$amt='';
    $date = date('Y-m-d H:i:s');

    //$bankDetails = '{"bname":"sbi","ifsc":"SBI0000178","pname":"Arijit Das","acno":"1234567890568"}';

    $bankDetails = !empty($_POST['bankDetails']) ? $_POST['bankDetails'] : null;
    $upi         = !empty($_POST['upi']) ? $_POST['upi'] : null;

    // $b_details = json_decode($bankDetails);
    // $bname = $b_details->bname;
    // $ifsc = $b_details->ifsc;
    // $pname = $b_details->pname;
    // $acno = $b_details->acno;
    // print_r(json_decode($bankDetails));
    // exit;

    if(!empty($_POST['pid'])){
        $pid=$_POST['pid'];
    }else{
        array_push($required, 'pid');
    }

    if(!empty($_POST['amt'])){
        $amt=(double)$_POST['amt'];
    }else{
        array_push($required, 'amt');
    }


    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "faild", "message"=> "pid, amt mandetory fields", "data"=> "");
    }else{
        if(!empty($bankDetails) && empty($upi)){
            $b_details = json_decode($bankDetails);
            $bname = $b_details->bname;
            $ifsc = $b_details->ifsc;
            $pname = $b_details->pname;
            $acno = $b_details->acno;
            $sql = "insert into payout_setting (pid, amt, date, bname, ifsc, pname, acno) values ({$pid}, {$amt}, '{$date}', '{$bname}', '{$ifsc}', '{$pname}', '{$acno}')";
            $result = $mysqli->query($sql);
            if($result){
                $returnArr = array("status"=> "success", "message"=> "pay out request is successfull", "data"=> '');
            }else{
                $returnArr = array("status"=> "fail", "message"=> "pay out request is faild", "data"=> '');
            }
        }elseif(empty($bankDetails) && !empty($upi)){
            $sql = "insert into payout_setting (pid, amt, date, upi) values ({$pid}, {$amt}, '{$date}', '{$upi}')";
            $result = $mysqli->query($sql);
            if($result){
                $returnArr = array("status"=> "success", "message"=> "pay out request is successfull", "data"=> '');
            }else{
                $returnArr = array("status"=> "fail", "message"=> "pay out request is faild", "data"=> '');
            }
        }else{
            $returnArr = array("status"=> "faild", "message"=> "bank details or upi is required", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>