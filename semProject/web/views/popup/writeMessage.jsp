<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*" %>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>메시지 보내기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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

#top_h4{
	margin-left: auto;
    margin-right: auto;
    width: 350px;
}
#msgBu{
	margin-left: auto;
    margin-right: auto;
    width: 134px;

}

</style>
</head>
<body>

	<h4 id="top_h4">문의사항을 남겨주시면 <br>최대한 빨리 이메일로 답변을 드리겠습니다.</h4>

		<form class="form-horizontal" id="msgId"action="<%=request.getContextPath() %>/sendMessage" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" style="width:106px;">메시지 제목</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title" name="title" placeholder="제목">
			    </div>
			  </div>
			  
			  <div>
			    <!-- 메시지 보내는 회원의 아이디 -->
			    <% if(loginUser != null) { %>
				    <input type="hidden" id="user_id" name="user_id" value="<%= loginUser.getUserId() %>">
			    <% } %>
			  
			    </div>
			  
			   <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">문의내용</label>
			    <div class="col-sm-10">
			      <textarea style="resize: none;" id="msg" name="msg" class="form-control" rows="5" placeholder="내용"></textarea>
			    </div>
			  </div>
			  
			  <div class="form-group" id="msgBu">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default" onclick="closePopup();">보내기</button>
			    </div>
			  </div>
			</form>
		
		
		
		<script>
			function closePopup(){
				connection();
			}
			
			
			var webSocket = null;
			
			var $inputMessage = $('#inputMessage');
			
			function connection(){
				webSocket = new WebSocket('ws://localhost:8001'+
				'<%=request.getContextPath()%>/unicast');
				
				webSocket.onopen = function(event){
					
					webSocket.send("메세지 전송");
					/* popClose(); */
					alert("쪽지 전송하였습니다.");
					window.close();
				};
				
				webSocket.onmessage = function(event){
					onMessage(event);
				}
				
				webSocket.onerror = function(event){
					onError(event);
				}
				
				webSocket.onclose = function(event){
					//onClose(event);
				}
			}
		
			function send(){
					
					webSocket.send("메세지 전송");
					
					$inputMessage.val("");
					
					popClose();
				
			}
			
			// 서버로부터 메시지를 받을 때 수행할 메소드
			function onMessage(event) {
				var message = event.data;
				
			}
			
			function popClose(){
				
				window.close();
			}
			
		</script>
		
</body>
</html>