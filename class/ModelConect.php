<?php 

    class Conect {
        private static $i;
        
        static function Con() {
            if(!isset(self::$i)) {
                try {
                    self::$i = new PDO('mysql: host=localhost; dbname=fetch_chat', 'root', 'root');
                } catch (Exception $e) {
                    echo "Erro: ".$e->getMessage();
                    exit;
                }
            }
            return self::$i;
        }
    }
