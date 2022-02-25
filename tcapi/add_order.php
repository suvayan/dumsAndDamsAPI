<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    require_once (dirname( dirname(__FILE__) ).'/tcapi/PartnerPushNotification.php');
    require_once (dirname( dirname(__FILE__) ).'/tcapi/UserPushNotification.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();

    $checkout_id       = $_POST["checkout_id"];
    $uid               = $_POST["uid"];
    $cid               = !empty($_POST['cid'])?$_POST['cid'] : null;
    $pid               = !empty($_POST['pid'])?$_POST['pid'] : null;
    $odate             = !empty($_POST['odate'])?$_POST['odate'] : null;
    $otime             = !empty($_POST['otime'])?$_POST['otime'] : null;
    $address           = !empty($_POST['address'])?$_POST['address'] : null;
    $add_on            = !empty($_POST['add_on'])?$_POST['add_on'] : null;
    $p_method_id       = !empty($_POST['p_method_id'])?$_POST['p_method_id'] : null;
    $lats              = $_POST['lats'];
    $longs             = $_POST['longs'];
    
    $searchTitle   = array();
    $subOrderList  = array();
    $orderID = '';
    $orderSubTotal = 0;
    $orderTax = 0;
    $orderTotal = 0;
    $orderPartnerTotal = 0;
    $orderCompanyTotal = 0;
    $addOnPrice = array();
    $add_per_price = '';
    $partnerIds = array();
    $selectedPartner = array();
    $userCity = '';

    $chCity = curl_init();
    curl_setopt($chCity, CURLOPT_URL,"https://maps.googleapis.com/maps/api/geocode/json?latlng={$lats},{$longs}&sensor=true&key=AIzaSyDDcpxrlJrhq2brQekUjfDg62ODejlptyY");
    curl_setopt($chCity, CURLOPT_RETURNTRANSFER, true);
    $cityResponce      = curl_exec($chCity);
    $dCodeCity = json_decode($cityResponce);
    $userCity = $dCodeCity->results[0]->address_components[3]->long_name;

    $dCodeAddOn = !empty($add_on)?json_decode($add_on) : array();
    //echo "http://api.dudeanddamsels.com/tcapi/get_check_out_for_order.php?id={$checkout_id}";exit;
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,"http://api.dudeanddamsels.com/tcapi/get_check_out_for_order.php?id={$checkout_id}");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $responce      = curl_exec($ch);
    $dCodeCheckout = json_decode($responce);
    //print_r($dCodeCheckout->data->itemdetails);exit;
    $checkoutItems = json_decode($dCodeCheckout->data->itemdetails);
    //print_r($checkoutItems);exit;
    
    $orderedItems  = array_merge($checkoutItems, $dCodeAddOn);
    //print_r($orderedItems);exit;
    $sid =  $orderedItems[0]->sid;
    //echo "SID : ".$sid;exit;
    foreach($orderedItems as $item){
        $searchTitle[] = strtolower($item->title);
    }
    
    //print_r($searchTitle);exit;

    if(!empty($dCodeAddOn)){
        foreach($dCodeAddOn as $dcRow){
            $addOnPrice[] = $dcRow->price;
        }
    }


    $add_per_price = json_encode($addOnPrice);

    //echo $app_per_price;

    foreach($orderedItems as $item){
        $count          = isset($item->count)?$item->count:1;
        $subtotal       = $count * $item->price;
        $tax            = ($subtotal * 20)/100;
        $total          = $subtotal;
        $partnerShare   = ($subtotal * 80)/100;
        $companyShare   = ($subtotal * 20)/100;
        
        $orderSubTotal  = $orderSubTotal + $subtotal;
        $orderTax       = $orderTax + $companyShare;
        $orderTotal     = $orderTotal + $total;
        $orderPartnerTotal = $orderPartnerTotal + $partnerShare;
        $orderCompanyTotal = $orderCompanyTotal + $companyShare;
        $subOrderList[] = array(
            'title'    => $mysqli->real_escape_string($item->title),
            'count'    => $count,
            'subtotal' => $subtotal,
            'tax'      => $tax,
            'total'    => $total,
            'p_amt'    => $partnerShare,
            'c_amt'    => $companyShare,
            'date'     => date("Y-m-d H:i:s")
        );
    }
    
    //print_r($orderedItems);exit;

    if(empty($checkout_id) && empty($cid) && empty($uid) && empty($lats) && empty($longs)){
        $returnArr = array("status"=> "fail", "message"=> "checkout_id,uid,lats,longs are required", "data"=> "");
    }else{
        $dateNTime = date('Y-m-d H:i:s');
        $sql = "insert into tbl_order (checkout_id,uid,cid,odate,otime,address,o_total,o_tax,subtotal,add_on,add_per_price,lats,longs, p_method_id, datetime, p_total, c_total) values ('$checkout_id','$uid','$cid','{$odate}','{$otime}','{$address}','{$orderTotal}','{$orderTax}','{$orderSubTotal}','{$add_on}','{$add_per_price}','{$lats}','{$longs}', '{$p_method_id}','{$dateNTime}', '{$orderPartnerTotal}', '{$orderCompanyTotal}')";
        
        $result = $mysqli->query($sql);
        // $result = true;
        if($result){
            $orderID = $mysqli->insert_id;
            //$orderID = 1;
            if(!empty($orderID)){
                if(!empty($pid)){
                    $subOrderSQL = "insert into tbl_sub_order (oid, uid, service, count, total, gst, subtotal, pid, status, p_amt, c_amt, datetime) values ";
                    foreach($subOrderList as $solRow){
                        $subOrderSQL .= "({$orderID},{$uid},'{$solRow['title']}',{$solRow['count']},{$solRow['total']},{$solRow['tax']},{$solRow['subtotal']}, {$pid}, 'Confirmed', {$solRow['p_amt']}, {$solRow['c_amt']}, '{$solRow['date']}'),";
                        
                    }
                    $subOrderQuery = $mysqli->query(rtrim($subOrderSQL,","));
                    if($subOrderQuery){
                        $partnerInsert = $mysqli->query("insert into temp_order_partner_tbl (oid,uid,pid) values ({$orderID},{$uid},{$pid})");
                        $date  = date('Y-m-d H:i:s');
                        $sqlNotification = "insert into tbl_partner_notification (pid, datetime, title, description) values ({$pid}, '{$date}', 'New order', 'You got a new order.OrderId:{$orderID}')";
                        $resultNotification = $mysqli->query($sqlNotification);
                        $sqlPush = "select * from partner where id={$pid}";
                        $resultPush = $mysqli->query($sqlPush)->fetch_assoc();
                        if(!empty($resultPush['a_token']) && empty($resultPush['i_token'])){
                            $pushNotification = new PartnerPushNotification($resultPush['a_token'], 'New order', 'You got a new order.', 'alert.mp3');
                            $pushNotification->sendNotification();
                        }elseif(empty($resultPush['a_token']) && !empty($resultPush['i_token'])){
                            $pushNotification = new PartnerPushNotification($resultPush['i_token'], 'New order', 'You got a new order.', 'alert.mp3');
                            $pushNotification->sendNotification();
                        }else{
                            $pushNotificationA = new PartnerPushNotification($resultPush['a_token'], 'New order', 'You got a new order.', 'alert.mp3');
                            $pushNotificationA->sendNotification();
                            
                            $pushNotification = new PartnerPushNotification($resultPush['i_token'], 'New order', 'You got a new order.', 'alert.mp3');
                            $pushNotification->sendNotification();
                        }
                        if($partnerInsert){
                            $returnArr = array("status"=> "success", "message"=> "Order is success", "data"=> (object)array("order_id" => $orderID));
                        }else{
                            $delCheckOut = $mysqli->query("delete from tbl_checkout where id={$checkout_id}");
                            $delOrder    = $mysqli->query("delete from tbl_order where id={$orderID}");
                            $delSubOrder = $mysqli->query("delete from tbl_sub_order where id in (select id from tbl_sub_order where oid={$orderID} and uid={$uid})");
                            if($delCheckOut && $delOrder && $delSubOrder){
                                $returnArr = array("status"=> "faild", "message"=> "Order is faild", "data"=> "");
                            }else{
                                $returnArr = array("status"=> "faild", "message"=> "Order is faild", "data"=> "");
                            }
                        }
                        /*$sqlPush2 = "select * from tbl_user where id={$uid}";
                        $resultPush2 = $mysqli->query($sqlPush2)->fetch_assoc();
                        $pushNotification2 = new UserPushNotification($resultPush2['a_token'], 'Order placed successfully', 'Your order placed successfully.', 'alert.mp3');
                        $pushNotification2->sendNotification();*/
                    }else{
                        $delCheckOut = $mysqli->query("delete from tbl_checkout where id={$checkout_id}");
                        $delOrder    = $mysqli->query("delete from tbl_order where id={$orderID}");
                        if($delCheckOut && $delOrder){
                            $returnArr = array("status"=> "faild", "message"=> "Order is faild", "data"=> "");
                        }else{
                            $returnArr = array("status"=> "faild", "message"=> "Order is faild", "data"=> "");
                        }
                    }
                }else{
                    $ch1 = curl_init();
                    curl_setopt($ch1, CURLOPT_URL,"http://api.dudeanddamsels.com/tcapi/get_partners_for_order.php?cid={$cid}&sid={$sid}");
                    curl_setopt($ch1, CURLOPT_RETURNTRANSFER, true);
                    $responcePartner       = curl_exec($ch1);
                    $decodeResponcePartner = json_decode($responcePartner);
                    //print_r($decodeResponcePartner);exit;
                    if(!empty($decodeResponcePartner->data)){
                        foreach($decodeResponcePartner->data as $pRow){
                            if(in_array(strtolower($pRow->title), $searchTitle)){
                                $ch3 = curl_init();
                                // curl_setopt($ch3, CURLOPT_URL,"https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$lats.",".$longs."&destinations=".$pRow->lats.",".$pRow->longs."&key=AIzaSyDDcpxrlJrhq2brQekUjfDg62ODejlptyY");
                                curl_setopt($ch3, CURLOPT_URL,"https://maps.googleapis.com/maps/api/geocode/json?latlng={$pRow->lats},{$pRow->longs}&sensor=true&key=AIzaSyDDcpxrlJrhq2brQekUjfDg62ODejlptyY");
                                curl_setopt($ch3, CURLOPT_RETURNTRANSFER, true);
                                $responce = curl_exec($ch3);
                                $getResDecode = json_decode($responce);
                                $partnerCity = $getResDecode->results[0]->address_components[3]->long_name;
                                if($partnerCity == $userCity){
                                    if(!in_array($pRow->id,$partnerIds)){
                                        array_push($partnerIds,$pRow->id);
                                        array_push($selectedPartner,$pRow->id);
                                    }
                                }
                            }
                        }
                    }
                    if(!empty($selectedPartner)){
                        $subOrderSQL = "insert into tbl_sub_order (oid, uid, service, count, total, gst, subtotal, p_amt, c_amt, datetime) values ";
                        foreach($subOrderList as $solRow){
                            $subOrderSQL .= "({$orderID},{$uid},'{$solRow['title']}','{$solRow['count']}','{$solRow['total']}','{$solRow['tax']}','{$solRow['subtotal']}', '{$solRow['p_amt']}', '{$solRow['c_amt']}', '{$solRow['date']}'),";
                        }
                        $subOrderQuery = $mysqli->query(rtrim($subOrderSQL,","));

                        if($subOrderQuery){
                            $date  = date('Y-m-d H:i:s');
                            $partnerInsertSQL = "insert into temp_order_partner_tbl (oid,uid,pid) values ";
                            $partnerNotification = "insert into tbl_partner_notification (pid, datetime, title, description) values ";
                            foreach($selectedPartner as $row){
                                $partnerInsertSQL .= "({$orderID},{$uid},{$row}),";
                                $partnerNotification .= "({$row},'{$date}','New order','You got a new order.OrderId:{$orderID}'),";
                                $sqlPush = "select * from partner where id={$row}";
                                $resultPush = $mysqli->query($sqlPush)->fetch_assoc();
                                if(!empty($resultPush['a_token']) && empty($resultPush['i_token'])){
                                    $pushNotification = new PartnerPushNotification($resultPush['a_token'], 'New order', 'You got a new order.', 'alert.mp3');
                                    $pushNotification->sendNotification();
                                }elseif(empty($resultPush['a_token']) && !empty($resultPush['i_token'])){
                                    $pushNotification = new PartnerPushNotification($resultPush['i_token'], 'New order', 'You got a new order.', 'alert.mp3');
                                    $pushNotification->sendNotification();
                                }else{
                                    $pushNotificationA = new PartnerPushNotification($resultPush['a_token'], 'New order', 'You got a new order.', 'alert.mp3');
                                    $pushNotificationA->sendNotification();
                                    $pushNotification = new PartnerPushNotification($resultPush['i_token'], 'New order', 'You got a new order.', 'alert.mp3');
                                    $pushNotification->sendNotification();
                                }
                            }
                            $partnerInsert = $mysqli->query(rtrim($partnerInsertSQL, ","));
                            $partnerNotificationInsert = $mysqli->query(rtrim($partnerNotification, ","));
                            if($partnerInsert){
                                $returnArr = array("status"=> "success", "message"=> "Order is success", "data"=> (object)array("order_id" => $orderID));
                            }else{
                                $returnArr = array("status"=> "faild", "message"=> "Order is faild", "data"=> "");
                            }
                            /*$sqlPush2 = "select * from tbl_user where id={$uid}";
                            $resultPush2 = $mysqli->query($sqlPush2)->fetch_assoc();
                            $pushNotification2 = new UserPushNotification($resultPush2['a_token'], 'Order placed successfully', 'Your order placed successfully.', 'alert.mp3');
                            $pushNotification2->sendNotification();*/
                        }
                    }else{
                        $delCheckOut = $mysqli->query("delete from tbl_checkout where id={$checkout_id}");
                        $delOrder    = $mysqli->query("delete from tbl_order where id={$orderID}");
                        $delSubOrder = $mysqli->query("delete from tbl_sub_order where id in (select id from tbl_sub_order where oid={$orderID} and uid={$uid})");
                        if($delCheckOut && $delOrder && $delSubOrder){
                            $returnArr = array("status"=> "faild", "message"=> "Partner not found", "data"=> "");
                        }else{
                            $returnArr = array("status"=> "faild", "message"=> "Order is faild", "data"=> "");
                        }
                    }
                }
                
            }else{
                $returnArr = array("status"=> "faild", "message"=> "Order is faild", "data"=> "");
            }
        }else{
            $returnArr = array("status"=> "faild", "message"=> "Order is faild", "data"=> "");
        }
        
    }


    echo json_encode($returnArr);

?>