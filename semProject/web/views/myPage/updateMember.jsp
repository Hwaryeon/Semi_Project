<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
.cmntitle {
	margin-top: 10%;
}
.container {
	width: 100%;
	max-width: 400px;
	margin-top: 3%;
	margin-bottom: 100px;
	padding: 40px 40px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	border: 1px solid lightgray;
	border-radius: 10px;
}
.form-update input[name=userPwd], .form-update input[name=userPwd2],
.form-update input[name=userName], 
.form-update input[name=email], .form-update input[name=nickName], 
.form-update input[name=tel], .form-update button {
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

.form-update .form-control:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

#updateForm:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

.btn:hover {
	cursor: pointer;
}



label {
	font-weight: 400;
	color: rgba(0, 0, 0, 0.54);
}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp"%>
	<h2 align="center" class="cmntitle">회원정보 수정</h2>
	<div class="container">
		<form class="form-update" id="updateForm"
			action="<%=request.getContextPath() %>/update.me" method="post">
			<table align="center">
				<tr>
					<td><label>* 이메일</label></td>
					<td colspan="2"><input type="text" id="inputEmail" name="email"
						class="form-control"
						value="<%= loginUser.getEmail() %>" readonly></td>
				</tr>
				<tr>
					<td><label>* 이름</label></td>
					<td colspan="2"><input type="text" id="inputName" name="userName"
						class="form-control" 
						<% if(loginUser.getUserName() != null ) { %> 
						value="<%= loginUser.getUserName() %>" <% } %>>
					</td>
				</tr>
				<tr>
					<td><label>* 닉네임</label></td>
					<td colspan="2"><input type="text" id="inputNickName" name="nickName"
						class="form-control" value="<%= loginUser.getNickName() %>">
					</td>
				</tr>
				<tr>
					<td></td>
					<td id="error-nickName">
						<label style="color: red; font-style: italic; font-size: 10px;">
						이미 사용 중인 별명입니다.</label>
					</td>
				</tr>
				<tr>
					<td></td>
					<td id="error-nickName2">
						<label style="color: green; font-style: italic; font-size: 10px;">
						사용 가능한 별명입니다.</label>
					</td>
				</tr>
				<% if(loginUser.getPlatformType().equals("email")) { %>
				<tr>
					<td><label>* 비밀번호</label></td>
					<td colspan="2"><input type="password" name="userPwd"
						id="inputPassword" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="error-password">
							<label style="color: red; font-style: italic; font-size: 10px;">
							영문,숫자,특수문자(!@$%^&*만 허용)포함 8자 이상 입력 바랍니다.</label>
						</div>
					</td>
				</tr>
				<tr>
					<td><label>* 비밀번호 확인</label></td>
					<td colspan="2"><input type="password" name="userPwd2"
						id="inputPassword2" class="form-control"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">
						<div class="error-password2">
							<label style="color: red; font-style: italic; font-size: 12px;">
							비밀번호가 일치하지 않습니다.</label>
						</div>
					</td>
				</tr>
				<% } %>
				<tr>
					<td><label>연락처</label></td>
					<td>
						<input type="text" maxlength="11" name="tel" size="2"
						class="form-control" 
						<% if(loginUser.getPhone() != null) { %>
							value="<%=loginUser.getPhone()%>">
						<% } %>
					</td>
					<td><input type="hidden" name="userId"
						value="<%=loginUser.getUserId()%>" readonly></td>
					<td><input type="hidden" name="platformType"
						value="<%=loginUser.getPlatformType()%>" readonly></td>
				</tr>
			</table>
		</form>
		<br> <br>
		<div class="btns" align="center">
			<button class="btn update btn-primary" onclick="update();">수정하기</button>
			<% if(loginUser.getPlatformType().equals("email")) { %>
			<button class="btn delete btn-primary" onclick="deleteMember();">탈퇴하기</button>
			<% } %>
		</div>
	</div>
	<script>
		function deleteMember() {
			location.href = 'deleteMember.jsp';
		}
		function update() {
			console.log("11");
			$("#updateForm").submit();
		}
		
		var userPwd = $("#inputPassword");
		var userPwd2 = $("#inputPassword2");
		var nickName = $("#inputNickName");
		
		$(".error-password").hide();
	    $(".error-password2").hide();
	    $("#error-nickName").hide();
	    $("#error-nickName2").hide();
	    
		//비밀번호 유효성 검사
	    var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*&^])[A-Za-z\d$@$!%*&^]{8,}$/;
	    userPwd.blur(function(){
	    	if (!regPwd.test(userPwd.val())) {
		    	$(".error-password").show();
				userPwd.select();
			}else{
				$(".error-password").hide();
				
				if(userPwd.val() != null){
		    		if (userPwd.val() != userPwd2.val()) {
				    	$(".error-password2").show();
						userPwd2.select();
					}else{
						$(".error-password2").hide();
					}
		    	}
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
	    
	    //닉네임 중복 확인 (ajax)
			    
		nickName.blur(function(){
		$("#error-nickName").hide();
		$("#error-nickName2").hide();
			    	  
		var nickName = $("#inputNickName").val();
			        
		$.ajax({
		url:"<%=request.getContextPath()%>/memberCheck.me",
				data : {
					nickName : nickName
				},
				type : "get",
				success : function(data) {
					console.log("성공");
					if (data == 1) {
						$("#error-nickName2").hide();
						$("#error-nickName").show();
						$("#inputNickName").select();
					} else {
						$("#error-nickName").hide();
						$("#error-nickName2").show();
					}

				},
				error : function(data) {
					console.log("에러");
				}

			});

		});
	</script>
</body>
</html>