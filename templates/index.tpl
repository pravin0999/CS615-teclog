{include file="header.tpl" title="miNotes"}

<div id="container">
    <!-- providing the list of notes -->
    <div id="notes-list">
        <div id="notes-list-header" class="header">
            <span class="left">miNotes</span>
            <span class="right"><a href="index.php?action=new"><img src="images/CreateNote.png" alt="Create new note."></a></span>
        </div>
        <!-- iterating through the notes list -->
        {foreach from=$notes item=note}
            <div class="notes-list-item">
                <span class="notes-list-item-title"><a href="index.php?action=navigate&id={$note.id}" {if $note.id eq $ACTIVE_NOTE_ID}class='active'{/if}>{$note.content|truncate:20}</a></span>
                <span class="notes-list-item-timestamp">{$note.last_modified|date_format:"%b %d"}</span>
            </div>      
        {/foreach}
    </div>
   
    <!-- Displaying notepad -->                    
    <div id="notepad">
        <div id="notepad-header" class="header">

            <span><a href="#" onclick="document.getElementById('updateForm').submit();">Save</a></span>&nbsp;|&nbsp;<span><a href="index.php?action=delete">Delete</a></span> 
            &nbsp;|&nbsp; 
            <span class="right">Pravin kumar Lakshmanaperumal</span>
        </div>
        <div background-image: yellow>
            {foreach from=$notes item=note}
                {if $note.id eq $ACTIVE_NOTE_ID}
                <span id="timestamp">
                <!-- providing timestamp in the notes -->
                {$note.last_modified|date_format:"%B %d, %r"}</span>
                
                <form action="index.php" method="POST" id="updateForm">
                <!-- email textbox and send button where the user can mail the notes when they click on the send button, on providing email-id -->
                <input type="email" name="email" placeholder="enter yout email">
                    <button type="button" onclick="formSubmit()">send</button>
                    <!-- the text area where the user can write notes -->
                    <div id="tinymce-holder">
                        <textarea rows="20" cols="90" id="content" name="content" style="margin: 20px; border: 1px grey solid">{$note.content}</textarea>
  
                    </div>  
                    <!-- hidden values for our internal usage -->
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="flag" value="N"/>
                    
                </form>
                {/if}
            {/foreach}
        </div>
            

    </div>
</div>

{include file="footer.tpl"}
