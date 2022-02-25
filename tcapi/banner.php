<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();
    $banners = array();
    $banner = $mysqli->query("select * from banner where status=1");
    $poli = array();
    while($row = $banner->fetch_assoc()){
	    $poli['id'] = $row['id'];
	    $poli['img'] = $row['img'];
        $poli['mid'] = $row['mid'];
        $poli['sid'] = $row['sid'];
        $poli['cid'] = $row['cid'];
	    $poli['status'] = $row['status'];
        $banners[] = $poli;
    }
    $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $banners);    
    echo json_encode($returnArr);
?>