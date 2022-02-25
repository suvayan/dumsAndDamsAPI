<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();
    
    $categories = array();
    $subCategories = array();
    $categorySubCategory = array();
    $category = $mysqli->query("select * from category where cat_status=1");
    $subCategory = $mysqli->query("select * from g_subcategory where status=1");
    $cat = array();
    $subCat = array();
    $catNsubCat = array();
    while($row = $category->fetch_assoc()){
	    $cat['id'] = $row['id'];
	    $cat['cat_subtitle'] = $row['cat_subtitle'];
        $cat['cat_name'] = $row['cat_name'];
        $cat['cat_status'] = $row['cat_status'];
        $cat['cat_img'] = $row['cat_img'];
	    $cat['cat_video'] = $row['cat_video'];
        $categories[] = $cat;
    }
    while($row = $subCategory->fetch_assoc()){
	    $subCat['id'] = $row['id'];
	    $subCat['cid'] = $row['cid'];
        $subCat['title'] = $row['title'];
        $subCat['img'] = $row['img'];
        $subCat['video'] = $row['video'];
	    $subCat['status'] = $row['status'];
        $subCategories[] = $subCat;
    }

    foreach($categories as $rowOne){
        $catNsubCat['cat_id']       = $rowOne['id'];
        $catNsubCat['cat_title']    = $rowOne['cat_name'];
        $catNsubCat['cat_subtitle'] = $rowOne['cat_subtitle'];
        $catNsubCat['cat_img']      = $rowOne['cat_img'];
        $catNsubCat['cat_video']    = $rowOne['cat_video'];
        $catNsubCat['cat_status']   = $rowOne['cat_status'];
        $catNsubCat['sub_category'] = array();
        foreach($subCategories as $rowTwo){
            if($rowOne['id'] === $rowTwo['cid']){
                $catNsubCat['sub_category'][] = array(
                    'sub_cat_id' => $rowTwo['id'],
                    'sub_cat_title' => $rowTwo['title'],
                    'sub_cat_img' => $rowTwo['img'],
                    'sub_cat_video' => $rowTwo['video'],
                    'sub_cat_status' => $rowTwo['status'],
                );
            }
        }
        $categorySubCategory[] = $catNsubCat;
    }

    $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $categorySubCategory);    
    echo json_encode($returnArr);
?>