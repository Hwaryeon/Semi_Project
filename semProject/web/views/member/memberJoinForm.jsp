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

<style>
.container {
	width: 100%;
	max-width: 400px;
	margin-top: 150px;
	margin-bottom: 100px;
	padding: 40px 40px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	border: 1px solid lightgray;
	border-radius: 10px;
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

.form-joinMember #inputEmail, .form-joinMember #inputNumber {
	direction: ltr;
	height: 44px;
	font-size: 14px;
}

.form-joinMember input[type=email], .form-joinMember input[type=text],
	.form-joinMember button {
	width: 100%;
	height: 35px;
	display: block;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

#submit {
	width: 60%;
	height: 40px;
	margin-left: auto;
	margin-right: auto;
}

.form-joinMember .form-control:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

p, label {
	text-align: center;
	font-weight: 400;
	color: rgba(0, 0, 0, 0.54);
}

#hidden1 label{
    color:green;
    font-style: italic;
}

#hidden2 label{
    color:red;
    font-style: italic;
}

#hidden3 label{
    color:red;
    font-style: italic;
}
.social-login{
   margin-top:20px;
}
.naver, .kakao{
    margin-left:auto;
    margin-right:auto;
    padding:3px;
}
</style>
</head>
<body>
<!-- memberJoinForm에서 앞으로 구현해야 할 부분
     1. kakao naver 회원가입 api(다시 제대로 구현할 것인가)
     2. 인증 유효시간 구현-->
     
	<div>
		<%@ include file="../common/headBar.jsp"%>
	</div>

	<div class="container">
		<h2>이메일 회원가입</h2>
		<form class="form-joinMember" action="memberJoinForm2.jsp" method="post" onsubmit='return validate();'>

			<span id="reauth-email" class="reauth-email"></span>
			<table>
				<tr>
					<td>
					<input type="email" id="inputEmail" name="email" class="form-control" placeholder="이메일 아이디" required autofocus>
					</td>
					<td>
						<p>&nbsp;&nbsp;</p>
					</td>
					<td>
						<button type="button" class="form-control btn btn-default" id="recieveNumber">인증메일전송</button>  
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="hidden1">
							<label>인증번호가 메일로 발송 되었습니다.</label>
						</div>
						<div id="hidden2">
							<label>이미 가입된 계정입니다. 로그인 해주세요.</label>
						</div>
						<input type="hidden" id="authenticationNum">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="text" id="inputNumber" class="form-control" placeholder="인증번호" required>
					</td>
				</tr>
			</table>
			<div id="hidden3">
							<label>인증 번호가 일치하지 않습니다. 확인해주세요.</label>
			</div>
			<button class="form-control btn btn-primary" type="submit">인증하기</button>

		</form>
		<!-- /form -->
		
		<hr>
		<h2>간편 회원가입</h2>
		
		<div class="social-login" align="center">
			<div class="naver" align="center">
				<%@ include file="naverLogin.jsp"%>
			</div>
			<div class="kakao"></div>
			<%@ include file="kakaoLogin.jsp"%>
		</div>
		<br>
		<div class="bottom-message">
			<p>
				이미 계정이 있으신가요?<br>
				<a href="<%=request.getContextPath() %>/loginForm.jsp">기존 계정으로 로그인</a>
			</p>
		</div>
	</div>
	<div>
		<%@ include file="../common/footer.jsp"%>
	    </div>
	
    <script>
        
    $(function(){
    	$("#hidden1").hide();
    	$("#hidden2").hide();
    	$("#hidden3").hide();
    	
    	$("#recieveNumber").click(function(){
    		$("#hidden1").hide();
        	$("#hidden2").hide();
        	
    		$.ajax({
    			url:"<%= request.getContextPath()%>/joinMail.me",
    			data:{email:$("#inputEmail").val()},
           		type:"get",
           		success:function(data){
          			console.log("성공");
          			if(data == 2){
          			    $("#hidden2").show();
          			}else{
          				$("#hidden1").show();
          				$("#authenticationNum").val(data);
          			}
          			
          		 },
          		 error:function(data){
       				console.log("실패");
       			}
    		});
    	});
    	
    });
        
    function validate(){
    	$("#hidden3").hide();
    	
    	var inputNumber = $("#inputNumber").val();
    	var authenticationNum = $("#authenticationNum").val();
    	var trim = $.trim(authenticationNum);
    	
    	console.log(trim);
    	
    	if(inputNumber != trim){
    		//console.log("왜오니");
    		$("#hidden3").show();
    		return false;
    	}
    	return true;
    }
    </script>

</body>
</html>