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

    $title       = $_POST['title'];
    $searchData  = array();

    if($title == ''){
        $returnArr = array("status"=> "success", "message"=> "please give a keyword", "data"=> "");
    }else{
        $sql = "select tc.*, c.cat_name, c.cat_subtitle, c.cat_img, c.cat_video, sc.title as sub_cat_title, sc.img as sub_cat_img, sc.video as sub_cat_video from tbl_child tc, category c, g_subcategory sc where tc.cid=c.id and tc.sid=sc.id and tc.title like '%{$title}%'";

        $result = $mysqli->query($sql);
        if($result->num_rows){
            while($row = $result->fetch_assoc()) {
                $searchData[] = $row;
            }
            $returnArr = array("status"=> "success", "message"=> "get all search result", "data"=> $searchData);
        }else{
            $returnArr = array("status"=> "success", "message"=> "this keyword not exist", "data"=> "");
        }
    }

    echo json_encode($returnArr);
?>