<?php 
    if(!isset($_SESSION)) session_start();
    require_once '../../class/ModelUser.php';
    $user = new ModelUser;
    print_r(json_encode($user->ShowOneUser($_POST['id'])));