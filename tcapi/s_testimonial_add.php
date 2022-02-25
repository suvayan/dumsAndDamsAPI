<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    //$data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();
    $url = dirname( dirname(__FILE__) ).'/assets/testimonial/';
    $title        = !empty($_POST['title'])?$_POST['title'] : null;
    $description  = !empty($_POST['description'])?$_POST['description'] : null;
    $image        = null;
    $cname        = !empty($_POST['cname'])?$_POST['cname'] : null;
    $status       = 0;


    if(!empty($_FILES["image"]['name'])){
        $imageName     = time().$_FILES["image"]['name'];
        $imageTempName = $_FILES["image"]['tmp_name'];
        if(move_uploaded_file($imageTempName, $url.$imageName)){
            $image = 'assets/testimonial/'.$imageName;
        }
    }

    $sql = "insert into tbl_testimonial (title, description, img, cname, status) values ('{$title}','{$description}','{$image},{$cname}','{$status}')";
    $result = $mysqli->query($sql);
    if($result){
        $returnArr = array("status"=> "success", "message"=> "testimonial added successfully", "data"=> "");
    }else{
        $returnArr = array("status"=> "fail", "message"=> "testimonial gets fail to add", "data"=> "");
    }
    
    echo json_encode($returnArr);
?>