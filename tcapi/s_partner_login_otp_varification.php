<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    
    $rid      = $_POST['row_id'];
    $otp      = $_POST['otp'];
    $rdate    = date('Y-m-d H:i:s');
    $lats     = $_POST['lats'];
    $longs    = $_POST['longs'];
    $returnArr = array();
    
    function getReferalCode($mysqli){
        $refCode = rand(100000, 999999);
        $isPrsent = $mysqli->query("select * from tbl_user where refercode=".$refCode)->num_rows;
        if($isPrsent!=0){
            getReferalCode();
        }else{
            return $refCode;
        }
    }

    function deleteTempRow($mysqli, $rid, $otp){
        $sql = "delete from temp_partner_login_otp where id='{$rid}' and otp='{$otp}'";
        $result = $mysqli->query($sql);
        return $result;
    }

    if($rid == '' || $otp == '' || $rdate == '' || $lats == '' || $longs == ''){
        $returnArr = array("status"=> "fali", "message"=> "rid, otp, rdate, lats, longs are required", "data"=> "");
    }else{
        $queryOne = "select * from temp_partner_login_otp where id='{$rid}' and otp='{$otp}'";
        $resultOne = $mysqli->query($queryOne);


        if($resultOne->num_rows){
            $row = $resultOne->fetch_assoc();
            $phone = $row['phone'];
            $queryTwo = "select id from partner where mobile='{$phone}'";
            $resultTwo = $mysqli->query($queryTwo);
            $tempRowDelete = deleteTempRow($mysqli, $rid, $otp);
            if($resultTwo->num_rows){
                $obj = $resultTwo->fetch_assoc();
                $returnArr = array("status"=> "success", "message"=> "your login successfull", "data"=> $obj);
            }else{
                $refercode = getReferalCode($mysqli);
                $queryThree = "insert into partner(mobile,ccode,rdate,lats,longs, refercode) values ('{$phone}','+91','{$rdate}','{$lats}','{$longs}', {$refercode})";
                $resultThree = $mysqli->query($queryThree);
                if($resultThree){
                    $obj = (object)array("id" => $mysqli->insert_id);
                    $returnArr = array("status"=> "success", "message"=> "your login successfull", "data"=> $obj);
                }else{
                    $returnArr = array("status"=> "fali", "message"=> "your login failed", "data"=> "");
                }
            }

        }else{
            $returnArr = array("status"=> "fali", "message"=> "OTP not matched", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>