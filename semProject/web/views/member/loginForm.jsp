<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String msg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main/style.css">
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
	/* color: #404040; */
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

.form-signin input[type=email], .form-signin input[type=password],
.form-signin input[type=text], .form-signin button {
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

p, label {
	text-align: center;
	font-weight: 400;
	color: rgba(0, 0, 0, 0.54);
}
.error {
    margin-bottom:10px;
}
.error-text {
    color:red;
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
<!-- loginForm에서 앞으로 구현해야 할 부분 
     1.kakao naver 로그인 api -->
	<div>
		<%@ include file="../common/headBar.jsp"%>
	</div>
		<div class="container">
			<h2>이메일 로그인</h2>
			<form class="form-signin" action="<%=request.getContextPath()%>/login.me" method="post">
				<span id="reauth-email" class="reauth-email"></span> 
				<input type="email" name="email" class="form-control" placeholder="이메일 아이디" autofocus required>
				
				<input type="password" id="inputPassword" name="userPwd" class="form-control" placeholder="비밀번호(영문, 숫자, 특수문자 포함 8자 이상)" maxlength="20" required>
				
				<div id="remember" class="checkbox">
					<label> <input type="checkbox" id="remember-me">
						아이디 저장
					</label>
				</div>
				<button class="form-control btn btn-primary" type="submit">로그인</button>
			</form>
			<!-- /form -->
			<div class="bottom-message">
				<p>
					아이디∙비밀번호를 잊으셨다면?<br>
					<a href="findId.jsp">아이디∙비밀번호 찾기</a>
				</p>
			</div>
			
			<div class="bottom-message"></div>
			<hr>
			<h2>간편 로그인</h2>
			
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
					아직 iCrowd 계정이 없나요? <a href="memberJoinForm.jsp">회원가입</a>
				</p>
			</div>
		</div>
		
		<div>
		<%@ include file="../common/footer.jsp"%>
	    </div>
	<!-- /container -->
	<script>
	    $(function(){
	    	<%if(msg != null){ %>
	    	    alert('<%= msg %>');
	    	<% } %>
	    });
	    
		$(document).ready(function() {
			// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
			var userInputId = getCookie("userInputId");
			$("input[name='email']").val(userInputId);

			if ($("input[name='email']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
				$("#remember-me").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			}

			$("#remember-me").change(function() { // 체크박스에 변화가 있다면,
				if ($("#remember-me").is(":checked")) { // ID 저장하기 체크했을 때,
					var userInputId = $("input[name='email']").val();
					setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
				} else { // ID 저장하기 체크 해제 시,
					deleteCookie("userInputId");
				}
			});

			// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
			$("input[name='email']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
				if ($("#remember-me").is(":checked")) { // ID 저장하기를 체크한 상태라면,
					var userInputId = $("input[name='email']").val();
					setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
				}
			});
		});

		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires="
							+ exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}

		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}

		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>
</body>
</html>