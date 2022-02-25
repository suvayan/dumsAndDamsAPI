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

    $uid = $data['uid'];
    $cid = $data['cid'];
    $rid = $data['rid'];
    $odate = date('Y-m-d');
    $p_method_id = $data['p_method_id'];
    $o_total = $data['o_total'];
    $subtotal = $data['subtotal'];

    $address = !empty($data['address'])?$data['address'] : null;
    $trans_id = !empty($data['trans_id'])?$data['trans_id'] : null;
    $o_status = !empty($data['o_status'])?$data['o_status'] : 'Pending';
    $a_status = !empty($data['a_status'])?$data['a_status']: 0;
    $comment_reject = !empty($data['comment_reject'])?$data['comment_reject']: null;
    $add_on = !empty($data['add_on'])?$data['add_on'] : null;
    $add_per_price = !empty($data['add_per_price'])?$data['add_per_price'] : null;
    $add_total = !empty($data['add_total'])?$data['add_total'] : null;
    $time      = !empty($data['time'])?$data['time'] : null;
    $date = !empty($data['date'])?$data['date'] : null;
    $r_credit = !empty($data['r_credit'])?$data['r_credit'] : null;
    $lats = !empty($data['lats'])?$data['lats'] : null;
    $longs = !empty($data['longs'])?$data['longs'] : null;
    $wal_amt = !empty($data['wal_amt'])?$data['wal_amt'] : null;
    $pcommission = !empty($data['pcommission'])?$data['pcommission'] : null;
    $htype = !empty($data['htype'])?$data['htype'] : null;

    if($uid == '' || $cid == '' || $rid == '' || $odate == '' || $p_method_id == '' || $o_total == '' || $subtotal == ''){
        $returnArr = array("status"=> "fail", "message"=> "user id required", "data"=> "Something Went wrong  try again !");
    }else{
        $query = "insert into tbl_order(uid, cid, odate, p_method_id, address, o_total, subtotal, trans_id, o_status, a_status, rid, comment_reject, add_on, add_per_price, add_total, time, date, r_credit, lats, longs, wal_amt, pcommission, htype) values ('{$uid}', '{$cid}', '{$odate}', '{$p_method_id}', '{$address}', '{$o_total}', '{$subtotal}', '{$trans_id}', '{$o_status}', '{$a_status}', '{$rid}', '{$comment_reject}', '{$add_on}', '{$add_per_price}', '{$add_total}', '{$time}', '{$date}', '{$r_credit}', '{$lats}', '{$longs}', '{$wal_amt}', '{$pcommission}', '{$htype}')";
        $result = $mysqli->query($query);
        
        if($result){
            $returnArr = array("status"=> "success", "message"=> "your order is submitted successfull", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "your order is failed", "data"=> "");
        }
    }

    echo json_encode($returnArr);
?>