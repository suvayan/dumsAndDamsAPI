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
    $banners  = array();

    $sql = "select b.*,c.cat_name,sc.title as sub_cat_name from banner b, category c, g_subcategory sc where b.cid=c.id and b.sid=sc.id";

    $result = $mysqli->query($sql);
    if($result->num_rows){
        while($row = $result->fetch_assoc()) {
            $banners[] = $row;
        }
        $returnArr = array("status"=> "success", "message"=> "get all search result", "data"=> $banners);
    }else{
            $returnArr = array("status"=> "success", "message"=> "this keyword not exist", "data"=> "");
    }

    echo json_encode($returnArr);
?>