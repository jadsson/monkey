<?php 
    require_once 'ModelConect.php';

    class DataMsg {
        private $content, $userId, $chatId;

        function getContent()   { return $this->content; }
        function getUserId()    { return $this->userId; }
        function getChatId()    { return $this->chatId; }
        function setContent($c) { $this->content = $c; }
        function setUserId($u)  { $this->userId = $u; }
        function setChatId($ci) { $this->chatId = $ci; }
    }

    class ModelChat {
        function NewChat($f, $s) {
            $sql = "SELECT * FROM chat WHERE first_user = ? AND second_user = ? OR first_user = ? AND second_user = ?";
            $stmt = Conect::Con()->prepare($sql);
            $stmt->bindValue(1, $f);
            $stmt->bindValue(2, $s);
            $stmt->bindValue(3, $s);
            $stmt->bindValue(4, $f);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                return false;
            } else {
                $sql = "INSERT INTO chat (first_user, second_user) VALUES (?,?)";
                $stmt = Conect::Con()->prepare($sql);
                $stmt->bindValue(1, $f);
                $stmt->bindValue(2, $s);
                $stmt->execute();
            }
        }

        function ReadChatId($f, $s) {
            $sql = "SELECT id_chat FROM chat WHERE first_user = ? AND second_user = ? OR first_user = ? AND second_user = ?";
            $stmt = Conect::Con()->prepare($sql);
            $stmt->bindValue(1, $f);
            $stmt->bindValue(2, $s);
            $stmt->bindValue(3, $s);
            $stmt->bindValue(4, $f);
            $stmt->execute();

            if($stmt->rowCount() > 0) {
                $res = $stmt->fetch();
                $r = $res[0];
                return $r;
            }
            return false;
        }

        function NewMsg(DataMsg $p) {
            
            $sql = "INSERT INTO chat_msg (msg_content, fk_chat, who_send) VALUES (?,?,?)";
            $stmt = Conect::Con()->prepare($sql);
            $stmt->bindValue(1, $p->getContent());
            $stmt->bindValue(2, $p->getChatId());
            $stmt->bindValue(3, $p->getUserId());
            if($stmt->execute()) return true;

        }

        function ReadMsg($chatId) {
            $sql = "SELECT u.username, c.msg_content, c.date_msg, c.who_send 
            FROM chat_msg c
            JOIN chat ch ON ch.id_chat = '$chatId' AND ch.id_chat = c.fk_chat
            JOIN users u ON u.id_user = c.who_send ORDER BY c.date_msg
            ";
            
            $stmt = Conect::Con()->query($sql);
            
            if($stmt->rowCount() > 0) {
                $res = $stmt->fetchAll(PDO::FETCH_ASSOC);
                return $res;
            }
            return [];
        }

        function DellMsg() {

        }
    }