<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $pid   = $_POST['pid'];
    $lats  = $_POST['lats'];
    $longs = $_POST['longs'];

    $returnArr = array();
    $services = array();
    $partnersId = array();
    $partnersDetails = array();
    $partnerWithinFiveKM = array();


    $queryTwo  = "select * from partner where status=1";
    $resultTwo = $mysqli->query($queryTwo);

    if($resultTwo->num_rows){
        while($row = $resultTwo->fetch_assoc()){
            if(!in_array($row['id'],$partnersId)){
                array_push($partnersId, $row['id']);
                array_push($partnersDetails, $row);
            }
        }
    }

    if(!empty($partnersDetails)){
        foreach($partnersDetails as $row){
            $partnerLat  = $row['lats'];
            $partnerLong = $row['longs'];
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL,"https://maps.googleapis.com/maps/api/distancematrix/json?origins={$lats},{$longs}&destinations={$partnerLat},{$partnerLong}&key=AIzaSyDDcpxrlJrhq2brQekUjfDg62ODejlptyY");
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $responce = curl_exec($ch);
            $decodeResponce = json_decode($responce, true);
            $status = $decodeResponce['status'];
            //echo $status;exit;
            if ($status == 'ZERO_RESULTS' ){
                return FALSE;
            } else {
                //$distance = 0;
                $distance = $decodeResponce['rows'][0]['elements'][0]['distance']['value'];
                //$distance = $decodeResponce->rows[0]->elements[0]->distance->value;// / 1000;
                //echo "The distance is: $decodeResponce['rows'][0]['elements'][0]['distance']['value']";
                if($distance <= 500){
                  array_push($partnerWithinFiveKM, $row);
                  //echo "The array is:\n";
                }
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