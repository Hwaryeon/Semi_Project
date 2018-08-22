<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.Member"%>
<!DOCTYPE html>
<% Member loginUser = (Member)session.getAttribute("loginUser");%>
<html>
<head>
<meta content="text/html; charset=UTF-8">
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

.bUpdateForm input[type=text], .bUpdateForm button {
	direction: ltr;
	height: 44px;
	font-size: 14px;
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

.bUpdateForm .form-control:focus {
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
    <!-- business 회원으로 업데이트시 mypageIndex에서 보이지 않게하기 + 잘못된 접근 차단(only general 회원만 접근 가능)-->
	<%-- <%@ include file="../common/headBar.jsp" %> --%>
	
	<div class="container">
	<h2 align="center">사업자 정보 입력</h2>
	<hr>
		<form class="bUpdateForm" action="<%=request.getContextPath() %>/updateBusinessMember" method="post" onsubmit="return validate();">
			<label>사업자등록번호</label>
            <input type="text" class="form-control" id="inputBNumber" name="businessLicenseNo" placeholder="사업자 등록번호(10자리)" maxlength="10" required>
            <input type="hidden" id="userId" name="userId">
            <div class="error-bNumber">
			<label style="color: red; font-style: italic;">사업자등록번호의 자릿수가 잘못 입력되었습니다.</label>
			</div>
		    <div class="error-bNumber2">
		    <label style="color: red; font-style: italic;">잘못된 사업자등록번호입니다. 다시 확인해주세요.</label>
			</div>
		    <div class="error-bNumber3">
			<label style="color: red; font-style: italic;">중복된 사업자등록번호입니다. 다시 확인해주세요.</label>
			</div>
			<div class="error-bNumber4">
			<label style="color: green; font-style: italic;">사용 가능한 사업자등록번호입니다.</label>
			</div>
            <label>법인등록번호</label>
            <input type="text" class="form-control" id="inputCNumber" name="corporateRegistrationNo" placeholder="법인등록번호(13자리)" maxlength="13" required>
            <div class="error-cNumber">
			<label style="color: red; font-style: italic;">법인등록번호의 자릿수가 잘못 입력되었습니다.</label>
			</div>
			<div class="error-cNumber2">
			<label style="color: red; font-style: italic;">잘못된 법인등록번호입니다. 다시 확인해주세요.</label>
			</div>
            <label>법인명</label>
            <input type="text" class="form-control" id="inputCoName" name="corporateName" placeholder="법인명" required>
            <br>
            <div class="btns" align="center">
			<button class="form-control btn btn-primary" id="update" type="submit">사업자 인증받기</button>
		    </div>
		</form>
	</div>
	<div>
		<%@ include file="../common/footer.jsp"%>
	    </div>
	
	<script>
	$(function(){
	   
		var userId = <%= loginUser.getUserId() %>;
	    var businessLicenseNo = $("#inputBNumber");
		var corporateRegistrationNo = $("#inputCNumber");
		
		$("#userId").val(userId);
		
		$(".error-cNumber").hide();
	    $(".error-cNumber2").hide();
	    $(".error-bNumber").hide();
		$(".error-bNumber2").hide();
		$(".error-bNumber3").hide();
		$(".error-bNumber4").hide();
		
		//사업자등록번호 유효성 체크
		
		businessLicenseNo.blur(function(){
			
			 $(".error-bNumber").hide();
		     $(".error-bNumber2").hide();
			 $(".error-bNumber3").hide();
			 $(".error-bNumber4").hide();
			
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
	        	url:"<%=request.getContextPath()%>/memberCheck.me",
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
			    	
			    });
		//제출 전 검사
			    function validate(){
					
					if($(".error-cNumber").is(':visible')){
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
				     return true;
				}
		
	});
	</script>
</body>
</html>