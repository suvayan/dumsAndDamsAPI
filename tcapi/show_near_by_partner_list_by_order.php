<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL & ~E_NOTICE);

    $oid   = $_POST['oid'];
    $uid   = $_POST['uid'];
    $pid   = $_POST['pid'];
    $lats  = $_POST['lats'];
    $longs = $_POST['longs'];

    $returnArr = array();
    $services = array();
    $partnersId = array();
    $partnersDetails = array();
    $partnerWithinFiveKM = array();

    $sqlOne = "select service from tbl_sub_order where oid={$oid} and uid={$uid}";
    $resultOne = $mysqli->query($sqlOne);
    while($rowOne = $resultOne->fetch_assoc()){
        array_push($services, strtolower($rowOne['service']));
    }

    $queryTwo  = "select p.name, p.pimg, p.email, p.mobile, p.id, p.lats, p.longs, ps.title as service_title from partner p, tbl_partner_service ps where p.id=ps.mid and p.status=1 and p.id != {$pid}";
    $resultTwo = $mysqli->query($queryTwo);

    if($resultTwo->num_rows){
        while($row = $resultTwo->fetch_assoc()){
            if(in_array(strtolower($row['service_title']),$services)){
                if(!in_array($row['id'],$partnersId)){
                    array_push($partnersId, $row['id']);
                    array_push($partnersDetails, $row);
                }
            }
        }
    }

    if(!empty($partnersDetails)){
        foreach($partnersDetails as $row){
            $partnerLat  = $row['lats'];
            $partnerLong = $row['longs'];
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL,"https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$lats.",".$longs."&destinations=".$partnerLat.",".$partnerLong."&key=AIzaSyDDcpxrlJrhq2brQekUjfDg62ODejlptyY");
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $responce = curl_exec($ch);
            //print_r(get_object_vars(json_decode($responce)));
            $decodeResponce = json_decode($responce);
            // print_r($decodeResponce->rows[0]->elements[0]);
            // print_r($decodeResponce->rows[0]->elements[0]->distance->value);
            // print_r($decodeResponce->rows[0]->elements[0]->duration->text);
            $distance = $decodeResponce->rows[0]->elements[0]->distance->value / 1000;
            
            if($distance <= 50){
                $partnerWithinFiveKM[] = array(
                    "pid" => $row['id'],
                    "pimg" => $row['pimg'],
                    "pname" => $row['name'],
                    "email" => $row['email'],
                    "mobile" => $row['mobile']
                );
            }
        }
    }
    if(!empty($partnerWithinFiveKM)){
        $returnArr = array("status"=> "success", "message"=> "partner list", "data"=> $partnerWithinFiveKM);
    }else{
        $returnArr = array("status"=> "success", "message"=> "there are no partner", "data"=> []);
    }
    echo json_encode($returnArr);

?>