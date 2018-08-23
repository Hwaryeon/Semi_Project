<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*"%>
<%-- <% Member loginUser = (Member)session.getAttribute("loginUser"); %> --%>
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
	margin-bottom: 100px;
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

.form-resetPassword #inputEmail, .form-resetPassword #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 14px;
}

	.form-resetPassword input[type=password],
	.form-resetPassword button{
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

.form-resetPassword .form-control:focus {
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
</style>

</head>
<body>
    <div>
		 <%@ include file="../common/headBar.jsp"%>
	</div>
	
	<% if(loginUser != null){ %>
	
	
		<div class="container">
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;아이디 찾기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li role="presentation" class="active"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</ul>
			<br>
			<h3>비밀번호 재설정</h3>
			<label>개인정보 보호 및 원활한 사이트 이용을</label>
			<label>위해 새롭게 사용할 비밀번호를 입력해주세요.</label>
			<form class="form-resetPassword" action="<%=request.getContextPath()%>/updatePwd.me" method="post" onsubmit="return validate();">
			<br>
			<label> 새로운 비밀번호</label>
		    <input type="password" id="inputPassword" name="userPwd" class="form-control" placeholder="비밀번호(영문, 숫자, 특수문자 포함 8자 이상)" required autofocus>
		    <input type="hidden" name="email" value="<%= loginUser.getEmail() %>">
		    <div class="error-password">
					<label style="color: red; font-style: italic;">영문,숫자,특수문자
						포함 8자 이상 입력 바랍니다.</label>
		    </div>
		    
		    <input type="password" id="inputPassword2" class="form-control" placeholder="비밀번호 확인" required>
		    
		    <div class="error-password2">
					<label style="color: red; font-style: italic;">비밀번호가 일치하지
						않습니다.</label>
			</div>
			
			<button class="form-control btn btn-primary" type="submit">확인</button>
			</form>
			<!-- /form -->
		</div>
		<%} %>
    	
		<script>
		
		     $(function(){
		    	 
		    	 var userPwd = $("#inputPassword");
				 var userPwd2 = $("#inputPassword2");
				 
				 $(".error-password").hide();
				 $(".error-password2").hide();
				 
				//비밀번호 유효성 검사
				    var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*&])[A-Za-z\d$@$!%*&]{8,}$/;
				    userPwd.blur(function(){
				    	if (!regPwd.test(userPwd.val())) {
					    	$(".error-password").show();
							userPwd.select();
						}else{
							$(".error-password").hide();
						}
				    })
				    
	                //비밀번호 확인란 일치 검사
				    userPwd2.blur(function(){
				    	if (userPwd.val() != userPwd2.val()) {
					    	$(".error-password2").show();
							userPwd2.select();
						}else{
							$(".error-password2").hide();
						}
				    })
		     })
		     
		     function validate(){
				
				if($(".error-password").is(':visible')){
					return false;
				}else if($(".error-password2").is(':visible')){
					return false;
				}
					
			     return true;
			}
		</script>
   
	<!-- /container -->
    <div>
		<%@ include file="../common/footer.jsp"%>
	    </div>

</body>
</html>