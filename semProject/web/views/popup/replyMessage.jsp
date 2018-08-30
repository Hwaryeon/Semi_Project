<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.sp.message.model.vo.*, com.kh.sp.board.model.vo.*, com.kh.sp.member.model.vo.*"%>
<%

 String userId = (String)request.getAttribute("userId");
 String nickname = (String)request.getAttribute("nickname");
Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!doctype html>
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

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/message/message.css">

<script>
  $( function() {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  } );
  </script>
<style>
.ui-tabs-vertical {
	width: 55em;
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
	width: 40em;
}
form {
  margin: 0 auto;
  min-width: 400px;
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
    width: 300px;

}
.form-horizontal{
	min-height:571px;
}

#tabs ul li, #tabs ul li a{
	cursor:pointer;
}

</style>
</head>
<body>

	<div id="tabs">
		<ul style="margin-top: 108px;">
			<li id="send_msg"><a href="#tabs-1">받은 쪽지함</a></li>
			<li id="receive_msg"><a href="#tabs-2">보낸 쪽지함</a></li>
			<!-- <li><a href="#tabs-3">Aenean lacinia</a></li> -->
		</ul>
		<div id="tabs-1">
			<h2>답장 보내기</h2>
			<p>
			<form class="form-horizontal" id="msgId"action="<%=request.getContextPath() %>/reWriteMessage" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" style="width:106px;">제목</label>
			    <div class="col-sm-10" style="width:81%;">
			      <input type="text" class="form-control" id="title" name="title" placeholder="제목">
			    </div>
			  </div>
			  
			  <div>
			    <!-- 메시지 보내는 회원의 아이디 -->
				   <%--  <input type="hidden" id="user_id" name="user_id" value="<%=loginUser.getUserId()%>"> --%>
			    </div>
			    
			    <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">받는사람</label>
			    <div class="col-sm-10">
			    
			      <input type="text" class="form-control" value="<%=nickname %>" id="nickname" name="nickname" placeholder="<%=nickname %>" readonly >
			  	<input type="hidden" class="form-control" value="<%=userId %>" id="receive_id" name="receive_id"   >
			  
			  
			    </div>
			  </div>
			  
			   <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">문의내용</label>
			    <div class="col-sm-10">
			      <textarea style="resize: none;" id="msg" name="msg" class="form-control" rows="5" placeholder="내용"></textarea>
			    </div>
			  </div>
			  
			  <div class="form-group" id="msgBu">
			    <div class="col-sm-offset-2 col-sm-10">
			    <button type="submit" class="btn btn-default" onclick="listMsg()">목록</button>
			      <button type="submit" class="btn btn-default" onclick="closePopup();">보내기</button>
			    </div>
			  </div>
			  <input type="hidden" id="userId" name="userId" value="<%=loginUser.getUserId() %>" >
			</form>
			
			
			
			
			</p>
		</div>
	</div>

	<script>
	
		function listMsg(){
			$("#msgId").attr("action", "<%=request.getContextPath()%>/listMessage");
			$("#msgId").submit();
		}
		
		 $( function() {
			 
			 $('#send_msg').click(function(){
				 $("#msgId").attr("action", "<%=request.getContextPath()%>/listMessage");
					$("#msgId").submit();
			 });
			 
			 
			 
			 
			 
			  } );
		 
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