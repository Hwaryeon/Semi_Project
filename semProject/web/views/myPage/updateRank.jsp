<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*"%>
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
.cmntitle {
	margin-top: 10%;
}

.container {
	width: 100%;
	max-width: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 3%;
	margin-bottom: 100px;
	padding: 40px 40px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.mine {
	font-size:20px;
	text-align:center;
}

button {
	width: 100%;
	height: 40px;
	display: block;
	margin-top:100px;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp"%>
	<h2 align="center" class="cmntitle">투자자 등급 변경하기</h2>
	<div class="container" align="center">
		<table>
			<tr>
				<%  String investorGrade = loginUser.getInvestorGrade();
					String myInvestorGrade = "";
					switch (investorGrade) {
						case "GI" : myInvestorGrade = "일반투자자"; break;
						case "QI" : myInvestorGrade = "적격투자자"; break;
						case "PI" : myInvestorGrade = "전문투자자"; break;
					} %>
				<td colspan="3" class="mine">나의 투자등급 : <%=myInvestorGrade%></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td><button id="btn2" class="qualified btn-primary btn"
						onclick="location.href='updateRankForm.jsp'">적격투자자 신청하기</button></td>
				<td>&nbsp;</td>
				<td><button id="btn2" class="professional btn-primary btn"
						onclick="location.href='updateRankForm2.jsp'">전문투자자 신청하기</button></td>
			</tr>
		</table>
	</div>
	<script>
			
		<%if (myInvestorGrade.equals("적격투자자")) {%>
			$(".qualified").hide();
		<%}%>
			
		</script>
</body>
</html>