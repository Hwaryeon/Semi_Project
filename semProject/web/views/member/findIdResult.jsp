<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*"%>
<!DOCTYPE html>
<% Member m = (Member)request.getAttribute("m");%>
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

.form-findIdResult #inputEmail, .form-findIdResult #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 14px;
}

	.form-findIdResult input[type=email],
	.form-findIdResult button {
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

.form-findIdResult .form-control:focus {
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
		<div class="container">
			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;아이디 찾기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li role="presentation"><a href="views/member/findPassword.jsp">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</ul>
			<br>
			<% if(m != null){ %>
			<h4>회원 정보와 일치하는</h4>
			<h4>이메일 아이디는 다음과 같습니다.</h4>
			<label>만약, 비밀번호를 잊어버리셨다면</label>
			<label> 비밀번호 찾기 서비스를 이용해주세요.</label>
			<% }else{ %>
			<h4>회원 정보와 일치하는</h4>
			<h4>이메일 아이디가 없습니다.</h4>
			<label>입력하신 정보가 맞는지</label>
			<label> 다시 한 번 확인해주세요.</label>
			<% } %>
			<div class="form-findIdResult">
			<br>
			<label> 가입 이메일</label>
			<% if(m != null){ %>
			<input type="email" id="inputEmail" class="form-control" placeholder=<%= m.getEmail() %> readonly>
			<% }else{ %>
			<input type="email" id="inputEmail" class="form-control" placeholder="일치하는 이메일 아이디가 없습니다." readonly>
			<% } %>
			<button class="form-control btn btn-primary" onclick="location.href='views/member/loginForm.jsp'">로그인 하기</button>
			</div>
			<!-- /form -->
		</div>
	<!-- /container -->
	<div>
		<%@ include file="../common/footer.jsp"%>
	    </div>
	
</body>
</html>