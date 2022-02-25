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
    $returnArr = array();
    $id       = $_POST['uid'];

    if($id == ''){
        $returnArr = array("status"=> "success", "message"=> "user id is required", "data"=> "");
    }else{
        $orders = array();
        $order = $mysqli->query("select o.*, ch.total_price as checkout_total_price, ch.itemdetails from tbl_order o, tbl_checkout ch where o.checkout_id=ch.id and o.uid={$id} and ch.uid={$id}");

        while($row = $order->fetch_assoc()){
            $orders[] = array(
                "id" => $row['id'], 
                "checkout_id" => $row['checkout_id'], 
                "uid" => $row['uid'], 
                "cid" => $row['cid'], 
                "odate" => $row['odate'], 
                "otime" => $row['otime'], 
                "p_method_id" => $row['p_method_id'], 
                "address" => $row['address'], 
                "o_total" => $row['o_total'], 
                "o_tax" => $row['o_tax'], 
                "subtotal" => $row['subtotal'], 
                "trans_id" => $row['trans_id'], 
                "o_status" => $row['o_status'], 
                "a_status" => $row['a_status'], 
                "comment_reject" => $row['comment_reject'], 
                "add_on" => $row['add_on'],
                "add_per_price" => $row['add_per_price'], 
                "add_total" => $row['add_total'], 
                "lats" => $row['lats'], 
                "longs" => $row['longs'], 
                "checkout_total_price" => $row['checkout_total_price'],
                "itemdetails" => json_decode($row['itemdetails'])
            );
        }
        $returnArr = array("status"=> "success", "message"=> "user order list get successfully", "data"=> $orders);
    }
    
    echo json_encode($returnArr);
?>