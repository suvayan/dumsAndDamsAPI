  <?php
    require_once (dirname( dirname(__FILE__) ).'/include/dbconfig.php');
    header('Content-type: application/json');
    header('Access-Control-Allow-Methods:GET');
    header('Access-Control-Allow-Origin:*');
    ini_set('display_errors', 1); 
    ini_set('display_startup_errors', 1); 
    error_reporting(E_ALL);

    $returnArr = array();

    $pid = $_POST['pid'];
    $items = array();
    $orders = array();
    $orderIds = array();
    $subOrderIds = array();

    if($pid == ' '){
        $returnArr = array("status"=> "fali", "message"=> "partner id is required", "data"=> "");
    }else{
        $sql = "select o.*, so.id as suborder_id, so.oid, so.service, so.status as suborder_status, so.count as so_count, so.total as so_total, so.gst as so_gst, so.subtotal as so_subtotal, so.pid as suborder_partner,so.rating, so.p_amt as so_p_amt, so.c_amt as so_c_amt, u.id as user_id, u.name as user_name, u.email, u.mobile, op.status as is_accept from  tbl_order o, tbl_sub_order so, temp_order_partner_tbl op, tbl_user u where so.oid=op.oid and so.oid=o.id and so.uid=u.id and op.pid={$pid}";
        $result = $mysqli->query($sql);
        if($result->num_rows){
            while($row = $result->fetch_assoc()){
                $items[] = $row;
            }

            if(!empty($items)){
                $i=0;
                foreach($items as $row){
                    if(!in_array($row['id'],$orderIds)){
                        array_push($orderIds, $row['id']);
                        $orders[$i] = array(
                            'user_id' => $row['user_id'],
                            'user_email' => $row['email'],
                            'user_mobile' => $row['mobile'],
                            'user_name' => $row['user_name'],
                            'order_address' => $row['address'],
                            'order_addon' => $row['add_on'],
                            'order_id' => $row['id'],
                            'odate' => $row['odate'],
                            'otime' => $row['otime'],
                            'o_status' => $row['o_status'],
                            'a_status' => $row['a_status'],
                            'o_tax' => $row['o_tax'],
                            'subtotal' => $row['subtotal'],
                            'p_method_id' => $row['p_method_id'],
                            'comment_reject' => $row['comment_reject'],
                            'lats' => $row['lats'],
                            'longs' => $row['longs'],
                            'is_accept' => $row['is_accept'],
                            'orderItems'  => array()
                        );
                        $j=0;
                        foreach($items as $data){
                            if($row['id'] == $data['oid']){
                                if(!in_array($data['suborder_id'],$subOrderIds)){
                                    array_push($subOrderIds, $data['suborder_id']);
                                    $orders[$i]['orderItems'][$j] = array(
                                        'suborder_id' => $data['suborder_id'],
                                        'service' => $data['service'],
                                        'suborder_count' => $data['so_count'],
                                        'suborder_total' => $data['so_total'],
                                        'suborder_gst' => $data['so_gst'],
                                        'suborder_subtotal' => $data['so_subtotal'],
                                        'suborder_service_charge' => $data['so_p_amt'],
                                        'suborder_other_charges' => $data['so_c_amt'],
                                        'suborder_status' => $data['suborder_status'],
                                        'suborder_partner' => $data['suborder_partner'],
                                        'suborder_rating' => $data['rating']
                                    ); 
                                }
                                $j++;
                            }
                        }
                        $i++;
                    }
                }
            }

            $returnArr = array("status"=> "success", "message"=> "partner's orders", "data"=> $orders);
        }else{
            $returnArr = array("status"=> "fali", "message"=> "you have no orders", "data"=> []);
        }
    }
    echo json_encode($returnArr);
?>