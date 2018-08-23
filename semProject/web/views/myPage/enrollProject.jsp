<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.myPage.model.vo.*"%>
    <% ArrayList<MypageDetail> list = (ArrayList<MypageDetail>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
.cmntitle {
		margin-top:10%;
	}
.product {
	display: block;
	margin-left:auto;
	margin-right:auto;
	margin-bottom: 10px;
	font-size:15px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}
.container {
	margin-left:auto;
	margin-right:auto;
	width:800px;
	margin-top: 3%;
	padding: 40px 40px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	border: 1px solid lightgray;
	border-radius: 10px;
}
.product th, td{
	text-align:center;
}

.product td {
	border:1px solid lightgray;
	
}

</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/headBar.jsp" %>
	<h2 align="center" class="cmntitle">
	<% if(loginUser.getUserClass().equals("business")) { %>개설
	<% } else { %>
	참여<% } %> 프로젝트</h2>
	
	<div class="container">
		<div class="product">
			<table align="center">
				<tr>
					<th colspan="2" width="100px" height="50px">썸네일</td>
					<th colspan="6" width="300px" height="50px">제목</td>
					<th colspan="2" width="100px" height="50px">상태</td>
				</tr>
				<% int i=1;
					for(MypageDetail md : list) { %>
				<tr>
					<td colspan="2" width="100px" height="50px"><%=i %>번</td>
					<td colspan="6" width="300px" height="50px"><%= md.getP_name() %></td>
					<td colspan="2" width="100px" height="50px">
					<% if(md.getStatus().equals("going")) { %> 진행중
					<% } else if(md.getStatus().equals("done")) {%>완료<% } %>
					</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<% i++; } %>
			</table>
		</div>

	</div>
</body>
</html>