<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.member.model.vo.*, 
	com.kh.sp.admin.model.vo.*"%>
    <%
	ArrayList<Member> blackList = (ArrayList<Member>) request.getAttribute("blackList");
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
}

element {
	background: white;
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
			

			<!-- 여기는 검색 form   -->
			<form action="<%=request.getContextPath()%>/blackSearch.adm"
				method="get">

				<div id="searchBox">
					<div class="container">
						<div class="row">
							<!-- 여기 div name, id -->
							<div name="searchCondition" id="search" value="search"
								class="search">
								<!-- 여기가 입력창 -->
								<input type="text" class="form-control input-sm" maxlength="64"
									placeholder="검색할 내용 입력" id="search1" name="searchValue"
									value="search">
								<button type="submit" class="btn btn-primary btn-sm">검색하기</button>
							</div>
						</div>
					</div>
				</div>

			</form>
			
			<br><br><br>
			
					<table align="center" border="1">
					<thead>
		<tr>
			<th>아이디</th>
			<th>회원구분</th>
			<th>이름</th>
			<th>업체명</th>
			<th>사유</th>
			<th>블랙 리스트 등록일</th>
			
	
		</tr>
		</thead>
		<% for(Member m : blackList){ %>
		
					<tr>						
						<td><%= m.getUserId() %></td>
						<td><%= m.getUserClass() %></td>
						<td><%= m.getUserName() %></td>
						<td><%= m.getCorporateName() %></td>
						<td><%= m.getB_reason() %></td>
						<td><%= m.getB_enrollDate() %></td>
					</tr>
					<% } %> 
			</table>
			</form>
			
		<div>
			<%-- 페이지처리 --%>
			<div class="pageArea" align="center">
				<button
					onclick="location.href='<%=request.getContextPath()%>/blackSelectAll.adm?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button disabled><</button>
				<%
					} else {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/blackSelectAll.adm?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/blackSelectAll.adm?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/blackSelectAll.adm?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/blackSelectAll.adm?currentPage=<%=maxPage%>'">>></button>

			</div>
		</div>
	</div>
		
		</div>
	
	
	
	
</body>
</html>