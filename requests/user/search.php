<?php 
    if(!isset($_SESSION)) session_start();
    require_once '../../class/ModelUser.php';
    $u = new ModelUser;

    $user = addslashes(htmlentities($_POST['search']));
    $id = $_SESSION['id'];
    print_r(json_encode($u->SearchUser($user, $id)));