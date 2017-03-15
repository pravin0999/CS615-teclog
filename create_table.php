<?php
/* to create the table and setting up the database for the first time */
error_reporting(-1);
ini_set('display_errors', 'On');

require_once "database.php";
$db = new Db();
if($db->createTable())
    echo "<h3>Table created.</h3>";
?>