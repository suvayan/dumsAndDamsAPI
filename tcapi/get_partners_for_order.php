<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET, POST');
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
    $url_components = parse_url($link);
    parse_str($url_components['query'], $params);
    $data = array();
    $cid   =  $params['cid'];
    $sid   =  $params['sid'];
    $arrRes = array();
    $data = array();
    $result = $mysqli->query("select p.id,p.lats,p.longs,p.email,p.mobile,ps.title from tbl_partner_service ps, partner p where ps.mid = p.id and ps.cid={$cid} and ps.sid={$sid}");

    if(!empty($result)){
        while($row = $result->fetch_assoc()){
            $data[] = $row;
        }
        $arrRes = array('status'=>'success','message'=>'successfully data get','data'=>$data);
    }else{
        $arrRes = array('status'=>'fail','message'=>'data not found','data'=>$data);
    }
    echo json_encode($arrRes);
?>