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

    $oid=$uid=$rating='';

    if(!empty($_POST['oid'])){
        $oid = $_POST['oid'];
    }else{
        array_push($required, 'oid');
    }

    if(!empty($_POST['uid'])){
        $uid = $_POST['uid'];
    }else{
        array_push($required, 'uid');
    }

    if(!empty($_POST['rating'])){
        $rating = (double)$_POST['rating'];
    }else{
        array_push($required, 'rating');
    }

    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "fail", "message"=> "oid, uid, rating is required", "data"=> "");
    }else{
        $sqlOne = "update tbl_order set rating={$rating} where id={$oid} and uid={$uid}";
        $queryOne = $mysqli->query($sqlOne);
        if($queryOne){
            $sqlTwo = "update tbl_sub_order set rating={$rating} where id in (select id from tbl_order where oid={$oid} and uid={$uid})";
            $queryTwo = $mysqli->query($sqlTwo);
            if($queryTwo){
                $returnArr = array("status"=> "success", "message"=> "given ratting is successfull", "data"=> "");
            }else{
                $returnArr = array("status"=> "fail", "message"=> "given ratting is faild", "data"=> "");
            }
        }else{
            $returnArr = array("status"=> "fail", "message"=> "given ratting is faild", "data"=> "");
        }
    }


    
    echo json_encode($returnArr);
?>