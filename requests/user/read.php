<?php 
    if(!isset($_SESSION)) session_start();
    require_once '../../class/ModelUser.php';
    $users = new ModelUser;

    if(!isset($_SESSION['id'])) {
        print_r(json_encode(['monkey']));
    } else {
        print_r(json_encode($users->ShowUsers($_SESSION['id'])));
    }
