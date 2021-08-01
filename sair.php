<?php 
    if(!isset($_SESSION)) session_start();
    unset($_SESSION['id'], $_SESSION['username'], $_SESSION['email']);
    echo "<script>alert('sua sessão foi encerrada')</script>";
    echo "<script>location.href = 'http://localhost/ajax/chat'</script>";