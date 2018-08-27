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
	font-size:20px;
}

.container {
	width: 90%;
	/* max-width: 400px; */
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
	width: 200px;
	height: 40px;
	display: block;
	margin-left:auto;
	margin-right:auto;
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

p {
	border: 1px solid lightgray;
	border-radius:10px;
	text-align:center; 
	width:600px;
	height:300px;
}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp"%>
	<h2 align="center" class="cmntitle"><b>투자자 등급 변경하기</b></h2>
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
			<tr><td style="height:30px;"> </td><td> </td></tr>
			<tr>
				<td class="qualified">
				<p><br><br>적격 투자자 자격요건(아래 사항 중 1가지 충족될 경우 가능)<br>
				① 근로소득금액이 1억원을 초과하는 경우<br>
				② 사업소득금액이 1억원을 초과하는 경우<br>
				③ 근로소득금액과 사업소득금액의 합계가 1억원을 초과하는 경우<br>
				④ 금융소득(이자소득+배당소득)이 2천만원을 초과하는 경우<br>
				⑤ 금융전문자격시험에 합격하고,<br>금융투자전문인력으로 협회에 3년이상 등록되어있는 경우<br>
    			<br>
				투자 한도 : 연간 총 2,000만원(발행기업 당 투자한도는 연 1,000만원)</p>
				</td>
				<td>&nbsp;</td>
				<td class="professional">
				<p><br>전문 투자자 자격요건 (아래 사항 중 1가지 충족될 경우 가능)<br>
				① 자본시장법상 전문투자자(법 제9조제5항)<br>
				② 전문엔젤투자자<br>
				③ 투자형 프로젝트를 진행하는 해당 기업에게 회계, 자문 등의 용역을 제공하는 공인회계사, 감정인, 변호사, 세무사, 중소기업창업투자회사<br>
				④ 투자 프로젝트를 진행하고 있는 해당 기업의 최대주주, 등기임원, 우리사주조합원, 모집매출실적이 없는 주권상장법인의 주주, 발기인 등의 연고자<br>
				⑤ 벤처기업 또는 창업자에 대한 투자실적(최근 2년간 1건 5,000만원 또는 2건 이상에 합계 2,000만원)을 보유한 자<br><br>
				투자한도 : 무제한</p>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr align="center">
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