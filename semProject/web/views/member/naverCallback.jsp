<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("Dqteg4HFDV8maQaBiXyx", "http://localhost:8001/sp/views/member/naverCallback.jsp");
  // 접근 토큰 값 출력
  
  //alert(naver_id_login.oauthParams.access_token);
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  
		<%-- var email = naver_id_login.getProfileData('email');
		var nickName = naver_id_login.getProfileData('nickname');
	    var accessToken = naver_id_login.oauthParams.access_token;
	    var refreshToken = naver_id_login.oauthParams.refresh_token;
	    
        location.href="<%= request.getContextPath() %>/snsLogin.na?email=" + email  
	              + "&nickname=" + nickName + "&accessToken=" + accessToken; --%>
	              
	    //alert(naver_id_login.getProfileData('refresh_token'));
        $("#id").val(naver_id_login.getProfileData('id'));
		$("#email").val(naver_id_login.getProfileData('email'));
		$("#nickname").val(naver_id_login.getProfileData('nickname'));
		$("#accessToken").val(naver_id_login.oauthParams.access_token);
		$("#refreshToken").val();
		$("#loginSubmit").submit();
		self.close();
		
  }
</script>
<form id="loginSubmit" action="<%= request.getContextPath() %>/snsLogin.na" method="post" target="naverLogin">
<input type="hidden" id="id" name="id">
<input type="hidden" id="email" name="email">
<input type="hidden" id="nickname" name="nickname">
<input type="hidden" id="accessToken" name="accessToken">
<input type="hidden" id="refreshToken" name="refreshToken">
</form> 
</body>
</html>