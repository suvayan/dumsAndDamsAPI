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
    $cid = $_POST['cid'];
    if($cid == ''){
	    $returnArr = array("status"=> "fail", "message"=> "cid id required", "data"=> "Something Went wrong  try again !");
    }else{
        $addonss = array();
        $addon= $mysqli->query("select * from tbl_addon where status=1 and cid=".$cid);
        while($row = $addon->fetch_assoc()){
            $addonss[] = $row;
        }
        $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $addonss);
    }
    echo json_encode($returnArr);
?>