<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.myPage.model.vo.*"%>
    <% ArrayList<MypageDetail> list = (ArrayList<MypageDetail>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	System.out.println("그래서 현재 페이지는..? : " + currentPage);
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
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
		font-size:20px;
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
					<th colspan="2" width="100px" height="50px">번호</th>
					<th colspan="6" width="300px" height="50px">제목</th>
					<th colspan="2" width="100px" height="50px">상태</th>
					<% if(loginUser.getUserClass().equals("investor")) { %>
						<th colspan="2" width="100px" height="50px">비고</th>
					<% } %>
				</tr>
				<% int i=1;
					for(MypageDetail md : list) { %>
				<tr>
					<td colspan="2" width="100px" height="50px"><%=i %>번</td>
					<td colspan="6" width="300px" height="50px"><%= md.getP_name() %></td>
					<td colspan="2" width="100px" height="50px"><%-- <%= md.getStatus() %> --%>
					<% if(md.getStatus().equals("enroll")) { %> 승인대기중
					<% } else if(md.getStatus().equals("enrollApproval")) {%>모집중
					<% } else if(md.getStatus().equals("end")) {%>모집완료
					<% } else if(md.getStatus().equals("endApproval")) {%>채권 지급 완료
					<% } else if(md.getStatus().equals("repay")) { %>상환완료<% } %>
					</td>
					<td>
					<% if(loginUser.getUserClass().equals("investor")) { 
						if(md.getStatus().equals("enrollApproval")) { %>
					<button class="btn-primary btn">환불하기</button>
					<% } } %>
					</td>
				</tr>
				
				<tr></tr>
				<tr></tr>
				<% i++; } %>
			</table>
		</div>
		
		<div id="paging" class="paging_comm" align="center">
			<a onclick="location.href='<%=request.getContextPath()%>/select.ep?userid=<%= loginUser.getUserId()%>&userclass=<%= loginUser.getUserClass() %>'" class="link_fst" >
							    	<span class="fa fa-angle-double-left" aria-hidden="true"><<</span></a>&#160;
			<% if(currentPage <= 1) {%>
				<a disabled class="link_prev" style="background:darkgray;"><</a>&#160;
				
			<% }else{ %>
				<a onclick="location.href='<%=request.getContextPath()%>/select.ep?currentPage=<%=currentPage - 1%>&userid=<%= loginUser.getUserId() %>&userclass=<%= loginUser.getUserClass() %>'" class="link_prev" ><</a>&#160;
			<% } %>
			<% for(int p=startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
					<a disabled class="link_page" style="background:darkgray;"><%= p %></a>
			
			<% }else{ %> 
					<a onclick="location.href='<%=request.getContextPath()%>/select.ep?currentPage=<%=p %>&userid=<%= loginUser.getUserId() %>&userclass=<%= loginUser.getUserClass() %>'" class="link_page"><%= p %></a>
				<% } %>
			<% } %>
			
			<% if(currentPage >= maxPage){ %>
				&#160;<a disabled class="link_next" style="background:darkgray;">></a></a>&#160;
			
			<% }else { %>
				&#160;<a onclick="location.href='<%=request.getContextPath()%>/select.ep?currentPage=<%=currentPage + 1%>&userid=<%= loginUser.getUserId() %>&userclass=<%= loginUser.getUserClass() %>'" class="link_next">></a>&#160;
			
			<% } %>
				<a onclick="location.href='<%=request.getContextPath()%>/select.ep?currentPage=<%=maxPage%>&userid=<%= loginUser.getUserId() %>&userclass=<%= loginUser.getUserClass() %>'" class="link_lst">>></a>
		</div>
	</div>
</body>
</html>