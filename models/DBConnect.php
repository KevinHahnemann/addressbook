<?php

/**
 * Class DBConnect
 *
 * very simple DB connection, not bothering to hide data
 */
class DBConnect
{
    private $host ='localhost';
    private $db = 'addressbook';
    private $username = 'root';
    private $password = '';

    protected $pdo;

    public function __construct()
    {
        $conStr = "host={$this->host};dbname={$this->db}";
        try {
            $this->pdo = new PDO( "mysql:$conStr", $this->username, $this->password );
            $this->pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
        }
        catch( PDOException $e ) {
            echo "error ". $e->getMessage();
        }
    }
}