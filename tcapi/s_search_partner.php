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

    $order_id        = $_POST['order_id'];
    $user_id         = $_POST['user_id'];
    $checkout_id     = $_POST['checkout_id'];
    $add_on          = !empty($_POST['add_on'])?$_POST['add_on']:null;
    $lats            = $_POST['lats'];
    $longs           = $_POST['longs'];


    function deleteOrder($mysqli, $id){
        $sql = "delete from tbl_order where id = {$id}";
        $result = $mysqli->query($sql);
        return $result;
    }


    if($order_id == '' && $user_id == '' && $checkout_id == ''){
        $returnArr = array("status"=> "success", "message"=> "order_id,user_id,checkout_id are required", "data"=> "");
    }else{
        $searchKeyWord = array();
        $searchServices= array();
        $srvicesCount= array();
        $srvicesTotal= array();
        $srvicesSubTotal= array();
        $srvicesTax= array();

        $partnersId = array();
        $partnersDetails = array();

        $partnerWithinFiveKM = array();

        $queryOne = "select itemdetails from tbl_checkout where id={$checkout_id}";
        $resultOne = $mysqli->query($queryOne)->fetch_assoc();
        $checkoutItems = json_decode($resultOne['itemdetails']);
        foreach($checkoutItems as $item){
            $title = $item->title;
            $count = (int)$item->count;
            $subTotal = (double)($item->price * $count);
            $tax = (double)(($subTotal * 18)/100);
            $total = (double)($subTotal + $tax);
            array_push($searchKeyWord, strtolower($title));
            array_push($searchServices, $title);
            array_push($srvicesCount, $count);
            array_push($srvicesSubTotal, $subTotal);
            array_push($srvicesTax, $tax);
            array_push($srvicesTotal, $total);
        }

        

        if(!empty($add_on)){
            foreach(json_decode($add_on) as $item){
                $title = $item->title;
                $count = 1;
                $subTotal = (double)($item->price * $count);
                $tax = (double)(($subTotal * 18)/100);
                $total = (double)($subTotal + $tax);
                array_push($searchKeyWord, strtolower($title));
                array_push($searchServices, $title);
                array_push($srvicesCount, $count);
                array_push($srvicesSubTotal, $subTotal);
                array_push($srvicesTax, $tax);
                array_push($srvicesTotal, $total);
            }
        }


        $queryTwo  = "select p.id, p.lats, p.longs, ps.title as service_title from partner p, tbl_partner_service ps where p.id=ps.mid and p.status=1";
        $resultTwo = $mysqli->query($queryTwo);

        if($resultTwo->num_rows){
            while($row = $resultTwo->fetch_assoc()){
                if(in_array(strtolower($row['service_title']),$searchKeyWord)){
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
                $url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$lats.",".$longs."&destinations=".$partnerLat.",".$partnerLong."&key=AIzaSyDDcpxrlJrhq2brQekUjfDg62ODejlptyY";
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL,$url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                $responce = curl_exec($ch);
                //print_r(get_object_vars(json_decode($responce)));
                $decodeResponce = json_decode($responce);
                // print_r($decodeResponce->rows[0]->elements[0]);
                // print_r($decodeResponce->rows[0]->elements[0]->distance->value);
                // print_r($decodeResponce->rows[0]->elements[0]->duration->text);
                $distance = $decodeResponce->rows[0]->elements[0]->distance->value / 1000;
                
                if($distance <= 50){
                    array_push($partnerWithinFiveKM, $row['id']);
                }
            }
            if(!empty($partnerWithinFiveKM)){
                $queryThree = "insert into temp_order_partner_tbl (oid, uid, pid) values ";
                foreach($partnerWithinFiveKM as $row){
                $queryThree .= "({$order_id},{$user_id},'{$row}'),";
            }
                $resultThree = $mysqli->query(rtrim($queryThree,','));
                if($resultThree){
                    $queryFour = "insert into tbl_sub_order (oid,uid,service,count,total,tax,subtotal) values ";
                    for($i=0;$i<count($searchServices);$i++){
                        $queryFour .= "({$order_id},{$user_id},'{$searchServices[$i]}','{$srvicesCount[$i]}','{$srvicesTotal[$i]}','{$srvicesTax[$i]}','{$srvicesSubTotal[$i]}'),";
                    }
                    $resultFour = $mysqli->query(rtrim($queryFour,','));
                    if($resultFour){
                        $returnArr = array("status"=> "success", "message"=> "order successfully created", "data"=> "");
                    }else{
                        deleteOrder($mysqli, $order_id);
                        $returnArr = array("status"=> "failed", "message"=> "order failed, please try again", "data"=> "");
                    }
                }else{
                    deleteOrder($mysqli, $order_id);
                    $returnArr = array("status"=> "failed", "message"=> "order failed, please try again", "data"=> "");
                }
            }else{
                deleteOrder($mysqli, $order_id);
                $returnArr = array("status"=> "failed", "message"=> "No partners found for required services", "data"=> "");
            }
        }else{
            deleteOrder($mysqli, $order_id);
            $returnArr = array("status"=> "failed", "message"=> "No partners found for required services", "data"=> "");
        }
        
    }

    echo json_encode($returnArr);
?>