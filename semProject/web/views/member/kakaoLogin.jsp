<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<a onclick="kakao();"><img class="btn-img" src="<%= request.getContextPath() %>/images/member/kakao.png"></a>
<!-- <a id="kakao-login-btn" onclick="kakao();"></a> -->
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
function kakao(){

    Kakao.init('dcb5abf4c9dd11f3923f2dd46c0680c2');
  
    Kakao.Auth.loginForm({
      /* container: '#kakao-login-btn', */
      success: function(authObj) {
        //alert(JSON.stringify(authObj));
        var accessToken=Kakao.Auth.getAccessToken();
        //alert(accessToken);
         Kakao.API.request({

       url: '/v1/user/me',

       
       success: function(res) {
    	 //alert(JSON.stringify(res)); //<---- kakao.api.request 
    	  
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

             //alert(JSON.stringify(authObj)); //

             //console.log(res.id);//

             //console.log(res.kaccount_email);//

             //console.log(res.properties['nickname']);//

                   
         // res.properties.nickname;

         //console.log(authObj.access_token);//
   
             //alert(authObj.refresh_token);
             
           }

         })

      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
}
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