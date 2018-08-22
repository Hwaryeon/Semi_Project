<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">
<title>Insert title here</title>
<style>

html {
	    margin-top: 165px;
}

th{
background-color:#66CDAA;
}
table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
 
#box  {
display : inline;

}
#sortBox {
	display: inline;
	width: 50%;
	height: 30%;
}
#text {
	background-color: white;
	padding: 20px;
	width: 60%;
	height: 530px;
	float: left;
	border: 2px solid;
	border-color: darkgray;
}
#searchBox{
	display: inline;
	width: 50%;
	height: 30%;
}
td {
		text-align:right;
	}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp" %>
	
	<%@ include file="../common/sideMenu2.jsp" %>
	<div>
		<div id="text">
			<h2>회원관리 > 블랙리스트 관리</h2>
			<br>
			<form action="" method="get">
				<div id="box">
					<div id="sortBox" boder=1>
						<select name="sort">
							<option value="user_id">아이디순</option>
							<option value="user_class">회원구분</option>
							<option value="user_name">이름</option>
							<option value="nickname">별명</option>
							<option value="email">게시글 수</option>
							<option value="phone">댓글 수</option>	
							<option value="phone">환불 횟수</option>
							<option value="phone">펀딩 취소 횟수</option>
						</select>
						<button type="submit">정렬하기</button>
					</div>
					<div id="searchBox">
						<input id="search" size="30" placeholder="검색할 내용 입력" type="search" name="searchValue">
						<button type="submit">검색하기</button>
						</div>
				</div>
				<br><br><br>
					<table align="center" border="1">
					<thead>
		<tr>
			<th>아이디</th>
			<th>회원구분</th>
			<th>이름</th>
			<th>별명</th>
			<th>업체명</th>
			<th>사유</th>
			<th>블랙 리스트 등록일</th>
			
	
		</tr>
		</thead>
		</table>
			</form>
			
		
		
		</div>
	</div>
	
	
	
	
</body>
</html>