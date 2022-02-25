<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    $data   = json_decode(file_get_contents('php://input'), false);

    $id     = !empty($_POST['id']) ? $_POST['id'] : null;
    $pid    = !empty($_POST['pid']) ? $_POST['pid'] : null;

    if(empty($id) || empty($pid)){
        $returnArr = array("status"=> "faild", "message"=> "All fields are required");  
    }else{
        $sql    = "update tbl_prtner_address set isPrimary = 1 where id = {$id} and pid = {$pid}";
        $query  = $mysqli->query($sql);
        if($query){
            $sqlOne = "update tbl_prtner_address set isPrimary = 0 where id in (select id from tbl_prtner_address where pid = {$pid} and id != {$id})";
            $queryOne  = $mysqli->query($sqlOne);
            if($queryOne){
                $returnArr = array("status"=> "success", "message"=> "Succesfull");  
            }else{
                $returnArr = array("status"=> "faild", "message"=> "Faild");  
            }
        }else{
            $returnArr = array("status"=> "faild", "message"=> "Faild");  
        }
    }
    echo json_encode($returnArr);
?>

