<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    //$data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();

    $testimonials = array();
    $testimonial  = $mysqli->query("select * from tbl_testimonial where status = 1");

    while($row = $testimonial->fetch_assoc()){
        $testimonials[] = $row;
    }
    
    $returnArr = array("status"=> "success", "message"=> "testimonial list", "data"=> $testimonials);

    echo json_encode($returnArr);
?>