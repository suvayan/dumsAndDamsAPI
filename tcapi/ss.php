
<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST,GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on'){
        $link = "https";
    }else{
        $link = "http";
    }
    $link .= "://";
    $link .= $_SERVER['HTTP_HOST'];
    $link .= $_SERVER['REQUEST_URI'];
    
    $pid='';
    if(!empty( $_POST['pid'])){
        $pid =  $_POST['pid'];
    }else{
        $url_components = parse_url($link);
        parse_str($url_components['query'], $params);
        $pid =  $params['pid'];
    }
    
    
    $data = array();
    $result = $mysqli->query("select * from tbl_partner_cards where pid = {$pid}")->fetch_assoc();

    if(!empty($result)){
        $data = array('status'=>'success','message'=>'successfully data get','data'=>$result);
    }else{
        $data = array('status'=>'fail','message'=>'data not found','data'=>$result);
    }
    echo json_encode($data);
?>