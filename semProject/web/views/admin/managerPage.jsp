<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.sp.member.model.vo.*, 
	com.kh.sp.admin.model.vo.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStatPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/admin.css">

<style>
#sortBtn {
	width: 60px;
}

#search2 {
	float: right;
	margin-top: 9px;
	width: 250px;
}

.container, .row {
	width: 300px;
}

.row {
	margin-left: -75px;
	margin-regih: -15px;
}

.search {
	padding: 5px 0;
	width: 230px;
	height: 30px;
	position: relative;
	left: 10px;
	float: left;
	line-height: 22px;
}

.search input {
	position: absolute;
	width: 0px;
	float: Left;
	margin-left: 210px;
	-webkit-transition: all 0.7s ease-in-out;
	-moz-transition: all 0.7s ease-in-out;
	-o-transition: all 0.7s ease-in-out;
	transition: all 0.7s ease-in-out;
	height: 30px;
	line-height: 18px;
	padding: 0 2px 0 2px;
	border-radius: 1px;
}

.search:hover input, .search input:focus {
	width: 200px;
	margin-left: 0px;
}

.btn {
	height: 30px;
	position: absolute;
	right: 0;
	top: 5px;
	border-radius: 1px;
}

td {
	text-align: center;
}

td a {
	text-decoration: none;
	color: black;
}

td a:hover {
	cursor: pointer;
}

#web-font {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 32px;
}

table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	font-family: 'Nanum Gothic Coding', monospace;
	border: 1px solid #444444;
	color: black;
	text-align: center;
}

/* #box {
	position: absolute;
	display: inline;
	margin-left:auto;
	margin-right:auto;
	}
 */
/* #sortBox {
	position: absolute;

	display: inline;
	width: 30%;
	height: 30%;
}
 */
#text {
	margin-top: 3px;
	background-color: white;
	padding: 20px;
	width: 60%;
	height: 530px;
	float: left;
	border: 2px solid;
	border-color: #d6d6d6;
	background-size: 95%;
}

#searchBox {
	position: absolute;
	display: inline;
	width: 400px;
	height: 50px;
}

/*
 나중에 지워야 할 것
 */
html {
	background-color: white;
	margin-top: -1px;
}

element {
	background: white;
}
</style>
</head>


<body>
	<%@ include file="../common/headBar.jsp"%>
	<div id="omcWrap" style="min-width: 1400px;">
		<div id="cMain">
			<header class="head_banner" style="margin-bottom: 65px;">
				<div class="hero">
					<img src="<%=request.getContextPath()%>/images/common/admin.jpg"
						style="width: 100%;" alt="공지사항 배경 이미지 입니다." class="img_rwd">
				</div>
				<div class="layer">
					<!-- <h1 class="tit_comm">Manager</h1>
							<p class="txt_comm">관리자 페이지</p> -->
				</div>
			</header>



			<%@ include file="../common/sideMenu2.jsp"%>
			<%-- <%@ include file="../views/sideMenu.jsp" %> --%>
			<div>
				<div id="text" style="margin-left: 90px;">
					<h2 id="web-font">
						<b>회원 관리 > 회원 조회</b>
					</h2>
					<br>
					<!-- 여기는 정렬 form  -->
					<form action="<%=request.getContextPath()%>/sortMember.adm"
						method="get">
						<div id="box">
							<div id="sortBox">
								<select name="sort">
									<option name="sortCondition" value="user_id">아이디순</option>
									<option name="sortCondition" value="user_class">회원구분</option>
									<option name="sortCondition" value="user_name">이름</option>
									<option name="sortCondition" value="nickname">별명</option>
									<option name="sortCondition" value="email">이메일</option>
									<option name="sortCondition" value="phone">연락처</option>
								</select>
								<button id="sortBtn" type="submit">정렬하기</button>
							</div>
					</form>

					<!-- 여기는 검색 form   -->
					<form action="<%=request.getContextPath()%>/searchMember.adm"
						method="get">

						<div id="searchBox">
							<div class="container">
								<div class="row">
									<!-- 여기 div name, id -->
									<div name="searchCondition" id="search" value="search"
										class="search">
										<!-- 여기가 입력창 -->
										<input type="text" class="form-control input-sm"
											maxlength="64" placeholder="Search" id="search1"
											name="searchValue" value="search" />
										<button type="submit" class="btn btn-primary btn-sm">검색하기</button>
									</div>
								</div>
							</div>
						</div>

					</form>



					<br> <br> <br>
					<table id="memberTable" border="1">
						<thead>
							<tr>
								<th>아이디</th>
								<th>회원구분</th>
								<th>이름</th>
								<th>별명</th>
								<th>이메일</th>
								<th>연락처</th>
							</tr>

						</thead>
						<%
							for (Member m : list) {
						%>
						<tr>

							<input type="hidden" name="userId" id="userId"
								value="<%=m.getUserId()%>">
							<td><%=m.getUserId()%></td>
							<td name="user_class"><%=m.getUserClass()%></td>
							<input type="hidden" name="userClass" id="userClass"
								value="<%=m.getUserClass()%>">

							<td><%=m.getUserName()%></td>
							<td><%=m.getNickName()%></td>
							<td><%=m.getEmail()%></td>
							<td><%=m.getPhone()%></td>
						</tr>
						<%
							}
						%>
					</table>


					<%-- 	<script>
			$(function(){
				<%for (Member m : list) {%>
					$("table").append("<tr>");
					
					$("table tr").last().append("<td>" + '<%=m.getUserId()%>' + "</td>");
					$("table tr").last().append("<td>" + '<%=m.getUserClass()%>' + "</td>");
					$("table tr").last().append("<td>" + '<%=m.getUserName()%>' + "</td>");
					$("table tr").last().append("<td>" + '<%=m.getNickName()%>' + "</td>");
					$("table tr").last().append("<td>" + '<%=m.getEmail()%>' + "</td>");
					$("table tr").last().append("<td>" + '<%=m.getPhone()%>' + "</td>");
				
					
					$("table").append("</tr>");
					
				
				<%}%>
				
			});
		</script> --%>
				</div>
				<div>
					<%-- 페이지처리 --%>
					<div class="pageArea" align="center">
						<button
							onclick="location.href='<%=request.getContextPath()%>/selectAllMember.adm?currentPage=1'"><<</button>
						<%
							if (currentPage <= 1) {
						%>
						<button disabled><</button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=request.getContextPath()%>/selectAllMember.adm?currentPage=<%=currentPage - 1%>'"><</button>
						<%
							}
						%>
						<%
							for (int p = startPage; p <= endPage; p++) {
								if (p == currentPage) {
						%>
						<button disabled><%=p%></button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=request.getContextPath()%>/selectAllMember.adm?currentPage=<%=p%>'"><%=p%></button>
						<%
							}
						%>

						<%
							}
						%>

						<%
							if (currentPage >= maxPage) {
						%>
						<button disabled>></button>
						<%
							} else {
						%>
						<button
							onclick="location.href='<%=request.getContextPath()%>/selectAllMember.adm?currentPage=<%=currentPage + 1%>'">></button>
						<%
							}
						%>
						<button
							onclick="location.href='<%=request.getContextPath()%>/selectAllMember.adm?currentPage=<%=maxPage%>'">>></button>

					</div>
				</div>
			</div>
			<form id="selectOne"
				action="<%=request.getContextPath()%>/selectOneMember.adm"
				method="post">

				<input type="hidden" id="userId2" name="userId2"> <input
					type="hidden" id="userClass2" name="userClass2">


			</form>




			<script>
				$(function() {
					$("#memberTable td").mouseenter(function() {
						$(this).parent().css({
							"background" : "skyblue",
							"cursor" : "pointer"
						});
					}).mouseout(function() {
						$(this).parent().css({
							"background" : "white"
						});
					}).click(function() {
						$("#userId2").val($("#userId").val());
						$("#userClass2").val($("#userClass").val());

						$("#selectOne").submit();

					});

				});
			</script>
		</div>
	</div>
</body>
</html>