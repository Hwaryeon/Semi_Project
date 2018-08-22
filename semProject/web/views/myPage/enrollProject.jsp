<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style>
.cmntitle {
		margin-top:10%;
	}
#product td {
	border:1px solid black;
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
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/headBar.jsp" %>
	<h2 align="center" class="cmntitle">참여중인 프로젝트</h2>
	
	<div id="text">
		<div class="product">
			<table id="product" align="center">
				<tr align="center">
					<td colspan="2" width="100px" height="50px">이미지</td>
					<td colspan="6" width="300px" height="50px">제목</td>
					<td colspan="2" width="100px" height="50px">상태</td>
				</tr><tr></tr><tr></tr>
				<tr align="center">
					<td colspan="2" width="100px" height="50px">이미지</td>
					<td colspan="6" width="300px" height="50px">제목</td>
					<td colspan="2" width="100px" height="50px">상태</td>
				</tr><tr></tr><tr></tr>
				<tr align="center">
					<td colspan="2" width="100px" height="50px">이미지</td>
					<td colspan="6" width="300px" height="50px">제목</td>
					<td colspan="2" width="100px" height="50px">상태</td>
				</tr>
			</table>
		</div>

	</div>
</body>
</html>