<?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:POST');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);
    $data = json_decode(file_get_contents('php://input'), true);
    $sid = $_POST['sid'];
    $returnArr = array();
    
    $child=array();
    $ervices=array();
    $data=array();
    


    if($sid == ''){
	    $returnArr = array("status"=> "fail", "message"=> "sid id required", "data"=> "Something Went wrong  try again !");
    }else{
            $queryOne = $mysqli->query("select * from tbl_child where status=1 and sid=".$sid);
            while($row = $queryOne->fetch_assoc()){
                $child[] = $row;
            }
            
            $queryTwo = $mysqli->query("select * from tbl_child_service where status=1 and child_id in (select id from tbl_child where status=1 and sid={$sid})");
            while($row = $queryTwo->fetch_assoc()){
                $ervices[] = $row;
            }
            $i=0;
            if(!empty($child)){
                foreach($child as $crow){
                    $data[$i] = array(
                        'id' => $crow['id'],
                        'cid' => $crow['cid'],
                        'sid' => $crow['sid'],
                        'title' => $crow['title'],
                        'description' => $crow['description'],
                        'price' => $crow['price'],
                        'img' => $crow['img'],
                        'status' => $crow['status'],
                        'is_child' => $crow['is_child'],
                        'count' => 0,
                        'itemDetails' => array()
                    );
                    if(!empty($ervices)){
                        foreach($ervices as $srow){
                            if($crow['id'] == $srow['child_id']){
                                $data[$i]['itemDetails'][] = array(
                                    'id' => $srow['id'],
                                    'img' => $srow['img'],
                                    'title' => $srow['title'],
                                    'description' => $srow['description'],
                                    'price' => $srow['price'],
                                    'status' => $srow['status'],
                                    'count' => 0
                                );
                            }
                        }
                    }
                    $i++;
                }
            }
    
        $returnArr = array("status"=> "success", "message"=> "successfully data found", "data"=> $data);
    }

    echo json_encode($returnArr);
?>