<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
form {
  margin: 0 auto;
  width: 400px;
  padding: 1em;
  border: 1px solid #CCC;
  border-radius: 1em;
}

div + div {
  margin-top: 1em;
}

label {
  display: inline-block;
  width: 90px;
  text-align: right;
}

input, textarea {
  font: 1em sans-serif;

  width: 300px;
  -moz-box-sizing: border-box;
       box-sizing: border-box;
  border: 1px solid #999;
}

input:focus, textarea:focus {
  border-color: #000;
}

textarea {
  vertical-align: top;
  height: 5em;
  resize: vertical;
}

.button {
  padding-left: 90px; 
  margin-left: auto;
  margin-right: auto;
  width: 100px;
}

button {
  margin-left: .5em;
}

</style>
</head>
<body>

	<h4>문의사항을 남겨주시면 최대한 빨리 이메일로 답변을 드리겠습니다.</h4>

		<form id="msgId"action="<%=request.getContextPath() %>/sendMessage" method="post">
			   <div>
			    <label for="title">메세지 제목:</label>
			    <input type="text" id="title" name="title">
			  </div>
			  
			    <div>
			    <!-- 메시지 보내는 회원의 아이디 -->
				    <input type="hidden" id="user_id" name="user_id" value="21">
			    </div>
			
			  <div>
			    <label for="msg"> 문의내용:</label>
			    <textarea style="resize: none;" id="msg" name="msg"></textarea>
			  </div>
			 
			  <div class="button">
			    <button type="submit" onclick="closePopup();">전송</button>
			  </div>
		</form>
		<script>
			function closePopup(){

				var result = document.getElementById('msgId').submit();
				
					alert("메시지 전송 완료");
					
					
					close2();
			}
			
			function close2(){
				window.close();
			}
		
		
		</script>
		
</body>
</html>