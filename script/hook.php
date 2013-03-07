<?php

if ( isset($_SERVER["REMOTE_ADDR"]) ) { 
    $requestIP = $_SERVER["REMOTE_ADDR"];
} else if ( isset($_SERVER["HTTP_X_FORWARDED_FOR"]) ) { 
    $requestIP = $_SERVER["HTTP_X_FORWARDED_FOR"];
} else if ( isset($_SERVER["HTTP_CLIENT_IP"]) ) {
    $requestIP = $_SERVER["HTTP_CLIENT_IP"]; 
}

$validIPs = array(
    '207.97.227.253',
    '50.57.128.197',
    '180.171.174.178'.
    '50.57.231.61',
    '54.235.183.49',
    '54.235.183.23',
    '54.235.118.251',
    '54.235.120.57',
    '54.235.120.61',
    '54.235.120.62'
);

if (($payload = $_REQUEST['payload']) && in_array($validIps, $requestIP)) {
    $payload = json_decode($payload);
    $repository = $payload->repository->name;
    $docRoot = '/var/www/'.escapeshellcmd($repository);

    if (is_dir($docRoot)) {
        $command = 'cd '.$docRoot.' && git reset --hard HEAD && git pull';
        $output = shell_exec($command);
        file_put_contents("hook.log", "$repository: $output\r\n", FILE_APPEND);         
    }
}
