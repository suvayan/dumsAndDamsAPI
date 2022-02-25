<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    
    $returnArr = array();
    $required = array();
    $data = array();
    $title = '';
    if(!empty($_POST['title'])){
        $title=$_POST['title'];
    }else{
        array_push($required, 'title');
    }
    
    if(!empty($required) && count($required) > 0){
        $returnArr = array("status"=> "faild", "message"=> "required all mandetory fields", "data"=> "");
    }else{
        $sql = "select * from partner where name like '%{$title}%'";
        $result = $mysqli->query($sql);
        if($result->num_rows){
            while($row = $result->fetch_assoc()){
                $data[] = $row;
            }
            $returnArr = array("status"=> "success", "message"=> "partner details", "data"=> $data);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "no partners details", "data"=> $data);
        }
    }
    echo json_encode($returnArr);
?>