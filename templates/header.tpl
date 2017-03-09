<html>
<head>
    <title>{$title} - {$Name}</title>
    <link rel="stylesheet" lang="text/css" href="styles.css"/>
    <script>
    function formSubmit()
    {
    var textbox = document.getElementsByName('flag')[0]
    textbox.value = 'Y';
    document.getElementById("updateForm").submit();
    
    }
    </script>
</head>
<body>
