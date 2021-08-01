<?php 
    if(!isset($_SESSION)) session_start();
    if(!include_once 'class/ModelUser.php') {
        header('location: index.php');
        exit;
    }
    if(isset($_SESSION['id'])) {
        header('location: index.php');
        exit;
    }
    $model = new ModelUser;
?>

    <form action="" method="post" class="forms">
        <h1 style="padding-bottom: 40px;">FAÇA LOGIN PRA COMEÇAR</h1>
        
        <label for="username">Seu nome de usuário</label>
        <input type="text" name="username" autocomplete="off">
        
        <label for="pass">Sua senha</label>
        <input type="password" name="pass">

        <input type="submit" value="ENTRAR">

        <div class="link-form-page">
            <span>//</span><a href="formNewUser.php">cadastre-se</a><span>//</span>
        </div>
    </form>

<?php

if(isset($_POST['pass'])) {
    $username = addslashes(htmlentities($_POST['username']));
    $pass = addslashes(htmlentities($_POST['pass']));
    
    if(!empty($username) && !empty($pass)) {
        if($model->UserLogin($username, $pass)) {
            header('location: index.php');
        }
    }

}