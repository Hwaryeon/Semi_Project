<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
html {
	    margin-top: 165px;
}
.adminBtn {
	background: #5bc0de;
	heignt: 50px;
	color: white;
	font-size: 8px;
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.3333333;
	border-radius: 6px;
	border: 1px solid transparent;
	white-space: nowrap;
}
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid white;
	text-align:center;
	
}

#box {
	display: inline;
}

#sortBox {
	display: inline;
	width: 50%;
	height: 30%;
}

#text {
	margin-top: 13px;
	background-color: white;
	padding: 20px;
	width: 60%;
	height: 530px;
	float: left;
	border: 2px solid;
	border-color: #d6d6d6;
}

#searchBox {
	display: inline;
	width: 50%;
	height: 30%;
}

.btn-box {
	width: 350px;
	margin-left: auto;
	margin-right: auto;
}
#blackText{
 width:600px;
  height:200px;
 }
</style>
</head>
<body>
		<%@ include file="../common/headBar.jsp" %>
	
	<%@ include file="../common/sideMenu2.jsp" %>
		<div id="text">
			<h3>회원관리 > 회원조회 > 상세조회</h3><br>
			<form action="" method="get">

				<table align="center" border="1">
				<thead>
					<tr>
						<th>아이디</th>
						<th>회원구분</th>
						<th>이름</th>
						<th>업체명</th>
						<th>별명</th>
						<th width="260px">이메일</th>
						<th width="200px">연락처</th>
						
					</tr>
				</thead>
				</table>
				<br><br><br><br><br>
				<table align="center" border="1">
				<thead>
					<tr>
						<th rowspan="2" width="300px">주소</th>
						<th rowspan="2">프로젝트 개설 횟수</th>
						<th rowspan="2">투자받은 금액</th>
						<th rowspan="2">가입일</th>
					</tr>
				</thead>
				</table>
			</form>
			<br><br><br><br><br><br><br><br><br>
		<div class="btn-box">
			<button class="adminBtn" onclick="location.href='admin/managerPage.jsp'">돌아가기</button>
			&nbsp;
			<button type="button" id="blackBtn" class="adminBtn"
				data-toggle="modal" data-target="#myModal">블랙리스트 추가하기</button>

		</div>
		</div>
		<div class="container">
		<!-- Trigger the modal with a button -->

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">블랙리스트로 추가 하시겠습니까?</h4>
					</div>
					<div class="modal-body">
						<p>블랙리스트 사유를 입력해 주세요.</p>
						<input type="text" id="blackText">
					</div>
					<div class="modal-footer">
						<button type="button" onclick="location.href='#'" class="btn btn-default" data-dismiss="modal">추가하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>