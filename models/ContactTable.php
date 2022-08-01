<?php
require_once 'DBConnect.php';

/**
 * Class GalleryTable
 *
 * Model for handling Contacts Table
 * get all
 * insert
 * delete
 */
class ContactTable extends DBConnect
{
    public function getAllEntries($id = 0)
    {
        if($id == 0) {
            return null;
        } else {
            $sql = 'SELECT * FROM `contacts` WHERE user_id = '.$id;

            $results = [];

            foreach ($this->pdo->query($sql) as $row) {
                array_push($results, $row);
            }

            return $results;
        }

    }

    public function add($contact) {

        $result = $this->pdo->prepare("INSERT INTO `contacts`(`user_id`, `first_name`, `last_name`, `email`, `phone`, `address1`, `address2`, `city`, `zipcode`, `notes`, `contact_group`) 
                                        VALUES (:user_id, :first_name, :last_name, :email, :phone, :address1, :address2, :city, :zipcode, :notes, :contact_group)");

        $this->bindParams($result, $contact);
        $result->bindValue(':user_id', $_SESSION['user']['id'], PDO::PARAM_INT);

        $result->execute();

        return true;
    }

    public function edit($contact) {

        $result = $this->pdo->prepare("UPDATE `contacts` SET
                    `first_name` = :first_name, 
                    `last_name` = :last_name, 
                    `email` = :email, 
                    `phone` = :phone, 
                    `address1` = :address1, 
                    `address2` = :address2, 
                    `city` = :city, 
                    `zipcode` = :zipcode, 
                    `notes` = :notes, 
                    `contact_group` = :contact_group
                    WHERE id = :id 
                    ");

        $this->bindParams($result, $contact);
        $result->bindValue(':id', $contact['id'], PDO::PARAM_INT);

        $result->execute();

        return true;
    }

    public function delete($id) {
        $result = $this->pdo->prepare('DELETE FROM `contacts` WHERE `id` = :id');

        $result->bindValue(':id', $id, PDO::PARAM_INT);

        $result->execute();

        return true;
    }

    private function bindParams($result, $contact) {
        $result->bindValue(':first_name', $contact['first_name'], PDO::PARAM_STR);
        $result->bindValue(':last_name', $contact['last_name'], PDO::PARAM_STR);
        $result->bindValue(':email', $contact['email'], PDO::PARAM_STR);
        $result->bindValue(':phone', $contact['phone'], PDO::PARAM_STR);
        $result->bindValue(':address1', $contact['address1'], PDO::PARAM_STR);
        $result->bindValue(':address2', $contact['address2'], PDO::PARAM_STR);
        $result->bindValue(':city', $contact['city'], PDO::PARAM_STR);
        $result->bindValue(':zipcode', $contact['zipcode'], PDO::PARAM_STR);
        $result->bindValue(':notes', $contact['notes'], PDO::PARAM_STR);
        $result->bindValue(':contact_group', $contact['contact_group'], PDO::PARAM_STR);
    }
}