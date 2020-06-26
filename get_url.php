<?php
$temp = file_get_contents("http://127.0.0.1:4040/api/tunnels");
$re = '/https:\/\/[0-9a-z]*\.ngrok.io/';
preg_match($re,$temp,$matches);
echo($matches[0]);
?>