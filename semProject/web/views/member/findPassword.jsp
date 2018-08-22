<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>

.container {
	width: 100%;
	max-width: 400px;
	margin-top: 150px;
	margin-bottom: 150px;
	padding: 40px 40px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	border: 1px solid lightgray;
	border-radius: 10px;
}


.card {
	padding: 20px 25px 30px;
	margin: 0 auto 25px;
	margin-top: 50px;
}

.reauth-email {
	display: block;
	color: #404040;
	line-height: 2;
	margin-bottom: 10px;
	font-size: 14px;
	text-align: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin #inputEmail, .form-signin #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 14px;
}

	.form-signin input[type=email],
	.form-signin button{
	width: 100%;
	height: 40px;
	display: block;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

#hidden1 label{
    color:green;
    font-style: italic;
}

#hidden2 label{
    color:red;
    font-style: italic;
}

p, label {
	text-align: center;
	font-weight: 400;
	color: rgba(0, 0, 0, 0.54);
}

</style>


</head>
<body>
	
	<div>
		<%@ include file="../common/headBar.jsp"%>
	</div>
	
		<div class="container">
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="findId.jsp">&nbsp;&nbsp;&nbsp;&nbsp;아이디 찾기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li role="presentation" class="active"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</ul>
			<br>
			<h4>임시비밀번호 받기</h4>
			<label>가입하셨던 이메일 계정을 입력하면,</label>
			<label>임시비밀번호를 이메일로 발송해드립니다.</label>
			<div class="form-signin">
			<br>
			<label> 이메일</label>
		    <input type="email" id="inputEmail" name="emailForPwd" class="form-control" placeholder="이메일을 입력하세요" required autofocus>
			<div id="hidden1">
					<label>임시 비밀번호가 메일로 발송 되었습니다. 임시 비밀번호로 로그인 후 비밀번호를 재설정 해주세요.</label>
			</div>
			<div id="hidden2">
					<label>입력 정보와 일치하는 이메일 계정이 없습니다. 입력정보를 다시 확인 해주세요.</label>
			</div>
			<button class="form-control btn btn-primary" id="findPwdBtn" type="button">확인</button>
			</div>
			<!-- /form -->
		</div>
	<!-- /container -->
        <div>
		<%@ include file="../common/footer.jsp"%>
	    </div>
     <script>
    $(function(){
    	
    	$("#hidden1").hide();
    	$("#hidden2").hide(); 
    	
    	$("#findPwdBtn").click(function(){
    		$("#hidden1").hide();
        	$("#hidden2").hide(); 
        	
       	 $.ajax({
       		 url:"<%= request.getContextPath()%>/pwdMail.me",
       		 data:{email:$("#inputEmail").val()},
       		 type:"get",
       		 success:function(data){
       			 console.log("성공");
       			if(data==1){
           			$("#hidden1").show();
       			}else{
       				$("#hidden2").show();
       			}
       		 },
       		 error:function(data){
    				console.log("실패");
    			}
       	   });
        
        });
    });
     
     </script>

</body>
</html>