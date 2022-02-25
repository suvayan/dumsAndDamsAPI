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
    $subCategories = array();
    $subCategory = $mysqli->query("select * from g_subcategory where status=1");
    $poli = array();
    while($row = $subCategory->fetch_assoc()){
	    $poli['id'] = $row['id'];
	    $poli['cid'] = $row['cid'];
        $poli['title'] = $row['title'];
        $poli['img'] = $row['img'];
        $poli['video'] = $row['video'];
	    $poli['status'] = $row['status'];
        $subCategories[] = $poli;
    }
    $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $subCategories);    
    echo json_encode($returnArr);
?>