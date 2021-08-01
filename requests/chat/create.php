<?php 
    if(!isset($_SESSION)) session_start();
    require_once '../../class/ModelUser.php';
    require_once '../../class/ModelChat.php';

    $chat = new ModelChat;
    $user = new ModelUser;

    if(isset($_POST['friend'])) {

        $friend = $_POST['friend'];
        $my = $_SESSION['id'];

            $chat->NewChat($my, $friend);

            $showChat = $chat->ReadChatId($my, $friend);

            if($showChat) {
                print_r(json_encode($showChat));
            }
        
    }

?>