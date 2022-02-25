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

    $required = array();
    $name=$email=$mobile=$password=$category=$lats=$longs='';
    
    function getReferalCode($mysqli){
        $refCode = rand(100000, 999999);
        $isPrsent = $mysqli->query("select * from partner where refercode=".$refCode)->num_rows;
        if($isPrsent!=0){
            getReferalCode();
        }else{
            return $refCode;
        }
    }

    if(empty($_POST['name'])){
        array_push($required,"name");
    }else{
        $name=$_POST['name'];
    }

    if(empty($_POST['email'])){
        array_push($required,"email");
    }else{
        $email=$_POST['email'];
    }

    if(empty($_POST['password'])){
        array_push($required,"password");
    }else{
        $password=md5($_POST['password']);
    }

    if(empty($_POST['mobile'])){
        array_push($required,"mobile");
    }else{
        $mobile=$_POST['mobile'];
    }

    if(empty($_POST['category_id'])){
        array_push($required,"category");
    }else{
        $category=$_POST['category_id'];
    }

    if(empty($_POST['lats'])){
        array_push($required,"category");
    }else{
        $lats=$_POST['lats'];
    }

    if(empty($_POST['longs'])){
        array_push($required,"longs");
    }else{
        $longs=$_POST['longs'];
    }

    $rdate = date("Y-m-d H:i:s");
    $ccode=!empty($_POST['ccode'])?$_POST['ccode']:null;
    $bio=!empty($_POST['bio'])?$_POST['bio']:null;
    $city=!empty($_POST['city'])?$_POST['city']:null;
    $address=!empty($_POST['address'])?$_POST['address']:null;
    $pimg=!empty($_POST['pimg'])?$_POST['pimg']:" ";
    $code=!empty($_POST['code'])?$_POST['code']:null;
   if(count($required) > 0){
        $returnArr = array("status"=> "fail", "message"=> "please, fill in the required fields", "data"=> "");
   }else{

        $checkEmail = $mysqli->query("select * from partner where email='{$email}'")->num_rows;
        if($checkEmail == 0){
            $refercode = getReferalCode($mysqli);
            
            $query = "insert into partner(name, email, mobile, password, ccode, category_id, status, rdate, city, address, bio, lats, longs, pimg, code, refercode) values ('{$name}','{$email}','{$mobile}','{$password}','{$ccode}','{$category}', '1', '{$rdate}', '{$city}','{$address}','{$bio}','{$lats}','{$longs}', '{$pimg}', {$code}, {$refercode})";
            $result = $mysqli->query($query);
            if($result){
                $obj = (object)array("partner_id" => $mysqli->insert_id);
                $returnArr = array("status"=> "success", "message"=> "your registration is successfull", "data"=> $obj);
            }else{
                $returnArr = array("status"=> "fail", "message"=> "your registration has been failed", "data"=> "");
            }
        }else{
            $returnArr = array("status"=> "fail", "message"=> "This email is already exists", "data"=> "");
        }
   }

    echo json_encode($returnArr);
?>