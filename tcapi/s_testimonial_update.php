<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();
    $url = dirname( dirname(__FILE__) ).'/assets/testimonial/';
    $id           = $_POST['id'];
    $title        = !empty($_POST['title'])?$_POST['title'] : null;
    $description  = !empty($_POST['description'])?$_POST['description'] : null;
    $cname  = !empty($_POST['cname'])?$_POST['cname'] : null;

    if($id == ''){
        $returnArr = array("status"=> "success", "message"=> "id is required", "data"=> "");
    }else{
        $getData      = $mysqli->query("select img from tbl_testimonial where id =".$id)->fetch_assoc();
        $image        = $getData['img'];
        if(!empty($_FILES["image"]['name'])){
            $imageName     = time().$_FILES["image"]['name'];
            $imageTempName = $_FILES["image"]['tmp_name'];
            if(move_uploaded_file($imageTempName, $url.$imageName)){
                $image = 'assets/testimonial/'.$imageName;
            }
        }
        $sql = "update tbl_testimonial set title = '{$title}', description = '{$description}', img = '{$image}', cname = '{$cname}' where id = '$id'";
        $result = $mysqli->query($sql);
        if($result){
            $returnArr = array("status"=> "success", "message"=> "testimonial updated successfully", "data"=> "");
        }else{
            $returnArr = array("status"=> "fail", "message"=> "testimonial gets fail to update", "data"=> "");
        }
    }


    echo json_encode($returnArr);
?>