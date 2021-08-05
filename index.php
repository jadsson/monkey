<?php 
    if(!isset($_SESSION)) session_start();

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/form.css">
    <title>AJAX CHAT</title>
</head>
<body>
    
    <section id="content">
        <div class="top">
            <div>
                <h1>MONKEY</h1>
            </div>

            <div class="menu">

                <?php if(isset($_SESSION['id'])) { ?>

                    <form action="" id="form-search">
                        <div class="form-div">
                            <input type="text" name="busca" id="input" class="input-search" placeholder="Buscar usuário">
                            <button type="submit" id="button" class="btn-search"><img src="img/icon/search_black_24dp.svg" alt=""></button>
                        </div>

                        <div class="search-users-div">

                        </div>
                    </form>


                    <a href="sair.php">
                        <img src="img/icon/logout_white_24dp.svg" alt="logout icon" class="logout">
                    </a>

                <?php } ?>

            </div>
        </div>


        <div class="body">
            <!-- se não há sessão é mostrada a página de login  -->
            <?php 
                if(!isset($_SESSION['id'])) {
                    require_once 'login.php';

                } else {
                    require_once 'chat.php';
                }

            ?>
        </div>

    </section>

    <script src="js/chat.js"></script>
</body>
</html>