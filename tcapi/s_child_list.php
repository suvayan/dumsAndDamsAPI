<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $returnArr = array();
    $data = array();
    $sql = "select * from tbl_child";
    $query = $mysqli->query($sql);
    if($query->num_rows){
        while($row = $query->fetch_assoc()){
            $data[] = array(
                'id' => $row['id'],
                'cid' => $row['cid'],
                'sid' => $row['sid'],
                'title' => $row['title'],
                'description' => $row['description'],
                'price' => $row['price'],
                'img' => $row['img'],
                'status' => $row['status'],
                'count' => 0
            );
        }
        $returnArr = array("status"=> "success", "message"=> "data found", "data"=> $data);
    }else{
        $returnArr = array("status"=> "fail", "message"=> "data not found", "data"=> $data);
    }
    echo json_encode($returnArr);
?>