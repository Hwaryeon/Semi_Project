<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.message.model.vo.*"%>
<%
	Message message = (Message)request.getAttribute("message");
	String type = (String)request.getAttribute("type");
%>
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Tabs - Vertical Tabs functionality</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
  $( function() {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  } );
  </script>
<style>
.ui-tabs-vertical {
	width: 64em;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 12em;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: right;
	width: 48em;
}
form {
  margin: 0 auto;
  width: 544px;
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
    width: 220px;

}

@media (min-width: 768px)
.col-sm-2 {
       width: 76px;
}

.form-group{
	margin-left: auto;
    margin-right: auto;
    width: 540px;

}
.form-horizontal{
	min-height:571px;
	min-width:600px;
}

#tabs ul li, #tabs ul li a{
	cursor:pointer;
}

</style>
</head>
<body onload="connection();" >
	<div id="tabs">
		<ul style="margin-top: 108px;">
			<li id="send_msg" style="cursor:pointer;"><a href="#tabs-1">받은 쪽지함</a></li>
			<li id="receive_msg"><a href="#tabs-2">보낸 쪽지함</a></li>
			<!-- <li><a href="#tabs-3">Aenean lacinia</a></li> -->
		</ul>
		<div id="tabs-1">
			<h2>메세지 상세보기</h2>
			<p>
			<form class="form-horizontal" id="msgId" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" >제목</label>
			    <div class="col-sm-10">
			      <input type="hidden" id="msgId" name="msgId" value="<%=message.getMsg_id()%>">
			      <input type="text" class="form-control" id="title" placeholder="<%=message.getTitle() %>" readonly >
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" style="width:84px;">보낸이</label>
			    <div class="col-sm-10">
			    <!-- 메시지 보내는 회원의 아이디 -->
				    <input type="hidden" id="user_id" name="user_id" value="<%=message.getUser_id() %>">
				   <%--  <% if(message.getReceive_Nickname() != null){ %>
														<input type="text" class="form-control" id="nickname" 
			      	name="nickname" placeholder="<%= message.getReceive_Nickname() %>" 
			      	value="<%= message.getReceive_Nickname() %>"
			      	readonly >
													<% }else if(message.getReceive_UserName() != null){ %>
													
													<input type="text" class="form-control" id="nickname" 
			      	name="nickname" placeholder="<%= message.getReceive_UserName() %>"
			      	value="<%= message.getReceive_Nickname() %>"
			      	 readonly >
														
													<% }else{ %>
														<input type="text" class="form-control" id="nickname" 
			      	name="nickname" placeholder="익명"
			      	value="<%= message.getReceive_Nickname() %>"
			      	 readonly >
													<% } %> --%>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" style="width:86px;">보낸시간</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="send_time" name="send_time" placeholder="<%=message.getSend_date() %>" readonly >
			    </div>
			  </div>
			  
			  
			   <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" style="width:86px;">문의내용</label>
			    <div class="col-sm-10">
			      <textarea style="resize: none;" id="msg" name="msg" class="form-control" rows="5" placeholder="<%=message.getMsg() %>" readonly ></textarea>
			    </div>
			  </div>
			  
			  <div  id="msgBu">
			    <div class="col-sm-offset-2 col-sm-10" style="width:230px;">
			      <button type="submit" class="btn btn-default" onclick="listMsg()">목록</button>
			      
			      <% if(Integer.parseInt(type) == 1) {  %>
				      <button  class="btn btn-default" onclick="reMsg()">답장</button>
				      <button class="btn btn-default" onclick="deleteMsg();">삭제</button>
			      <% } %>
			      
			    </div>
			  </div>
			</form>
			
			
			
			
			</p>
		</div>
	</div>

		
		<script>
		
		function listMsg(){
			$("#msgId").attr("action", "<%=request.getContextPath()%>/listMessage");
			$("#msgId").submit();
		}
		
		function reMsg(){
			
			$("#msgId").attr("action", "<%=request.getContextPath()%>/reMessage");
			$("#msgId").submit(); 
			
			
		}
		
			function deleteMsg(){
				/* var msgNo = document.getElementById('user_id').value; */
				
				<%-- location.href="<%=request.getContextPath()%>/deleteMessage?msgNo="+msgNo;
				submit(); --%>
				
				$("#msgId").attr("action", "<%=request.getContextPath()%>/deleteMessage");
				$("#msgId").submit();
			}
			
			
			 $( function() {
				 
				 $('#send_msg').click(function(){
					 
					 $("#msgId").attr("action", "<%=request.getContextPath()%>/listMessage");
						$("#msgId").submit();
				 });
				 
				 $('#receive_msg').click(function(){
					 /* document.getElementById('pageType').value(2); */
					 $("#msgId").attr("action", "<%=request.getContextPath()%>/listMessage?pageType=2");
						$("#msgId").submit();
				 });
				 
				 
				 
				  } );
		
		</script>
		<script>
			function closePopup(){

				connection();
				
				/* var result = document.getElementById('msgId').submit();
				
					alert("메시지 전송 완료"); */
				/* webSocket.close(); */
			}
			
			
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