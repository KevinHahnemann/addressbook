<?php
require_once 'DBConnect.php';

/**
 * Class UserTable
 *
 * Model for handling User Table
 */
class UserTable extends DBConnect
{
    public function getUser($email) {
        $sql = 'SELECT `id`, `user_name`,`user_email`,`password` FROM `user` WHERE `user_email` = "'.$email.'"';

        $results = [];

        foreach ($this->pdo->query($sql) as $row) {
            array_push($results, $row);
        }

        return $results;
    }
}