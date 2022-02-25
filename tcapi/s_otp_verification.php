<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $rid = $_POST['row_id'];
    $otp = $_POST['otp'];
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
        $sql = "delete from temp_tbl where id='{$rid}' and otp='{$otp}'";
        $result = $mysqli->query($sql);
        return $result;
    }

    $queryOne = "select * from temp_tbl where id='{$rid}' and otp='{$otp}'";
    $resultOne = $mysqli->query($queryOne);

    if($resultOne->num_rows){
        $row = $resultOne->fetch_assoc();
        $phone = $row['phone'];
        $queryTwo = "select id from tbl_user where mobile='{$phone}'";
        $resultTwo = $mysqli->query($queryTwo);
        $tempRowDelete = deleteTempRow($mysqli, $rid, $otp);
        if($resultTwo->num_rows){
            $obj = $resultTwo->fetch_assoc();
            $returnArr = array("status"=> "success", "message"=> "your login successfull", "data"=> $obj);
        }else{
            $referalCode = getReferalCode($mysqli);
            $rdate       = date('Y-m-d H:i:s');
            $queryThree = "insert into tbl_user(mobile,ccode,status,refercode,rdate) values ('{$phone}','+91',1,'{$referalCode}','{$rdate}')";
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

    echo json_encode($returnArr);
?>