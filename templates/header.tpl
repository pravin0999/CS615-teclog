<!-- Header template -->

<html>
<head>
    <title>{$title} - {$Name}</title>
    <link rel="stylesheet" lang="text/css" href="styles.css"/>
     <script src="//cloud.tinymce.com/stable/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>
	<!-- javascript function for submitting the form -->		
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
