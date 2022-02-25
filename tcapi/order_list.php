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

    $uid         = !empty($_POST['uid'])? $_POST['uid'] : null;
    $orders      = array();
    $partners    = array();
    $subOrders   = array();
    $orderList   = array();

    if(empty($_POST['uid'])){
        $returnArr = array('status'=>'fail','message'=>'Faild','data'=>[]);
    }else{
        $queryOne = "select * from tbl_order where uid = {$uid} order by id desc";
        $resultOne = $mysqli->query($queryOne);
        if($resultOne->num_rows){
            while($row = $resultOne->fetch_assoc()){
                $orders[] = $row;
            }
        }

        $queryTwo = "select a.id, a.name, a.email, a.mobile, a.pimg, b.oid, b.id as sub_order_id from partner a, tbl_sub_order b where a.id = b.pid";
        $resultTwo = $mysqli->query($queryTwo);
        if($resultTwo->num_rows){
            while($row = $resultTwo->fetch_assoc()){
                $partners[] = $row;
            }
        }

        $queryThree = "select * from tbl_sub_order where uid = {$uid}";
        $resultThree = $mysqli->query($queryThree);
        if($resultThree->num_rows){
            while($row = $resultThree->fetch_assoc()){
                $subOrders[] = $row;
            }
        }

        $i = 0;
        if(!empty($orders)){
            foreach($orders as $order){
                $orderList[$i] = array(
                    "order_id" => $order['id'],
                    "odate" => $order["odate"],
                    "otime" => $order["otime"],
                    "o_total" => $order["o_total"],
                    "o_tax" => $order["o_tax"],
                    "subtotal" => $order["subtotal"],
                    "o_status" => $order["o_status"],
                    "p_method_id" => $order["p_method_id"],
                    "subOrderItems" => array(),
                    "pendingSubOrderItems" => array()
                );
                $partnerIds  = array();
                $j = 0;
                foreach($partners as $partner){
                    if($partner["oid"] == $order['id']){
                        if(!in_array($partner["id"], $partnerIds)){
                            array_push($partnerIds, $partner["id"]);
                            $orderList[$i]["subOrderItems"][$j] = array(
                                "partner_id"      => $partner["id"],
                                "name"            => $partner["name"],
                                "email"           => $partner["email"],
                                "mobile"          => $partner["mobile"],
                                "pimg"            => $partner["pimg"],
                                "subOrders"       => array()
                            );
                            foreach($subOrders as $subOrder){
                                if(($subOrder['oid'] == $order['id']) && ($subOrder['pid'] == $partner['id'])){
                                    $orderList[$i]["subOrderItems"][$j]["subOrders"][] = array(
                                        "sub_order_id" => $subOrder['id'],
                                        "service"      => $subOrder['service'],
                                        "status"       => $subOrder['status'],
                                        "count"        => $subOrder['count'],
                                        "total"        => $subOrder['total'],
                                        "tax"          => $subOrder['c_amt'],
                                        "subtotal"     => $subOrder['subtotal'],
                                        "serviceCharge" => $subOrder['p_amt'],
                                        "otherCharges"  => $subOrder['c_amt']
                                    );
                                }
                            }
                            $j++;
                        }
                    }
                }
                unset($partnerIds);
                

                foreach($subOrders as $subOrder){
                    if(($subOrder['oid'] == $order['id']) && empty($subOrder['pid'])){
                        $orderList[$i]["pendingSubOrderItems"][]= array(
                            "sub_order_id"  => $subOrder['id'],
                            "service"       => $subOrder['service'],
                            "status"        => $subOrder['status'],
                            "count"         => $subOrder['count'],
                            "total"         => $subOrder['total'],
                            "tax"          => $subOrder['c_amt'],
                            "subtotal"     => $subOrder['subtotal'],
                            "serviceCharge" => $subOrder['p_amt'],
                            "otherCharges"  => $subOrder['c_amt']
                        );
                    }
                }

                $i++;
            }
        }
        $returnArr = array('status'=>'success','message'=>'successfull','data'=>$orderList);
    }
    echo json_encode($returnArr);