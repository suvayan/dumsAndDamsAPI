<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $returnArr = array();

    $homes = array();
    $homeServices = array();
    $categories = array();
    $dynamicSections = array();
    
    $home = $mysqli->query("select * from tbl_home where status=1");
    while($row = $home->fetch_assoc()){
        $homes[] = array(
            "id" => $row["id"],
            "title" => $row["title"],
            "subtitle" => $row["subtitle"],
        );
    }

    $homeService = $mysqli->query("select * from tbl_home_service where status=1");
    while($row = $homeService->fetch_assoc()){
        $homeServices[] = array(
            "id" => $row["id"],
            "cid" => $row["cid"],
            "sid" => $row["sid"],
            "img" => $row["img"],
            "title" => $row["title"],
            "subtitle" => $row["subtitle"],
            "status" => $row["status"],
        );
    }

    $category = $mysqli->query("select * from category where cat_status=1");
    while($row = $category->fetch_assoc()){
        $categories[] = array(
            "id" => $row["id"],
            "title" => $row["cat_name"],
            "subtitle" => $row["cat_subtitle"],
            "video" => $row["cat_video"],
        );
    }
    $i=0;
    foreach($home as $hdata){
        $j = 0;
        $dynamicSections[$i] = array(
            "sec_id" => $hdata['id'],
            "sec_title" => $hdata['title'],
            "sec_subtitle" => $hdata['subtitle']
        );

        foreach($homeService as $hsdata){
            if($hdata['id'] == $hsdata['sid']){
                $dynamicSections[$i]['service_data'][$j] = array(
                    "cat_id" => $hsdata['cid'],
                    "img" => $hsdata['img'],
                    "title" => $hsdata['title'],
                    "subtitle" => $hsdata['subtitle']
                );

                foreach($categories as $cdata){
                    if($cdata['id'] == $hsdata['cid']){
                        $dynamicSections[$i]['service_data'][$j]['cat_title'] = $cdata['title'];
                        $dynamicSections[$i]['service_data'][$j]['cat_subtitle'] = $cdata['subtitle'];
                        $dynamicSections[$i]['service_data'][$j]['video'] = $cdata['video'];
                    }
                }
            }
            $j++;
        }
        $i++;
    }

    $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $dynamicSections);   
    echo str_replace('\/','/',json_encode($returnArr));
?>