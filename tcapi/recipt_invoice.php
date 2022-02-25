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
    $data        = array();
    $oid         =  $params['oid'];
    $uid         =  $params['uid'];
    $pid         =  $params['pid'];
    $total       = 0;
    $coustomerAddress = '';
    $data        = array();
    $number      =  $params['number'];
    $resultOne   = $mysqli->query("select * from tbl_user where id={$uid}")->fetch_assoc();
    $reultTwo    = $mysqli->query("select datetime from tbl_sub_order where oid={$oid} and uid={$uid} and pid={$pid} limit 1")->fetch_assoc();
    $resultThree = $mysqli->query("select * from partner where id={$pid}")->fetch_assoc();
    $reultFour   = $mysqli->query("select service, p_amt from tbl_sub_order where oid={$oid} and uid={$uid} and pid={$pid}");
    $reultFive   = $mysqli->query("select * from tbl_order where id={$oid} and uid={$uid}")->fetch_assoc();
    $resultSix   = $mysqli->query("select * from tbl_prtner_address where pid={$pid} and isPrimary=1")->fetch_assoc();
    if(!empty($resultSix)){
       $coustomerAddress = !empty($resultSix['house_no']) ? $resultSix['house_no']." " : null;
       $coustomerAddress .= !empty($resultSix['street_name']) ? $resultSix['street_name']." " : null;
       $coustomerAddress .= !empty($resultSix['location']) ? $resultSix['location']." " : null;
       $coustomerAddress .= !empty($resultSix['city']) ? $resultSix['city']." " : null;
       $coustomerAddress .= !empty($resultSix['pincode']) ? $resultSix['pincode']." " : null;
    }
    while($row = $reultFour->fetch_assoc()){
        $total  = $total + $row['p_amt'];
        $data[]   = array(
            "service" => $row['service'],
            "price" => $row['p_amt'],
        );
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div style="margin-bottom:10px;">
            <div class="item" style="float: left;">
                <img src="../assets/logo.png" width="30px">
                <div style="font-size:8px">
                    <span>P-132, LAKE TERRACE, KOLKATA, Kolkata, West Bengal, 700029</span><br/>
                    <span>GSTN: 19AAICD8002C1ZY</span>
                </div>
                <div style="font-size:10px; margin-top:10px;">
                    <div style="font-weight:bold"><?php echo !empty($resultOne['name'])? 'Customer Name' : 'Customer Mobile'; ?></div>
                    <div><?php echo !empty($resultOne['name'])? $resultOne['name'] : $resultOne['mobile']; ?></div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Customer GSTIN</div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Customer Address</div>
                    <div><?php echo !empty($reultFive['address'])? $reultFive['address'] : null; ?></div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Invoice No.</div>
                    <div><?php echo "PIN".date("Ydm").$number;?></div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Invoice Date & Time</div>
                    <div class="text"><?php echo (!empty($reultFive['odate']) && !empty($reultFive['otime']))? date('F d, Y',strtotime($reultFive['odate'])).' '.date('g:i a',strtotime($reultFive['otime'])): null;?></div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Order ID</div>
                    <div class="text"><?php echo $oid; ?></div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Order Date & Time</div>
                    <div class="text"><?php echo !empty($reultFive['datetime'])? date('F d, Y',strtotime($reultFive['datetime'])).' '.date('g:i a',strtotime($reultFive['datetime'])): null;?></div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
            </div>


            <div class="item" style="float: right; margin-top:12px;">
                <div style="font-size:8px;font-weight:bold;">RECEIPT(D&D PARTNER RECEIPT)</div>
                <div style="font-weight: bold;font-size: 10px;margin-top: 15px; margin-bottom: 15px;">DELIVERY SERVICE PROVIDER</div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Business GSTIN</div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Business Name</div>
                    <div class="text"><?php echo !empty($resultThree['name'])? $resultThree['name'] : null; ?></div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">Business Address</div>
                    <div><?php echo !empty($coustomerAddress)?$coustomerAddress:''; ?></div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div>
                <!-- <div style="font-size:10px; margin-top:6px;">
                    <div style="font-weight:bold">City</div>
                    <div>Kolkata</div>
                    <div style="border-top: 1px solid #000000; margin-top: 3px;"></div>
                </div> -->
            </div>
        </div>
        <div style="margin-top:280px;">
            <table style=" background-repeat:no-repeat; width:100%;margin:0;" cellpadding="0" cellspacing="0" border="0">
	            <thead style="width:100%;">
                    <tr style="width:100%;background:#978f8f40">
                        <td style="width:50%; text-align:left; padding:5px; font-size:10px; font-weight:bold;">Items</td>
                        <td style="width:25%;text-align:right; padding:5px; font-size:10px; font-weight:bold;"></td>
                        <td style="width:25%;text-align:right; padding:5px; font-size:10px; font-weight:bold;">Taxable Value</td>
                    </tr>
                <thead>
                <tbody style="width:100%;">
                <?php
                    if(!empty($data)):
                        foreach($data as $datum):
                ?>
                    <tr style="width:100%;">
                        <td style="width:50%; text-align:left; padding:5px; font-size:10px;"><?php echo $datum['service']?></td>
                        <td style="width:25%;text-align:right; padding:5px; font-size:10px;">Gross Amount</td>
                        <td style="width:25%;text-align:right; padding:5px; font-size:10px;">Rs. <?php echo number_format($datum['price'],2)?></td>
                    </tr>
                    <tr style="width:100%;">
                        <td style="width:50%; text-align:left; padding:5px; font-size:10px;">(SAC:9997)</td>
                        <td style="width:25%;text-align:right; padding:5px; font-size:10px;">Discount</td>
                        <td style="width:25%;text-align:right; padding:5px; font-size:10px;">Rs. 0</td>
                    </tr>
                <?php
                        endforeach;
                    endif;
                ?>
                </tbody>
                <tfoot style="width:100%;">
                    <tr style="width:100%;background:#978f8f40">
                        <td style="width:50%; text-align:left; padding:5px; font-size:10px; font-weight:bold;">Total Ammount</td>
                        <td style="width:25%; text-align:left; padding:5px; font-size:10px; font-weight:bold;"></td>
                        <td style="width:25%;text-align:right; padding:5px; font-size:10px; font-weight:bold;">Rs. <?php echo number_format($total,2); ?></td>
                    </tr>
                <tfoot>
                <tfoot style="width:100%;">
                    <tr style="width:100%;">
                        <td style="width:50%; text-align:left; padding:5px; font-size:10px; font-weight:bold;"></td>
                        <td style="width:25%; text-align:left; padding:5px; font-size:10px; font-weight:bold;"></td>
                        <td style="width:25%; text-align:left; padding:5px; font-size:10px; font-weight:bold;"></td>
                    </tr>
                    <tr style="width:100%;">
                        <td style="width:55%; text-align:left; padding:5px; font-size:8px;"></td>
                        <td style="width:25%; text-align:left; padding:5px; font-size:8px;"></td>
                        <td style="width:20%; text-align:center; padding:5px; font-size:8px;">Authorised by/Signature: </td>
                    </tr>
                    <tr style="width:100%;">
                        <td style="width:40%; text-align:left; padding:5px; font-size:8px;"></td>
                        <td style="width:25%; text-align:left; padding:5px; font-size:8px;"></td>
                        <td style="width:35%; text-align:left; padding:5px; font-size:8px;">Dudes & Damsels Online Salon Private Limited</td>
                    </tr>
                    <tr style="width:100%;">
                        <td style="width:40%; text-align:left; padding:5px; font-size:6px;">This is a computer generated bill, does not required any signature.</td>
                        <td style="width:25%; text-align:left; padding:5px; font-size:8px;"></td>
                        <td style="width:35%; text-align:right; padding:5px; font-size:8px;"></td>
                    </tr>
                <tfoot>
            </table>

        </div>
    </div>    
</body>
</html>