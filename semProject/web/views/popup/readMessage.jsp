<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.message.model.vo.*"%>
<%
	Message message = (Message)request.getAttribute("message");

%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>메세지 읽기</title>
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
    width: 220px;

}

</style>
</head>
<body>

		<!-- <h4 id="top_h4">문의사항을 남겨주시면 <br>최대한 빨리 이메일로 답변을 드리겠습니다.</h4> -->
	<br>
		<form class="form-horizontal" id="msgId" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" style="width:106px;">메시지 제목</label>
			    <div class="col-sm-10">
			      <input type="hidden" id="msgId" name="msgId" value="<%=message.getMsg_id()%>">
			      <input type="text" class="form-control" id="title" placeholder="<%=message.getTitle() %>" readonly >
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label" style="width: 76px;">보낸이</label>
			    <div class="col-sm-10">
			    <!-- 메시지 보내는 회원의 아이디 -->
				    <input type="hidden" id="user_id" name="user_id" value="<%=message.getUser_id() %>">
			      <input type="text" class="form-control" id="nickname" name="nickname" placeholder="<%=message.getUser_id() %>" readonly >
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">보낸시간</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="send_time" name="send_time" placeholder="<%=message.getSend_date() %>" readonly >
			    </div>
			  </div>
			  
			  
			   <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">문의내용</label>
			    <div class="col-sm-10">
			      <textarea style="resize: none;" id="msg" name="msg" class="form-control" rows="5" placeholder="<%=message.getMsg() %>" readonly ></textarea>
			    </div>
			  </div>
			  
			  <div  id="msgBu">
			    <div class="col-sm-offset-2 col-sm-10" style="width:230px;">
			      <button type="submit" class="btn btn-default" onclick="listMsg()">목록</button>
			      <button  class="btn btn-default" onclick="reMsg()">답장</button>
			      <button class="btn btn-default" onclick="deleteMsg();">삭제</button>
			    </div>
			  </div>
			</form>
		
		
		
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
			
		
		
		</script>
		
</body>
</html>