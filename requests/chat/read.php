<?php 
    if(!isset($_SESSION)) session_start();
    require_once '../../class/ModelChat.php';

    $m = new ModelChat;

    if(isset($_POST['requestMessages'])) {
        
        $id = $_POST['requestMessages'];

        $msgs = $m->ReadMsg($id);

        if($msgs) {
            print_r(json_encode($msgs));
        }
        else{
            echo (json_encode(''));
        }
    }

?>