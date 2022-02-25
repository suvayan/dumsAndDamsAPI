<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();
    $required = array();
    $data = array();
    $child_id='';

    if(!empty($_POST['child_id'])){
        $child_id=$_POST['child_id'];
    }else{
        array_push($required, 'child_id');
    }


    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "fail", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sql = "select * from tbl_child_service where child_id={$child_id}";
        $result = $mysqli->query($sql);
        if($result->num_rows){
            while($row = $result->fetch_assoc()){
                $data[] = array(
                    'child_id' => $row['child_id'],
                    'title' => $row['title'],
                    'description' => $row['description'],
                    'price' => $row['price'],
                    'img' => $row['img'],
                    'status' => $row['status'],
                    'count' => 0
                );
            }
            $returnArr = array("status"=> "success", "message"=> "child services details", "data"=> $data);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "no child services details", "data"=> $data);
        }
    }
    echo json_encode($returnArr);
?>