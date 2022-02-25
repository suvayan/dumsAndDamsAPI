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
    $pid = $_POST['id'];

    if(empty($pid)){
        $returnArr = array("status"=> "fail", "message"=> "partner id is not found", "data"=> "");
    }else{
        $result = $mysqli->query("select a.*, b.name as user_name, b.email as user_email, c.cat_name as category from tbl_order a, tbl_user b, category c where a.uid = b.id and a.cid = c.id and a.o_status='Pending' and a.a_status=0 and a.rid =".$pid)->fetch_assoc();
        if(!empty($result)){
            $returnArr = array("status"=> "success", "message"=> "partner order details", "data"=> $result);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "server error", "data"=> "");
        }
    }
    echo json_encode($returnArr);
?>