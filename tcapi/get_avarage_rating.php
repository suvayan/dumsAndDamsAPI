<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $pid = '';
    $returnArr = array();
    $required = array();

    if(!empty($_POST['pid'])){
        $pid = $_POST['pid'];
    }else{
        array_push($required,'pid');
    }

    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "fail", "message"=> "pid is required", "data"=> "");
    }else{
        $total_rating = 0.00;
        $sql = "select rating from tbl_sub_order where 	status='Completed' and pid={$pid}";
        $result = $mysqli->query($sql);
        if($result->num_rows){
            while($row = $result->fetch_assoc()){
                $total_rating = $total_rating + $row['rating']; 
            }
            $number_of_rating = $result->num_rows;
            $avarage_rating   = $total_rating / $number_of_rating;
            $data = array("total_rating" => $total_rating, "number_of_rating" => $number_of_rating, "avarage_rating" => $avarage_rating);
            $returnArr = array("status"=> "success", "message"=> "pid is required", "data"=> $data);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "your have no completed order", "data"=> []);
        }
    }
    echo json_encode($returnArr);
?>