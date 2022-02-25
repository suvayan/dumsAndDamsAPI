<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
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

    $name      = trim($_POST['name']);
    $email     = trim($_POST['email']);
    $mobile    = trim($_POST['mobile']);
    $password  = md5(trim($_POST['password']));
    $ccode     = !empty($_POST['ccode']) ? trim($_POST['ccode']) : '';
    $code      = !empty($_POST['code']) ? trim($_POST['code']) : '';
    $refercode = getReferalCode($mysqli);
    $rdate     = date('Y-m-d H:i:s');

    if($name=='' || $email=='' || $mobile=='' || $password==''){
        $returnArr = array("status"=> "success", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $checkEmail = $mysqli->query("select * from tbl_user where email='{$email}'")->num_rows;
        $checkMobile = $mysqli->query("select * from tbl_user where mobile='{$mobile}'")->num_rows;
        if($checkEmail!= 0){
            $returnArr = array("status"=> "fail", "message"=> "This email is already exists", "data"=> ""); 
        }elseif($checkMobile!=0){
            $returnArr = array("status"=> "fail", "message"=> "This phone number is already exists", "data"=> ""); 
        }else{
            $query = "insert into tbl_user(name,email,mobile,password,ccode,code,refercode,rdate) values ('{$name}','{$email}','{$mobile}','{$password}','{$ccode}','{$code}','{$refercode}','{$rdate}')";
            $result = $mysqli->query($query);
            if($result){
                $obj = (object)array("id" => $mysqli->insert_id);
                $returnArr = array("status"=> "success", "message"=> "your registration is successfull", "data"=> $obj);
            }else{
                $returnArr = array("status"=> "fail", "message"=> "your registration has been failed", "data"=> "");
            }
        }
    }
    echo json_encode($returnArr);

?>

