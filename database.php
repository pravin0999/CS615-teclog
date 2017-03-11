<?php

class Db {
    /* credentials for database access  */
    protected $con;
    private $host = "us-cdbr-azure-southcentral-f.cloudapp.net";
    private $user = "bb2888a2afc292";
    private $pwd = "63fbe536";
    private $db = "db-4244f585-ae0a;Data Source=us-cdbr-azure-southcentral-f.cloudapp.net;User Id=bb2888a2afc292;Password=63fbe536";
    
    //Creates a PDO conection & sets error mode to exceptions
    public function __construct(){
    
        try { 
            $this->con = new PDO("mysql:host=$this->host;dbname=$this->db", $this->user, $this->pwd); 
            $this->con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
            $this->con->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        } 
        catch(PDOException $e) { 
            echo $e->getMessage();
        }
        
    }
    
    //sets the datab to null
    public function disconnect() {
        
        $this->con = null;
        
    }
    //creates table "notes" in the database
    public function createTable() {
        try {
            $sql = "CREATE TABLE IF NOT EXISTS notes (
                       id INT(11) AUTO_INCREMENT,
                       last_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       content text,
                       PRIMARY KEY(id)
                    );";
            $this->con->query($sql);
            return true;
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    //deletes the table
    public function dropTable() {
        try {
            $sql = "DROP TABLE notes;";
            $this->con->query($sql);
            return true;
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    //insert a new note in the table
    public function createNote($content) {
        try {
            $query = $this->con->prepare("INSERT INTO notes (content) VALUES (:content);");
            $query->bindParam(':content', $content);
            $query->execute();
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    //retrive a note from the table
    public function getNotes() {
        try{
            $query = $this->con->prepare("SELECT * FROM notes ORDER BY last_modified DESC;");
            $query->execute();
            return $query->fetchAll();
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    // gets notes with minimum-id from the table
    public function getMinId() {
        try{
            $query = $this->con->prepare("SELECT min(id) FROM notes;");
            $query->execute();
            return $query->fetch()[0];
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    //gets notes with maximum-id from the table
    public function getMaxId() {
        try{       
            $query = $this->con->prepare("SELECT max(id) FROM notes;");
            $query->execute();
            return $query->fetch()[0];
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    //checking if the id for the note exists
    public function isValid($id) {
        try{
            $query = $this->con->prepare("SELECT * FROM notes WHERE id = :id;");
            $query->bindParam(':id', $id);
            $query->execute();
            return count($query->fetchAll()) > 0;
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    //delete a note with a given id
    public function deleteNote($id) {
        try{          
            $query = $this->con->prepare("DELETE FROM notes WHERE id = :id;");
            $query->bindParam(':id', $id);
            $query->execute();
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    //update a notes with a content which matches a particular id
    public function updateNote($id, $newContent) {
        try{
            $query = $this->con->prepare("UPDATE notes
                                           SET content = :content,
                                               last_modified = CURRENT_TIMESTAMP
                                           WHERE id = :id");
            $query->bindParam(':id', $id);
            $query->bindParam(':content', $newContent);
            $query->execute();
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    
}
?>