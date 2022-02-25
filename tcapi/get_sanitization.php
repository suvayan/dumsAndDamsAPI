<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $returnArr = array();
    $sanitization = array();
    $sql = "select * from tbl_sanitization";
    $query = $mysqli->query($sql);
    while ($row = $query->fetch_assoc()){
        $sanitization[] = $row;
    }
    $returnArr = array("status"=> "success", "message"=> "sanitization data", "data"=> $sanitization);
    echo json_encode($returnArr);
?>