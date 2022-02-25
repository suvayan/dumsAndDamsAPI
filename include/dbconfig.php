
<?php
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
    try {
        $mysqli = new mysqli("localhost", "u333128179_dd", "Dude@123#", "u333128179_dudesndamsels");
        $mysqli->set_charset("utf8mb4");
    } catch(Exception $e) {
        error_log($e->getMessage());
    }
    //print_r($mysqli); 
    //date_default_timezone_set($set['timezone']);
?>