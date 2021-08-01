<?php 
    if(!isset($_SESSION)) session_start();
    if(!isset($_SESSION['id'])) {
        header('location: ../index.php');
        exit;
    }

?>

    <!-- left side - friend list -->
    <section class="users">    

    </section>

    <!-- right side - chat -->
    <section class="chat">

        <div class="top-chat">
            <div class="you">
                <div class="you-content">
                    <img src="img/user/<?php echo $_SESSION['img'];?>" alt="">
                    <h3 class="myName"><?php echo $_SESSION['username']; ?></h3>
                </div>
            </div>

            <div class="reload-friend-chat">
                <!-- reload chat -->
                <div>
                    <abbr title="atualizar conversa">
                        <img src="img/icon/refresh_white_24dp.svg" class="reload-chat">
                    </abbr>
                </div>

                <!-- friend component -->
                <div class="friend">

                </div>

            </div>

        </div>
        <!-- msgs -->
        <div class="section-msg">
        
        </div>

        <div class="send-msg">
            <form action="" method="POST" class="form-msg">
                <div class="msg-form-div">

                    <input type="number" hidden class="input-chat-id">

                    <input type="text" name="busca" class="input-send" placeholder="Enviar mensagem" autocomplete="off">
                    <button type="submit" class="btn-send"><img src="img/icon/send_black_24dp.svg" alt=""></button>
                </div>
            </form>
        </div>

    </section>
    
