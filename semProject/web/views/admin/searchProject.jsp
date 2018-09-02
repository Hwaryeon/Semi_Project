<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.admin.model.vo.*"%>
    
    <%
    ArrayList<CheckProject> list = (ArrayList<CheckProject>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/admin/admin.css">
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
    width: 80px;
    background:#3276b1;
    color:white;
    font-size:15px;
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
	margin-left: -325px;
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
/* 페이징 처리 CSS부분*/
.pageArea a {
display: inline-block;
    width: 32px;
    height: 32px;
    margin: 0 2px;
    border: 1px solid #d6d6d6;
    font-size: .75em;
    line-height: 32px;
    color: #999; 
    text-align: center;
    vertical-align: top;
    cursor:pointer;
}
/* .pageArea {
    margin: 40px 0;
    text-align: center;
    margin-top: 200px;
} */
.pageArea a:hover{
          color: #999; 
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

		<div id="text" style="margin-left: 90px;">
				<h2 id="web-font">
			<h3>펀딩 관리 > 펀딩 조회</h3>
			
			<!--  여기는 정렬 form -->
		<form action="<%=request.getContextPath()%>/sortProject.adm"
						method="get">			
							<div id="box">
							<div id="sortBox" border="1">
						<select name="sort">
							<th>프로젝트명</th>
							<th>사업자 이름</th>
							<th>마감 금액</th>
							<th>종료 날짜</th>
							<th>마감방식</th>
							<th>이자률</th>
							<th>달성률</th>
							<th>진행 상태</th>
							<option name="sortCondition" value="project_id">펀딩명</option>
							<option name="sortCondition" value="_name">이름</option>
							<option name="sortCondition" value="nickname">마감임박순</option>
							<option name="sortCondition" value="email">달성률순</option>
						</select>
						<button id="sortBtn" type="submit">정렬하기</button>
					</div>
									</form>
					<form action="<%=request.getContextPath()%>/searchProject.adm"
								method="get">
			
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

				
					
				<br><br><br>
				
		
		
				
					<table id="memberTable" border="1">
		<thead>
		<tr>
			<th>프로젝트명</th>
			<th>사업자 이름</th>
			<th>마감 금액</th>
			<th>종료 날짜</th>
			<th>마감방식</th>
			<th>이자률</th>
			<th>달성률</th>
			<th>진행 상태</th>
		</tr>
		</thead>
		<!--  여기 이제 값 뿌려줘해~ -->
		<%
			for (CheckProject cp : list) {
		%>
			
		<tr>
			<td><%= cp.getP_pName() %></td>
			<td><%= cp.getM_userName() %></td>
			<td><%= cp.getP_closingAmount() %></td>
			<td><%= cp.getTest() %></td>
			<td><%= cp.getPt_pName() %></td>
			<td><%= cp.getP_interestRate() %>%</td>
			<td><%= cp.getResult() %>%</td>
			 			<td><%= cp.getPr_status() %>

			
			
		
		</tr>
		<%
		}
		%>
		</table>
				</form>
					</form>
					
			  <%-- 페이지처리 --%>

        <div class="pageArea" id="datePaging" align="center">
			<a onclick="location.href='<%=request.getContextPath() %>/selectAllProject.adm?searchValue=<%=request.getParameter("searchValue")%>&currentPage=1'" class="link_fst">
			<span class="fa fa-angle-double-left" aria-hidden="true"><<</span></a>&#160;
			<% if (currentPage <= 1) { %>
				<a disabled class="link_prev"><</a>&#160;
			<% } else { %>
				<a onclick="location.href='<%=request.getContextPath() %>/selectAllProject.adm?searchValue=<%=request.getParameter("searchValue")%>&currentPage=<%=currentPage -1 %>'" class="link_prev"><</a>&#160;
			<% } %>
			
			<% for(int p = startPage;p<= endPage;p++) { 
					if(p==currentPage) { %>
						<a disabled class="link_page" style="background:lightgray;"><%= p %></a>
			<% 		} else { %>
						<a onclick="location.href='<%=request.getContextPath()%>/selectAllProject.adm?searchValue=<%=request.getParameter("searchValue")%>&currentPage=<%=p %>'" class="link_page"><%= p %></a>
			<%  	} %>
			<% } %>
			
			<% if(currentPage >= maxPage) { %>
				&#160;<a disabled class="link_next">></a>&#160;
			<% } else { %>
				&#160;<a onclick="location.href='<%=request.getContextPath()%>/selectAllProject.adm?searchValue=<%=request.getParameter("searchValue")%>&currentPage=<%=currentPage + 1%>'" class="link_next">></a>&#160;
			<% } %>
			<a onclick="location.href='<%=request.getContextPath()%>/selectAllProject.adm?searchValue=<%=request.getParameter("searchValue")%>&currentPage=<%=maxPage%>'" class="link_lst">>></a>
		</div>
        
		
		</div>
			</div>
	
	
</body>
</html>