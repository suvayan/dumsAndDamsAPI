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
    $categories = array();
    $category = $mysqli->query("select * from category where cat_status=1");
    //print_r($category);
    $poli = array();
    while($row = $category->fetch_assoc()){
	    $poli['id'] = $row['id'];
	    $poli['cat_subtitle'] = $row['cat_subtitle'];
        $poli['cat_name'] = $row['cat_name'];
        $poli['cat_status'] = $row['cat_status'];
        $poli['cat_img'] = $row['cat_img'];
	    $poli['cat_video'] = $row['cat_video'];
        $categories[] = $poli;
    }
    $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $categories);    
    echo json_encode($returnArr);
?>