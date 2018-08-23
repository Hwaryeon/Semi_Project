<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/admin/admin.css">

<style>
html {
	    margin-top: 86px;
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

th{
background-color:#66CDAA;

}

</style>
</head>
<body>
		<%@ include file="../common/headBar.jsp" %>
	<header class="head_banner" style="margin-bottom: 65px;">
						<div class="hero"><img src="<%=request.getContextPath()%>/images/common/admin.jpg" style="width:100%;"alt="공지사항 배경 이미지 입니다." class="img_rwd"></div>
						<div class="layer">
							<!-- <h1 class="tit_comm">Manager</h1>
							<p class="txt_comm">관리자 페이지</p> -->
						</div>
					</header>
	<%@ include file="../common/sideMenu2.jsp" %>
	
<div>
		<div id="text">
			<h3>펀딩 관리 > 펀딩 조회</h3><br>
			<form action="" method="get">
				<div id="box">
					<div id="sortBox" border="1">
						<select name="sort">
							<option value="project_id">펀딩명</option>
							<option value="_name">이름</option>
							<option value="nickname">마감임박순</option>
							<option value="email">달성률순</option>
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
			<th>No</th>
			<th>프로젝트명</th>
			<th>사업자 이름</th>
			<th>마감방식</th>
			<th>달성률</th>
			<th>진행 상태</th>
		</tr>
		</thead>
		</table>
			</form>
			
		
		
		</div>
	</div>
</body>
</html>