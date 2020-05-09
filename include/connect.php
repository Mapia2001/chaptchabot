<?php
/**
 * @author Emmanuel 
 */

class Connect {
    private $conn;

    // Connecting to database
    public function connect() {
        require_once 'config.php';
        
        // Connecting to mysql database
        $this->conn = new mysqli(HOST, USER, PASSWORD, DATABASE);     
        // return database handler
        return $this->conn;
    }
}

?>
