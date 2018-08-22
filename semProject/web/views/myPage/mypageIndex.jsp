<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.outer {
	padding-left:0px;
	padding-right:0px;
	padding-bottom:0px;
}
legend {
	font-size: 24px;
}

#menu {
	margin-top:10%;
	margin-right: auto;
	margin-left: auto;
	background: white;
	min-width: 150px;
	max-width: 300px;
	width: 30%;
	height: 500px;
}
#menubar {
	width:400px;
	height:30px;
	font-size:16px;
	text-align:center;
}

#menubar > td {
	border:1px solid black;
	width:400px;
}
#menubar:hover {
	cursor:pointer;
}

#menutitle {
	font-size:16px;
	height:30px;
	text-align:center;
}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp" %>
	
	<div id="menu">
		<fieldset class="outer">
			<legend align="center">
				<b>마이페이지</b>
			</legend>
			<table align="center" height="450px">
				<tr id="menubar" class="mypage update">
					<td onclick="location.href='updateMember.jsp'">개인정보 수정</td>
				</tr>
				
				<tr id="menubar" class="mypage enroll">
					<td onclick="location.href='myProject.jsp'">
					<% if(loginUser.getUserClass().equals("investor")) { %>참여 프로젝트
					<% } else if(loginUser.getUserClass().equals("business")) { %>개설 프로젝트
					<% } %>
					</td>
				</tr>
				
				<tr align="center" class="investService">
					<td id="menutitle"><b>투자서비스</b></td>
				</tr>
				<tr id="menubar" class="investService updateRank">
					<td onclick="location.href='updateRank.jsp'">투자등급 변경 신청</td>
				</tr>
				<tr id="menubar" class="investService payment">
					<td onclick="location.href='PaymentBackground.jsp'">결제내역</td>
				</tr>
				
				<tr class="certification">
					<td id="menutitle"><b>서비스 등록</b></td>
				</tr>
				<tr id="menubar" class="certification investor">
					<td onclick="location.href='normalInvestor.jsp'">일반 투자자 회원 인증</td>
				</tr>
				<tr id="menubar" class="certification business">
					<td onclick="location.href='licensee.jsp'">사업자 회원 인증</td>
				</tr>
			</table>
		</fieldset>
	</div>	
	<script>
		
		<% if(loginUser.getUserClass().equals("investor")) { %>
			//로그인 한 유저가 투자자일 경우
			$(".certification").hide(); //투자자 인증창 숨기기
		<% 		if(loginUser.getInvestorGrade().equals("PI")) { %>
				//전문 투자자인 경우
				$(".updateRank").hide();//투자등급 올리기 메뉴 숨기기
			<%	}	%>
			
		<% } else if(loginUser.getUserClass().equals("business")) { %>
			//로그인 한 유저가 사업자 회원일 경우
			$(".certification").hide();
			$(".updateRank").hide();
			
		<% } else if(loginUser.getUserClass().equals("general")){%>
			//로그인 한 유저가 일반회원일 경우
			$(".investService").hide();
		<% } %>
		
		
		
	</script>
</body>
</html>