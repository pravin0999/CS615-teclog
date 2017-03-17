<?php
error_reporting(-1);
ini_set('display_errors', 'On');

require_once "lib/Smarty.class.php";
require_once "database.php";

//connect to our db
$db = new Db();

if(isset($_COOKIE['ACTIVE_NOTE_ID'])) {
    if(!$db->isValid($_COOKIE['ACTIVE_NOTE_ID'])) {
        setcookie("ACTIVE_NOTE_ID", $db->getMaxId());
        $activeNoteId = $db->getMaxId();
    } else {
        $activeNoteId = $_COOKIE['ACTIVE_NOTE_ID'];
    }
}


if(isset($_REQUEST['action'])) {
    switch($_REQUEST['action']) {
        case 'delete':
        /*triggered when the user deletes a notes and the system deletes the corresponding notes from the database*/
            $db->deleteNote($activeNoteId);
            $newId = $db->getMaxId();
            setcookie("ACTIVE_NOTE_ID", $newId);
            $activeNoteId = $newId;
            break;
        /* to save the notes, when the user saves them*/
        case 'update':
            $db->updateNote($_COOKIE['ACTIVE_NOTE_ID'], $_REQUEST['content']);
            //ini_set('SMTP','myserver');
            //ini_set('smtp_port',25);
            //ini_set('sendmail_from','pravinkumar0999@gmail.com')
            $content = $_REQUEST['content'];
            $admin_email = $_REQUEST['email'];
            $email = 'pravinkumar0999@gmail.com';
            $flag = $_REQUEST['flag'];
            $subject = 'mynotes';
            //echo $content;
            
            /* email is sent when the user clicks send button */
            /*if($flag == 'Y'){

                mail($admin_email, "$subject", $content, "From:" . $email);
            } */ 
            
            break;
        case 'new':
        /* creating a new notes, when the user clicks on new button */
            $db->createNote("New note.");
            $newId = $db->getMaxId();
            setcookie("ACTIVE_NOTE_ID", $newId);
            $activeNoteId = $newId;
            break;
        /* search for the corresponding notes */
        case 'navigate':
            setcookie("ACTIVE_NOTE_ID", $_REQUEST['id']);
            $activeNoteId = $_REQUEST['id'];
            break;
    }
}


$template = new Smarty();

if(isset($activeNoteId))
    $template->assign("ACTIVE_NOTE_ID", $activeNoteId);
$template->assign("notes", $db->getNotes());
$template->display('index.tpl');

//disconnect 
$db->disconnect();
?>