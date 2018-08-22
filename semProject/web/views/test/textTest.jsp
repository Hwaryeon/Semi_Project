<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>


<div id="summernote">Hello!</div>
 <button type="button" onclick="showContent();">작성</button>
    <div class="output"></div>



<script>
$(document).ready(function() {
	  $('#summernote').summernote();
	});
	
$('#summernote').summernote({
	  height: 300,                 // set editor height
	  minHeight: 400,             // set minimum height of editor
	  maxHeight: 600,             // set maximum height of editor
	  focus: true                  // set focus to editable area after initializing summernote
	});

function showContent() {
    $('.output').html($('#summernote').summernote('code'));
    
    var code = $('#summernote').summernote('code');
    
    console.log(code);
    
}

</script>

</body>
</html>