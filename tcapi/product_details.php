<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $returnArr = array();

    $brand = array();
    $product = array();
    $data = array();

    $sqlOne = "select * from tbl_brand";
    $queryOne = $mysqli->query($sqlOne);
    while ($row = $queryOne->fetch_assoc()){
        $brand[] = $row;
    }

    $sqlTwo = "select * from tbl_product";
    $queryTwo = $mysqli->query($sqlTwo);
    while ($row = $queryTwo->fetch_assoc()){
        $product[] = $row;
    }

    if(!empty($brand)){
        $i = 0;
        foreach($brand as $rowOne){
            $data[$i] = array(
                'id' => $rowOne['id'],
                'brand' => $rowOne['brand'],
                'img' => $rowOne['img'],
                'status' => $rowOne['status'],
                'products' => array()
            );
            foreach($product as $rowTwo){
                if($rowOne['id'] == $rowTwo['bid']){
                    $data[$i]['products'][] = array(
                        'product_id' => $rowTwo['id'],
                        'product_name' => $rowTwo['name'],
                        'product_img' => $rowTwo['img'],
                        'product_status' => $rowTwo['status'],
                    );
                }
            }
            $i++;
        }
    }


    $returnArr = array("status"=> "success", "message"=> "product details", "data"=> $data);
    echo json_encode($returnArr);
?>