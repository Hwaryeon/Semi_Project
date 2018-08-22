<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.cmntitle {
		margin-top:10%;
	}
#text {
	background-color: white;
	padding: 20px;
	width: 60%;
	border: 1px solid black;
	margin-left:auto;
	margin-right:auto;
	margin-top:3%;
}
#btn:hover {
	cursor: pointer;
}

body {
	height: 90%;
}

ul {
	list-style-type: circle;
	text-align: left;
}

#payment {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp" %>
	<h2 align="center" class="cmntitle">
	결제내역</h2>
	<div id="text">
		<h4>님의 투자금</h4>
		<h4>2018년 남은 투자 한도</h4>

		<!-- 그래프 모양 넣기 -->

		<!-- 테이블 넣기 -->
		<table align="center" id="payment">
			<tr>
				<th>날짜</th>
				<th>프로젝트명</th>
				<th>금액</th>
			</tr>
			<tr>
				<td>18/01/01</td>
				<td>ㅁㅁㅁ</td>
				<td>1,000,000</td>
			</tr>
			<tr>
				<td>18/01/01</td>
				<td>ㅁㅁㅁ</td>
				<td>1,000,000</td>
			</tr>
			<tr>
				<td>18/01/01</td>
				<td>ㅁㅁㅁ</td>
				<td>1,000,000</td>
			</tr>
		</table>
	</div>
</body>
</html>