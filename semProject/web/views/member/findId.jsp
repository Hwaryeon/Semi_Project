<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

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
	/* just in case there no content*/
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

.form-findId #inputEmail, .form-findId #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 14px;
}

.form-findId input[type=text], .form-findId input[type=tel],
	.form-findId button {
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

.form-findId .form-control:focus {
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
			<li role="presentation" class="active"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;아이디
					찾기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li role="presentation"><a href="findPassword.jsp">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호
					찾기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		</ul>
		<form class="form-findId" action="<%=request.getContextPath()%>/selectOne.me" method="post" onsubmit="return validate();">
			<br> <label> 이름</label> <input type="text" id="inputName"
				name="userName" class="form-control" placeholder="이름을 입력하세요"
				maxlength="10" required autofocus>

			<div class="error-name">
				<label style="color: red; font-style: italic;">2글자 이상 한글만
					입력하실 수 있습니다.</label>
			</div>

			<label> 휴대폰 번호</label> <input type="tel" id="inputPhone" name="phone"
				class="form-control" placeholder="휴대폰 번호를 입력하세요('-'없이 입력)"
				maxlength="11" required>

			<div class="error-phone">
				<label style="color: red; font-style: italic;">숫자만 입력하실 수
					있습니다.</label>
			</div>

			<div class="error-phone2">
				<label style="color: red; font-style: italic;">휴대폰 번호는 최소
					10자리 이상입니다.</label>
			</div>

			<button class="form-control btn btn-primary" type="submit">확인</button>
		</form>
		<!-- /form -->
	</div>
	<!-- /container -->
	<div>
		<%@ include file="../common/footer.jsp"%>
	    </div>
	<script>
         $(function(){
        	 var userName = $("#inputName");
        	 var phone = $("#inputPhone");
        	 
        	 $(".error-name").hide();
        	 $(".error-phone").hide();
			 $(".error-phone2").hide();
			 
			//이름 유효성 검사
			 var regName = /^[가-힝]{2,}$/;
			    userName.blur(function() {
			    	if (!regName.test(userName.val())) {
				    	$(".error-name").show();
						userName.select();
					}else{
						$(".error-name").hide();
					}
			    }); 
			    
			  //휴대폰 번호 유효성 검사
			    phone.blur(function(){
			    	if (isNaN(phone.val())) {
				    	$(".error-phone").show();
						phone.select();
					}else{
						$(".error-phone").hide();
					}
			    	
			    	if (phone.val().length < 10) {
				    	$(".error-phone2").show();
						phone.select();
					}else{
						$(".error-phone2").hide();
					}
			    	
			    });
         })
         
         function validate(){
				
				if($(".error-name").is(':visible')){
					return false;
				}else if($(".error-phone").is(':visible')){
					return false;
				}else if($(".error-phone2").is(':visible')){
					return false;
				}
				
			     return true;
			}
    </script>

</body>
</html>