<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*" %>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
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

	<h4>문의사항을 남겨주시면 <br>
	최대한 빨리 이메일로 답변을 드리겠습니다.</h4>

		<form id="msgId"action="<%=request.getContextPath() %>/sendMessage" method="post">
			   <div>
			    <label for="title">메세지 제목:</label>
			    <input type="text" id="title" name="title">
			  </div>
			  
			    <div>
			    <!-- 메시지 보내는 회원의 아이디 -->
			    
			    <% if(loginUser != null) { %>
				    <input type="hidden" id="user_id" name="user_id" value="<%= loginUser.getUserId() %>">
			  
			    <% } %>
			    <input type="text" id="user_id" name="user_id" value="<%= loginUser.getUserId() %>">
			  
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
					
					connection();
					
			}
			
		
		
		</script>
		
		<script>
			
			var webSocket = null;
			
			var $inputMessage = $('#inputMessage');
			
			function connection(){
				webSocket = new WebSocket('ws://localhost:8001'+
				'<%=request.getContextPath()%>/unicast');
				
				// 웹 소켓을 통해 연결이 이루어 질 때 동작할 메소드
				webSocket.onopen = function(event){
					
					
					// 웹 소켓을 통해 만든 채팅 서버에 참여한 내용을
					// 메시지로 전달
					// 내가 보낼 때에는 send / 서버로부터 받을 때에는 message
					
					webSocket.send("메세지 전송되냐??");
				};
				
				// 서버로부터 메시지를 전달 받을 때 동작하는 메소드
				webSocket.onmessage = function(event){
					onMessage(event);
				}
				
				// 서버에서 에러가 발생할 경우 동작할 메소드
				webSocket.onerror = function(event){
					onError(event);
				}
				
				// 서버와의 연결이 종료될 경우 동작하는 메소드
				webSocket.onclose = function(event){
					//onClose(event);
				}
			}
		
			function send(){
					
					webSocket.send("메세지 전송되냐??");
					
					$inputMessage.val("");
				
			}
			
			// 서버로부터 메시지를 받을 때 수행할 메소드
			function onMessage(event) {
				var message = event.data;
				
				/* // 보낸 사람의 ID
				var sender = message[0];
				
				// 전달한 내용
				var content = message[1]; */
				
				/* alert(message); */
			}
			
		</script>
		
</body>
</html>