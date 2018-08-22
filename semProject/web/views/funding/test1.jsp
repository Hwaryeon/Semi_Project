<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
</head>
<body>
<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
<script>
$(function(){
	$('#button-add-file').click(addFileForm);
	$(document).on('click', '.button-delete-file', function(event) {
		$(this).parent().remove();
	});
});
var count = 0;
function addFileForm() {
	var html = "<div id='item_"+count+"'>";
	html += "<input type='file' name='fileup[]' />";
	html += "<button class='button-delete-file'>삭제</button></div>";
	count++;
	$("#my-form").append(html);
	
	console.log("count : " + count);
}

</script>
<button id='button-add-file'>파일 추가</button>
<form id='my-form'></form>


</body>
</html>