<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $returnArr = array();
    $result = array();
    $home = array();
    $homeService = array();

    $sql='select * from tbl_home where status=1';
    $query = $mysqli->query($sql);
    if($query->num_rows){
        while($row = $query->fetch_assoc()){
            $home[] = $row;
        }
    }

    $sqlOne='select * from tbl_home_service where status=1';
    $queryOne = $mysqli->query($sqlOne);
    if($queryOne->num_rows){
        while($row = $queryOne->fetch_assoc()){
            $homeService[] = $row;
        }
    }

    if(!empty($home)){
        $i = 0;
        foreach($home as $row){
            $result[$i] = array(
                'id' => $row['id'],
                'title' => $row['title'],
                'subtitle' => $row['subtitle'],
                'status' => $row['status'],
                'is_child' => $row['is_child'],
                'itemDetails' => array()
            );
            if(!empty($homeService)){
                foreach($homeService as $subRow){
                    if($row['id'] == $subRow['hid']){
                        $result[$i]['itemDetails'][] = array(
                            'id' => $subRow['id'],
                            'cid' => $subRow['cid'],
                            'sid' => $subRow['sid'],
                            'img' => $subRow['img'],
                            'title' => $subRow['title'],
                            'description' => $subRow['description'],
                            'status' => $subRow['status'],
                            'count' => 1
                        );
                    }
                }
            }
            $i++;
        }
        $returnArr = array("status"=> "success", "message"=> "list of best offer", "data"=> $result);
    }else{
        $returnArr = array("status"=> "fail", "message"=> "no best offer", "data"=> $result);
    }
    echo json_encode($returnArr);
?>