<?php
    class UserPushNotification{
        private $url = "https://fcm.googleapis.com/fcm/send";
        private $serverKey = "AAAAEz3K5AQ:APA91bHksTWACCJJ7oe5L3weqEEWJIpq_59RXdM2-KkukkuyJwNcmgqPyagMSD2_3KYuVFFS51Idthop3ZhLQYgukkEW8pxFn2f7t9GfqQiw8CIZdvgg00tkIMMYaD9mrGT8wYRmLyE-";
        private $title;
        private $token;
        private $body;
        private $sound;
        
        public function __construct($token, $title, $body, $sound){
            $this->token = $token;
            $this->title = $title;
            $this->body  = $body;
            $this->sound = $sound;
        }
        
        public function sendNotification() {
         $notification = array('title' =>$this->title, 'body' => $this->body, 'sound' => $this->sound, 'type' => '1');
         $arrayToSend = array('to' => $this->token, 'data' => $notification,'priority'=>'high');
         $json = json_encode($arrayToSend);
         
         $headers = array (
            'Authorization: key='. $this->serverKey,
            "Content-Type: application/json"
         );
         //$headers = array();
         //$headers[] = "Content-Type: application/json";
         //$headers[] = 'Authorization: key='. $serverKey;
         $ch = curl_init();
         curl_setopt($ch, CURLOPT_URL, $this->url);
         curl_setopt($ch, CURLOPT_POST, true);
         curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
         //curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
         curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
         //Send the request
         $response = curl_exec($ch);
         //Close request
         if ($response === FALSE) {
          die('FCM Send Error: ' . curl_error($ch));
         }
         curl_close($ch);
         return $response;
        }
    }
    
?>