<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

.form-joinMember2 #inputEmail, .form-joinMember2 #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 14px;
}

.form-joinMember2 input[type=email], .form-joinMember2 input[type=password],
	.form-joinMember2 input[type=text], .form-joinMember2 input[type=tel],
	.form-joinMember2 button {
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

.form-joinMember2 .form-control:focus {
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
		<h2 style="font-size:30px">일반 회원 가입</h2>
		<form class="form-joinMember2"
			action="<%=request.getContextPath()%>/insertMember.me" method="post" onsubmit="return validate();">
			<span id="reauth-email" class="reauth-email"></span>
			<div id="general-member">

				<label style="font-size:14px"> 이메일 주소</label> <input type="email" id="inputEmail"
					name="email" class="form-control" value="<%= request.getParameter("email") %>" readonly>

				<label style="font-size:14px"> 이름</label> <input type="text" id="inputName" name="userName"
					class="form-control" placeholder="이름을 입력해주세요" maxlength="10"
					required autofocus>

				<div class="error-name">
					<label style="color: red; font-style: italic;font-size:14px;">2글자 이상 한글만
						입력하실 수 있습니다.</label>
				</div>

				<label style="font-size:14px"> 비밀번호</label> <input type="password" id="inputPassword"
					name="userPwd" class="form-control"
					placeholder="비밀번호(영문, 숫자, 특수문자 포함 8자 이상)" maxlength="20" required>

				<div class="error-password">
					<label style="color: red; font-style: italic;font-size:14px;">영문,숫자,특수문자(!@$%^&* 만 허용)포함 8자 이상 입력 바랍니다.</label>
				</div>

				<input type="password" id="inputPassword2" class="form-control"
					placeholder="비밀번호 확인" maxlength="20" required>

				<div class="error-password2">
					<label style="color: red; font-style: italic;font-size:14px;">비밀번호가 일치하지
						않습니다.</label>
				</div>

				<label style="font-size:14px"> 휴대폰 번호</label> <input type="tel" id="inputPhone"
					name="phone" class="form-control"
					placeholder="휴대폰 번호를 입력해주세요('-'없이 입력)" maxlength="11" required>

				<div class="error-phone">
					<label style="color: red; font-style: italic;font-size:14px;">숫자만 입력하실 수
						있습니다.</label>
				</div>

				<div class="error-phone2">
					<label style="color: red; font-style: italic;font-size:14px;">휴대폰 번호는 최소
						10자리 이상입니다.</label>
				</div>

				<label style="font-size:14px"> 별명</label> <input type="text" id="inputNickName"
					name="nickName" class="form-control" placeholder="사용하실 별명을 입력해주세요"
					maxlength="10" required>

				<div class="error-nickName">
					<label style="color: red; font-style: italic;font-size:14px;">이미 사용 중인
						별명입니다.</label>
				</div>
				<div class="error-nickName2">
					<label style="color: green; font-style: italic;font-size:14px;">사용 가능한 별명입니다.</label>
				</div>

			</div>
			<hr>
			<div id="additional-information" class="checkbox">

				<label style="font-size:14px"> <input type="checkbox" id="ch-bm"
					onclick="checkBM();"> 추가 정보 입력하여 사업자 회원으로 가입하기
				</label>
			</div>

			<div id="business-member">
				<hr>
				<h2 style="font-size:30px">사업자 정보 입력</h2>
				<span id="reauth-email" class="reauth-email"></span>
				<table>
					<tr>
						<td><input type="text" id="inputBNumber"
							name="businessLicenseNo" class="form-control"
							placeholder="사업자 등록번호(10자리)" maxlength="10"></td>
						<td>
							<p>&nbsp;&nbsp;</p>
						</td>
						<td>
							<button type="button" class="form-control btn btn-default"
								id="doubleCheck" onclick="checkBNumber();">중복 확인</button>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<div class="error-bNumber">
								<label style="color: red; font-style: italic;font-size:14px;">사업자등록번호의
									자릿수가 잘못 입력되었습니다.</label>
							</div>
							<div class="error-bNumber2">
								<label style="color: red; font-style: italic;font-size:14px;">잘못된
									사업자등록번호입니다. 다시 확인해주세요.</label>
							</div>
							<div class="error-bNumber3">
								<label style="color: red; font-style: italic;font-size:14px;">중복된
									사업자등록번호입니다. 다시 확인해주세요.</label>
							</div>
							<div class="error-bNumber4">
								<label style="color: green; font-style: italic;font-size:14px;">사용 가능한 사업자등록번호입니다.</label>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input type="text"
							id="inputCNumber" name="corporateRegistrationNo"
							class="form-control" placeholder="법인등록번호(13자리)" maxlength="13">
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<div class="error-cNumber">
								<label style="color: red; font-style: italic;font-size:14px;">법인등록번호의
									자릿수가 잘못 입력되었습니다.</label>
							</div>
							<div class="error-cNumber2">
								<label style="color: red; font-style: italic;font-size:14px;">잘못된
									법인등록번호입니다. 다시 확인해주세요.</label>
							</div>
							
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input type="text"
							id="inputCoName" name="corporateName" class="form-control"
							placeholder="법인명"></td>
					</tr>
				</table>
				<hr>
			</div>
			<button class="form-control btn btn-primary" type="submit">가입하기</button>
			<!-- <button class="form-control btn btn-primary" type="submit">가입하기</button> -->
		</form>
		<!-- /form -->

		<script>

			$(function(){
		   
				var userName = $("#inputName");
				var userPwd = $("#inputPassword");
				var userPwd2 = $("#inputPassword2");
			    var phone = $("#inputPhone");
			    var nickName = $("#inputNickName");
			    var corporateRegistrationNo = $("#inputCNumber")
			    
			    $(".error-name").hide();
			    $(".error-password").hide();
			    $(".error-password2").hide();
			    $(".error-phone").hide();
			    $(".error-phone2").hide();
			    $(".error-nickName").hide();
			    $(".error-nickName2").hide();
			    $(".error-cNumber").hide();
			    $(".error-cNumber2").hide();
			    
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
			    	
			    })
			    
			     //닉네임 중복 확인 (ajax)
			    
			      nickName.blur(function(){
			    	  $(".error-nickName").hide();
			    	  $(".error-nickName2").hide();
			    	  
			        var nickName = $("#inputNickName").val();
			        
			        $.ajax({
			        	url:"<%= request.getContextPath()%>/memberCheck.me",
			        	data:{nickName:nickName},
			        	type:"get",
			        	success:function(data){
			        		console.log("성공");
			        		if(data == 1){
			        			$(".error-nickName2").hide();
			        			$(".error-nickName").show();
			        			$("#inputNickName").select();
			        		}else{
			        			$(".error-nickName").hide();
			        			$(".error-nickName2").show();
			        		}
			        		
			        	},
			        	error:function(data){
			        		console.log("에러");
			        	}
			        	
			        });
			        
			    });  
			    
			    //법인등록번호 유효성 체크 
			    corporateRegistrationNo.blur(function(){
			    	$(".error-cNumber").hide();
					$(".error-cNumber2").hide();
					
			    	if(corporateRegistrationNo.val().length < 13 ){
						$(".error-cNumber").show();
						$(".error-cNumber2").hide();
						corporateRegistrationNo.select();
						
					}else{
						 var checkNum = new Array("1","2","1","2","1","2","1","2","1","2","1","2");
						 var newNum = new Array();
						 for(var i = 0; i < corporateRegistrationNo.val().length -1; i++){
						    newNum[i] = corporateRegistrationNo.val().charAt(i);
						 }
						 
						 var multiNum = new Array();
						 for(var k = 0; k < newNum.length; k++){
							 multiNum[k] = checkNum[k] * newNum[k];
						 }
						 var addNum = 0;
						 for(var y = 0; y < multiNum.length; y++){
							 addNum = addNum + Number(multiNum[y]); 
						 }
						 var remainder;
						 var quota;
						 remainder = Number(addNum) % 10;
						 quota = Number(addNum) / 10;
						 
						 if((10 - Number(remainder)) == 10 ){
						     failCheckNum = 0;
						 }else{
						     failCheckNum = 10 - Number(remainder);
						 }
						 
						 if(failCheckNum != corporateRegistrationNo.val().charAt(12)) {
							 $(".error-cNumber").hide();
							 $(".error-cNumber2").show();
							 corporateRegistrationNo.select();
						 }else{
							 $(".error-cNumber").hide();
						 }
		
					}
			    	
			    })
			    
			});
			
			
			//추가 정보 입력란 클릭시 나타내기
			$(function(){
				$("#business-member").hide();
			})
			
			function checkBM(){
				if($("input:checkbox[id='ch-bm']").is(":checked")){
					$("#business-member").show();
					
					$(".error-bNumber").hide();
					$(".error-bNumber2").hide();
					$(".error-bNumber3").hide();
					$(".error-bNumber4").hide();
					
					$("#inputBNumber").attr("required", "required");
					$("#inputCNumber").attr("required", "required");
					$("#inputCoName").attr("required", "required");
				}else{
					$("#business-member").hide();
					
					$("#inputBNumber").removeAttr("required", "required");
					$("#inputCNumber").removeAttr("required", "required");
					$("#inputCoName").removeAttr("required", "required");
					
				}
			}
			
			//사업자 등록번호 유효성 및 중복 확인
			function checkBNumber(){
				$(".error-bNumber").hide();
				$(".error-bNumber2").hide();
				$(".error-bNumber3").hide();
				$(".error-bNumber4").hide();
				
				var businessLicenseNo = $("#inputBNumber");
				
				if(businessLicenseNo.val().length < 10 ) {
					$(".error-bNumber").show();
					$(".error-bNumber2").hide();
					businessLicenseNo.select();
					return;
				}
				
				var varCk1 = businessLicenseNo.val().substring(0,3);
				var varCk2 = businessLicenseNo.val().substring(3,5);
				var varCk3 = businessLicenseNo.val().substring(5);
				    
				var ckValue = new Array(10);
				    
				ckValue[0] = ( parseFloat(varCk1.substring(0 ,1))  * 1 ) % 10;
				ckValue[1] = ( parseFloat(varCk1.substring(1 ,2))  * 3 ) % 10;
				ckValue[2] = ( parseFloat(varCk1.substring(2 ,3))  * 7 ) % 10;
				ckValue[3] = ( parseFloat(varCk2.substring(0 ,1))  * 1 ) % 10;
				ckValue[4] = ( parseFloat(varCk2.substring(1 ,2))  * 3 ) % 10;
				ckValue[5] = ( parseFloat(varCk3.substring(0 ,1))  * 7 ) % 10;
				ckValue[6] = ( parseFloat(varCk3.substring(1 ,2))  * 1 ) % 10;
				ckValue[7] = ( parseFloat(varCk3.substring(2 ,3))  * 3 ) % 10;
				ckTemp     = parseFloat(varCk3.substring(3 ,4))  * 5  + "0";
				ckValue[8] = parseFloat(ckTemp.substring(0,1)) + parseFloat(ckTemp.substring(1,2));
				ckValue[9] = parseFloat(varCk3.substring(4,5));
			    ckLastid = ( 10 - ( ( ckValue[0]+ckValue[1]+ckValue[2]+ckValue[3]+ckValue[4]+ckValue[5]+ckValue[6]+ckValue[7]+ckValue[8] ) % 10 ) ) % 10;
				    
				if(ckValue[9] != ckLastid){
					$(".error-bNumber").hide();
					$(".error-bNumber2").show();
					businessLicenseNo.select();
				}else{
					$(".error-bNumber").hide();
					$(".error-bNumber2").hide();
					$(".error-bNumber3").hide();
					
					$.ajax({
			        	url:"<%= request.getContextPath()%>/memberCheck.me",
			        	data:{businessLicenseNo:$("#inputBNumber").val()},
			        	type:"get",
			        	success:function(data){
			        		console.log("성공");
			        		if(data == 1){
			        			$(".error-bNumber3").show();
			        		}else{
			        			$(".error-bNumber4").show();
			        		}
			        		
			        	},
			        	error:function(data){
			        		console.log("에러");
			        	}
			        	
			        });
				}
			}
			
			function validate(){
				
				if($(".error-name").is(':visible')){
					return false;
				}else if($(".error-password").is(':visible')){
					return false;
				}else if($(".error-password2").is(':visible')){
					return false;
				}else if($(".error-phone").is(':visible')){
					return false;
				}else if($(".error-phone2").is(':visible')){
					return false;
				}else if($(".error-nickName").is(':visible')){
					return false;
				}else if($(".error-cNumber").is(':visible')){
					return false;
				}else if($(".error-cNumber2").is(':visible')){
					return false;
				}else if($(".error-bNumber").is(':visible')){
					return false;
				}else if($(".error-bNumber2").is(':visible')){
					return false;
				}else if($(".error-bNumber3").is(':visible')){
					return false;
				}
				
				if($("#business-member").is(':hidden')){
					/////여기요 여기
				}
					
			     return true;
			}
			</script>
	</div>
    <div>
		<%@ include file="../common/footer.jsp"%>
	    </div>

</body>
</html>