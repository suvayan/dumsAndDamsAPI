<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $uid = $data['uid'];
    $returnArr = array();

    if($uid == ''){
	    $returnArr = array("status"=> "fail", "message"=> "user id required", "data"=> "Something Went wrong  try again !");
    }else{
        $offers = array();
        $offer = $mysqli->query("select * from tbl_offer where status=1");
        //print_r($offer);
        $poli = array();
        while($row = $offer->fetch_assoc()){
            $poli['id'] = $row['id'];
            $poli['cid'] = $row['cid'];
            $poli['name'] = $row['name'];
            $poli['img'] = $row['img'];
            $poli['video'] = $row['video'];
            $poli['description'] = $row['description'];
            $poli['status'] = $row['status'];
            $offers[] = $poli;
        }
        $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $offers);
    }

    echo json_encode($returnArr);
?>