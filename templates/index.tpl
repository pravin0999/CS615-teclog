{include file="header.tpl" title="miNotes"}

<div id="container">
    
    <div id="notes-list">
        <div id="notes-list-header" class="header">
            <span class="left">miNotes</span>
            <span class="right"><a href="index.php?action=new"><img src="images/CreateNote.png" alt="Create new note."></a></span>
        </div>
        {foreach from=$notes item=note}
            <div class="notes-list-item">
                <span class="notes-list-item-title"><a href="index.php?action=navigate&id={$note.id}" {if $note.id eq $ACTIVE_NOTE_ID}class='active'{/if}>{$note.content|truncate:20}</a></span>
                <span class="notes-list-item-timestamp">{$note.last_modified|date_format:"%b %d"}</span>
            </div>      
        {/foreach}
    </div>
   
                        
    <div id="notepad">
        <div id="notepad-header" class="header">

            <span><a href="#" onclick="document.getElementById('updateForm').submit();">Save</a></span>&nbsp;|&nbsp;<span><a href="index.php?action=delete">Delete</a></span> 
            &nbsp;|&nbsp;
            <span class="right">Pravin kumar Lakshmanaperumal</span>
        </div>
        <div background-image: yellow>
            {foreach from=$notes item=note}
                {if $note.id eq $ACTIVE_NOTE_ID}
                <span id="timestamp">{$note.last_modified|date_format:"%B %d, %r"}</span>
                
                <form action="index.php" method="POST" id="updateForm">
                    <div id="tinymce-holder">
                        <textarea rows="20" cols="90" id="content" name="content" style="margin: 20px; border: 1px grey solid">{$note.content}</textarea>

<div id="sample">
  <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script> <script type="text/javascript">
//<![CDATA[
  bkLib.onDomLoaded(function() {
        new nicEditor().panelInstance('area1');
        new nicEditor({fullPanel : true}).panelInstance('area2');
        new nicEditor({iconsPath : '../nicEditorIcons.gif'}).panelInstance('area3');
        new nicEditor({buttonList : ['fontSize','bold','italic','underline','strikeThrough','subscript','superscript','html','image']}).panelInstance('area4');
        new nicEditor({maxHeight : 100}).panelInstance('area5');
  });
  //]]>
  </script>
  <h4>
    Default (No Config Specified)
  </h4>
  <p>
    new nicEditor().panelInstance('area1');
  </p>
  <textarea cols="50" id="area1">
</textarea>
  <h4>
    All Available Buttons {fullPanel : true}
  </h4>
  <p>
    new nicEditor({fullPanel : true}).panelInstance('area2');
  </p>
  <textarea cols="60" id="area2">
Some Initial Content was in this textarea
</textarea>
  <h4>
    Change Path to Icon File {iconsPath : 'path/to/nicEditorIcons.gif'}
  </h4>
  <p>
    new nicEditor({iconsPath : 'nicEditorIcons.gif'}).panelInstance('area3');
  </p>
  <textarea cols="50" id="area3">
</textarea>
  <h4>
    Customize the Panel Buttons/Select List
  </h4>
  <p>
    {buttonList : ['fontSize','bold','italic','underline','strikeThrough','subscript','superscript']}
  </p>
  <textarea cols="50" id="area4">
HTML content default in textarea
</textarea>
  <h4>
    Set a maximum expansion size (maxHeight)
  </h4>
  <p>
    {maxHeight : 100}
  </p>
  <textarea style="height: 100px;" cols="50" id="area5">
HTML content default in textarea
</textarea>
</div>

                        
                    </div>  
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="flag" value="N"/>
                     <input type="email" name="email" placeholder="enter yout email">
                    <button type="button" onclick="formSubmit()">send</button>
                </form>
                {/if}
            {/foreach}
        </div>
            

    </div>
</div>

{include file="footer.tpl"}
