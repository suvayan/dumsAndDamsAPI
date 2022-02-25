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

    //$checkout = '{"uid":"13","total":"600","itemdetails":[{"id":"1","cid":"1","sid":"1","title":"Facial","description":"facial for women","price":"200","status":"1","count":2},{"id":"2","cid":"1","sid":"1","title":"Makeup","description":"nude makeup","price":"400","status":"1","count":1}]}';
    
    $checkout = $_POST['checkout'];
    if($checkout == ''){
        $returnArr = array("status"=> "success", "message"=> "There is no checkout data", "data"=> "");
    }else{
        $breakCheckout = json_decode($checkout);
        $uid = $breakCheckout->uid;
        $total = $breakCheckout->total;
        $itemdetails = json_encode($breakCheckout->itemdetails);
        if($uid == '' && $total == '' && $itemdetails == ''){
            $returnArr = array("status"=> "success", "message"=> "uid, total, itemdetails all are required", "data"=> "");
        }else{
            $items = $mysqli->real_escape_string($itemdetails);
            
            $sql = "insert into tbl_checkout (uid, total_price, itemdetails) values ({$uid}, {$total}, '{$items}')";
            $result = $mysqli->query($sql);

            if($result){
                $data   = (object)array('checkout_id' => $mysqli->insert_id);
                $returnArr = array("status"=> "success", "message"=> "successfully data are added into checkout table", "data"=> $data);
            }else{
                $returnArr = array("status"=> "success", "message"=> "data are not added", "data"=> "");
            }
        }
    }
    echo json_encode($returnArr);
?>