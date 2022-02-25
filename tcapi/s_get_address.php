<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), false);
    $returnArr = array();
    $pid = !empty($_POST['pid']) ? $_POST['pid'] : null;
    $data = array();
    if(empty($pid)){
        $returnArr = array("status"=> "fail", "message"=> "pid is required", "data"=> []);
    }else{
        $sql   = "select * from tbl_prtner_address where pid={$pid}";
        $query = $mysqli->query($sql);
        if($query->num_rows){
            while($row = $query->fetch_assoc()){
                $data[] = $row;
            }
            $returnArr = array("status"=> "success", "message"=> "data found", "data"=> $data);  
        }else{
            $returnArr = array("status"=> "fail", "message"=> "data not found", "data"=> $data);  
        }
    }
    echo json_encode($returnArr);
?>