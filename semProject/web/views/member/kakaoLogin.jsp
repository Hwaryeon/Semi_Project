<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


</head>
<body>
<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('dcb5abf4c9dd11f3923f2dd46c0680c2');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        //alert(JSON.stringify(authObj));
        var accessToken=Kakao.Auth.getAccessToken();
        //alert(accessToken);
         Kakao.API.request({

       url: '/v1/user/me',

       
       success: function(res) {
    	 //alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
    	  
    	  <%-- location.href="<%= request.getContextPath() %>/snsLogin.ka?email=" + res.kaccount_email + 
			"&id=" + res.id + "&nickname=" + res.properties.nickname + "&accessToken=" + authObj.access_token
			+ "&refreshToken=" + authObj.refresh_token; 
			
    	  location.href="<%= request.getContextPath() %>/snsLogin.ka?res=" +JSON.stringify(res); --%> 
			$("#id").val(res.id);
			$("#email").val(res.kaccount_email);
			$("#nickname").val(res.properties.nickname);
			$("#accessToken").val(authObj.access_token);
			$("#refreshToken").val(authObj.refresh_token);
			
			$("#loginSubmit").submit();

             //alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

             //console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

             //console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)

             //console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 

                   
         // res.properties.nickname으로도 접근 가능 )

         //console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
   
             //alert(authObj.refresh_token);
             
           }

         })

      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
<form id="loginSubmit" action="<%= request.getContextPath() %>/snsLogin.ka" method="post">
<input type="hidden" id="id" name="id">
<input type="hidden" id="email" name="email">
<input type="hidden" id="nickname" name="nickname">
<input type="hidden" id="accessToken" name="accessToken">
<input type="hidden" id="refreshToken" name="refreshToken">
</form>   

</body>
</html>