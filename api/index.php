<?php

    header('Content-type: text/html; charset=UTF-8');
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");

    include_once 'class/rest.php';

    if(isset($_REQUEST)){

        if(empty($_REQUEST)){
            BemVindo();
        }else{
            $api = new Rest ();
            $api->inicialize();
        }
    }else{
        BemVindo();
    }
        
    function BemVindo(){
        echo "<h1>Bem Vindo API APRPBA</h1>";
    }
?>


