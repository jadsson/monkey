<?php 
    require_once 'ModelConect.php';

    class DataUser {
        private $id, $type, $img, $username, $email, $pass;

        function getId()        { return $this->id; }
        function getType()      { return $this->type; }
        function getImg()       { return $this->img; }
        function getUsername()  { return $this->username; }
        function getEmail()     { return $this->email; }
        function getPass()      { return $this->pass; }
        function setId($id)     { $this->id = $id; }
        function setType($t)    { $this->type = $t; }
        function setImg($i)     { $this->img = $i; }
        function setUsername($u) { $this->username = $u; }
        function setEmail($e)   { $this->email = $e; }
        function setPass($p)    { $this->pass = $p; }
    }

    class ModelUser {

        function NewUser(DataUser $p) {

            /**
             * retorna nome de usuário ou email
             * 
             * utilizado pra validar o formulário
             */
            function returnError($n) {
                echo json_encode($n);
            }
            /**
             * retorna ok
             */
            function returnOk() {
                echo json_encode('ok');
            }

            $sql = "SELECT * FROM users WHERE username = ?";
            $stmt = Conect::Con()->prepare($sql);
            $stmt->bindValue(1, $p->getUsername());
            $stmt->execute();

            if($stmt->rowCount() > 0) {

                returnError($p->getUsername());
                return false;

            } else {

                $nsql = "SELECT * FROM users WHERE email = ?";
                $nstmt = Conect::Con()->prepare($nsql);
                $nstmt->bindValue(1, $p->getEmail());
                $nstmt->execute();
                
                if($nstmt->rowCount() > 0) {

                    returnError($p->getEmail());
                    return false;

                } else {
                    
                    $isql = "INSERT INTO users (perfil_img, username, email, pass) VALUES (?,?,?,?)";
                    $istmt = Conect::Con()->prepare($isql);
                    $istmt->bindValue(1, $p->getImg());
                    $istmt->bindValue(2, $p->getUsername());
                    $istmt->bindValue(3, $p->getEmail());
                    $istmt->bindValue(4, password_hash($p->getPass(), PASSWORD_DEFAULT));
                    if($istmt->execute()){

                        returnOk();
                        return true;
                    }

                }
            }
        }

        function UserLogin($u, $s) {

            $sql = "SELECT * FROM users WHERE username = '$u'";
            $stmt = Conect::Con()->query($sql);

            if($stmt->rowCount() > 0) {

                $return = $stmt->fetch(PDO::FETCH_ASSOC);

                if(password_verify($s, $return['pass'])) {

                    if(!isset($_SESSION)) session_start();

                    $_SESSION['id'] = $return['id_user'];
                    $_SESSION['username'] = $return['username'];
                    $_SESSION['email'] = $return['email'];
                    $_SESSION['img'] = $return['perfil_img'];

                    return true;
                } else {
                    echo "<script>alert('senha incorreta')</script>";
                }
            } else {
                echo "<script>alert('este usuário não existe')</script>";
            }
            return false;
        }

        function ShowOneUser($id) {

            $sql = "SELECT username, perfil_img  FROM users WHERE id_user = ?";
            $stmt = Conect::Con()->prepare($sql);
            $stmt->bindValue(1, $id);
            $stmt->execute();

            if($stmt->rowCount() > 0) {
                $r = $stmt->fetch(PDO::FETCH_ASSOC);
                return $r;
            }
            return [];
        }

        /**
         * Retorna todos os usuários menos o que tem o id do parâmetro
         */
        function ShowUsers($id) {
            $sql = "SELECT * FROM users WHERE id_user != '$id'";
            $stmt = Conect::Con()->query($sql);
            
            if($stmt->rowCount() > 0) {
                $r = $stmt->fetchAll(PDO::FETCH_ASSOC);
                return $r;
            }
            return [];
        }

        function SearchUser($like, $id) {
            $sql = "SELECT * FROM users WHERE username LIKE '%$like%' AND id_user != '$id'";
            $stmt = Conect::Con()->query($sql);
            if($stmt->rowCount() > 0) {
                $r = $stmt->fetchAll(PDO::FETCH_ASSOC);
                return $r;
            }
            return [];
        }

        function DellUser($id) {
            $sql = "DELETE FROM users WHERE id_user = '$id'";
            $stmt = Conect::Con()->query($sql);
        }
    }