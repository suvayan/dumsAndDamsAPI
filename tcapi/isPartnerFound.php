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
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,"http://api.dudeanddamsels.com/tcapi/get_check_out_for_order.php?id={$checkout_id}");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $responce      = curl_exec($ch);
    $dCodeCheckout = json_decode($responce);
    $checkoutItems = json_decode($dCodeCheckout->data->itemdetails);
    
    $orderedItems  = array_merge($checkoutItems, $dCodeAddOn);
    $sid =  $orderedItems[0]->sid;
    foreach($orderedItems as $item){
        $searchTitle[] = strtolower($item->title);
    }

    $ch1 = curl_init();
    curl_setopt($ch1, CURLOPT_URL,"http://api.dudeanddamsels.com/tcapi/get_partners_for_order.php?cid={$cid}&sid={$sid}");
    curl_setopt($ch1, CURLOPT_RETURNTRANSFER, true);
    $responcePartner       = curl_exec($ch1);
    $decodeResponcePartner = json_decode($responcePartner);
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

    if(empty($selectedPartner)){
        $returnArr = array("status"=> "faild", "message"=> "Partner not found", "data"=> "");
    }else{
        $returnArr = array("status"=> "success", "message"=> "Partners are founded", "data"=> "");
    }

    echo json_encode($returnArr);

?>