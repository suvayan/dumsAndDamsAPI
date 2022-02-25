<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $data = json_decode(file_get_contents('php://input'), true);
    $returnArr = array();

    $cid = !empty($_POST['cid'])?$_POST['cid']:null;
    $city = !empty($_POST['city'])?$_POST['city']:null;

    $subCategory = array();
    $categoryVideo = array();
    $categoryIds  = array();
    $data = array();
    
    if(!empty($cid) && !empty($city)){
        $sqlOne = "select sc.*, c.cat_video from g_subcategory sc, category c where sc.cid=c.id";
        $queryOne = $mysqli->query($sqlOne);
        if($queryOne->num_rows){
            while($row = $queryOne->fetch_assoc()){
                $cityIds = json_decode($row['city_id']);
                if(in_array($city, $cityIds)){
                    $subCategory[] = (object)array(
                        'categoty_id' => $row['cid'],
                        'sub_categoty_id' => $row['id'],
                        'sub_categoty_title' => $row['title'],
                        'sub_categoty_img' => $row['img'],
                        'sub_categoty_video' => $row['video'],
                        'sub_categoty_status' => $row['status'],
                    );
                    if(!in_array($row['id'],$categoryIds)){
                        array_push($categoryIds, $row['id']);
                        if(!empty($row['cat_video'])){
                            array_push($categoryVideo, $row['cat_video']);
                        }
                    }
                }
            }
            $data = array(
                'subCategory' => $subCategory,
                'categoryVideo' => $categoryVideo 
            );
            $returnArr = array("status"=> "success", "message"=> "subcategory list", "data"=> (object)$data);
        }else{
            $sqlTwo = "select sc.*, c.cat_video from g_subcategory sc, category c where sc.cid=c.id and sc.cid={$cid}";
            $queryTwo = $mysqli->query($sqlTwo);
            if($queryTwo->num_rows){
                while($row = $queryTwo->fetch_assoc()){
                    $subCategory[] = (object)array(
                        'categoty_id' => $row['cid'],
                        'sub_categoty_id' => $row['id'],
                        'sub_categoty_title' => $row['title'],
                        'sub_categoty_img' => $row['img'],
                        'sub_categoty_video' => $row['video'],
                        'sub_categoty_status' => $row['status'],
                    );
                    if(!in_array($row['id'],$categoryIds)){
                        array_push($categoryIds, $row['id']);
                        if(!empty($row['cat_video'])){
                            array_push($categoryVideo, $row['cat_video']);
                        }
                    }
                }
                $data = array(
                    'subCategory' => $subCategory,
                    'categoryVideo' => $categoryVideo 
                 );
                $returnArr = array("status"=> "success", "message"=> "subcategory list", "data"=> (object)$data);
            }else{
                $returnArr = array("status"=> "fail", "message"=> "data not found", "data"=> (object)$data);
            }
        }

    }elseif(!empty($cid) && empty($city)){

        $sql = "select sc.*, c.cat_video from g_subcategory sc, category c where sc.cid=c.id and sc.cid={$cid}";
        $query = $mysqli->query($sql);
        if($query->num_rows){
            while($row = $query->fetch_assoc()){
                $subCategory[] = (object)array(
                    'categoty_id' => $row['cid'],
                    'sub_categoty_id' => $row['id'],
                    'sub_categoty_title' => $row['title'],
                    'sub_categoty_img' => $row['img'],
                    'sub_categoty_video' => $row['video'],
                    'sub_categoty_status' => $row['status'],
                );
                if(!in_array($row['id'],$categoryIds)){
                    array_push($categoryIds, $row['id']);
                    if(!empty($row['cat_video'])){
                        array_push($categoryVideo, $row['cat_video']);
                    }
                }
            }
            $data = array(
                'subCategory' => $subCategory,
                'categoryVideo' => $categoryVideo 
             );
            $returnArr = array("status"=> "success", "message"=> "subcategory list", "data"=> (object)$data);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "data not found", "data"=> (object)$data);
        }
    }elseif(empty($cid) && !empty($city)){
        $sql = "select sc.*, c.cat_video from g_subcategory sc, category c where sc.cid=c.id";
        $query = $mysqli->query($sql);
        if($query->num_rows){
            while($row = $query->fetch_assoc()){
                $cityIds = json_decode($row['city_id']);
                if(in_array($city, $cityIds)){
                    $subCategory[] = (object)array(
                        'categoty_id' => $row['cid'],
                        'sub_categoty_id' => $row['id'],
                        'sub_categoty_title' => $row['title'],
                        'sub_categoty_img' => $row['img'],
                        'sub_categoty_video' => $row['video'],
                        'sub_categoty_status' => $row['status'],
                    );
                    if(!in_array($row['id'],$categoryIds)){
                        array_push($categoryIds, $row['id']);
                        if(!empty($row['cat_video'])){
                            array_push($categoryVideo, $row['cat_video']);
                        }
                    }
                }
            }
            $data = array(
               'subCategory' => $subCategory,
               'categoryVideo' => $categoryVideo 
            );
            $returnArr = array("status"=> "success", "message"=> "subcategory list", "data"=> (object)$data);
        }else{
            $returnArr = array("status"=> "fail", "message"=> "data not found", "data"=> (object)$data);
        }

    }else{
        $returnArr = array("status"=> "fail", "message"=> "either categori or city", "data"=> (object)$data);
    }
    echo json_encode($returnArr);
?>