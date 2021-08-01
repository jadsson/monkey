<?php 
    if(!isset($_SESSION)) session_start();
    require_once '../../class/ModelUser.php';
    require_once '../../class/ModelChat.php';

    $chat = new ModelChat;
    $m = new DataMsg;
    $user = new ModelUser;

    if(isset($_POST['msg'])) {
        $m->setContent(addslashes(htmlentities($_POST['msg'])));
        $m->setChatId(addslashes(htmlentities($_POST['chat'])));
        $m->setUserId(addslashes(htmlentities($_SESSION['id'])));

        if($chat->NewMsg($m)) {
            echo json_encode('ok');
        }
    }

?>