<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		margin-top:10%;
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
	margin-left: auto;
	margin-right: auto;
}

button {
	width: 100%;
	height: 40px;
	display: block;
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

p {
	text-align:center;
	font-weight: 400;
}

</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp" %>
	<h2 align="center" class="cmntitle">회원탈퇴</h2>
	<div class="container" align="center">
		<p>
			회원님.<br> 
			회원탈퇴사유를 입력해 주시면 앞으로 더욱더<br>
			개선해 나가는 iCrowd가 되도록 하겠습니다.<br><br><br>
			* 프로젝트를 개설하여 진행중이거나<br>
			투자(참여)중인 경우 탈퇴하실 수 없습니다.<br><br>
			* 탈퇴 후 회원님의 개인정보는 파기 됩니다.<br><br>
			* 회원님께서 남기신 게시글,댓글 및<br>
			펀딩한 프로젝트의 투자(참여)목록 등 투자이력은 삭제되지 않습니다.<br><br>
		</p>
		<button class="btn btn-primary" onclick="location.href='<%= request.getContextPath() %>/delete.me?userid=<%= loginUser.getUserId() %>'">
			<!-- onclick="deleteMember();" -->
			탈퇴하기
		</button>
	</div>
</body>
</html>