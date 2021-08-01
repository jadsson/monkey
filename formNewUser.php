<?php 
    if(!isset($_SESSION)) session_start();
    if(isset($_SESSION['id'])) {
        header('location: index.php');
        exit;
    }
    require_once 'class/ModelUser.php';
    $d = new DataUser;
    $u = new ModelUser;
?>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/form.css">
    <title>Document</title>
</head>
<body>
<form action="" method="POST" class="forms">
    <h1>MONKEY CADASTRO</h1>
    <div class="card-imgs">
        <div>
            <h3>Escolha a imagem do teu perfil</h3>
            <img src="img/user/macaco.png" alt="">
            <img src="img/user/panda.jpg" alt="">
            <img src="img/user/gato.jpg" alt="">
            <img src="img/user/boi.jpg" alt="">
            <img src="img/user/gamba.jpg" alt="">
            <img src="img/user/coco.jpg" alt="">
        </div>
        <p id="visible-img-name"></p>
    </div>
    <input type="text" hidden name="img-name" class="value-with-js">
    
    <label for="username">NOME DE USUÁRIO ( SEM ESPAÇOS )</label>
    <input type="text" name="username" id="username" placeholder="Exemplo - JoaoBoi" required maxlength="20" autocomplete="off">
    
    <label for="email">EMAIL</label>
    <input type="text" name="email" id="email" placeholder="Exemplo - antonio@hotmail.com" required maxlength="70" autocomplete="off">
    
    <label for="pass">SENHA</label>
    <input type="password" name="pass" id="pass" required>
    
    <label for="conf">REPITA A SENHA</label>
    <input type="password" name="conf" id="conf" required>

    <input type="submit" name="submit" value="CADASTRAR" id="submit">

    <div class="link-form-page">
        <span>//</span><a href="index.php">ir pro login</a><span>//</span>
    </div>
    
    <div class="msg-erro"></div>

</form>

<script src="js/form.js"></script>
</body>
</html>
