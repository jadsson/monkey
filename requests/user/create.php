<?php 
    require_once '../../class/ModelUser.php';

    $d = new DataUser;
    $u = new ModelUser;

    if(isset($_POST['username'])) {
        $d->setUsername(addslashes(htmlentities($_POST['username']))); 
        $d->setEmail(addslashes(htmlentities($_POST['email'])));
        $d->setPass(addslashes(htmlentities($_POST['pass'])));
        $d->setImg(addslashes(htmlentities($_POST['img'])));

        if(!empty($d->getUsername()) && !empty($d->getEmail()) && !empty($d->getPass())) {
            
            $u->NewUser($d);
        }

    }
?>