<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.sp.member.model.vo.*, 
	com.kh.sp.admin.model.vo.*"%>
<%
	ArrayList<Member> rankList = (ArrayList<Member>) request.getAttribute("rankList");
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
<meta charset="UTF-8">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/admin.css">

<style>
html {
	margin-top: 86px;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

th {
	background-color: #66CDAA;
}

thead {
	background-color: #66CDAA;
}

table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	text-align: center;
}

table tr td a {
	text-decoration: none;
	color: black;
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
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp"%>
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
	<div id="text">
		<h2>회원관리 > 투자자 등급 심사</h2>
		<br>

		<form id="updateRankForm"
			action="<%=request.getContextPath()%>/updateInvRank.adm" method="get">

			<table align="center">
				<thead>
					<tr>
						<th width="80%" colspan="5">투자자List</th>
						<th width="22%" rowspan="2">승인여부</th>
					</tr>
					<tr>
						<th>투자자ID</th>
						<th>이름</th>
						<th>현재 등급</th>
						<th>변경 요청한 등급</th>
						<th>증빙서류</th>
					</tr>
				</thead>
				<%for (Member m : rankList) {%>
					<input type="hidden" id="userId" name="user_id" value="<%=m.getUserId()%>">
				<tr>
					<td><%= m.getUserId() %></td>
					<td><%= m.getUserName() %></td>
					<td><%= m.getInvestorGrade() %></td>
					<td></td>
					<td><button>파일 열람</button></td>
					<td><a class='btn btn-info btn-xs' data-target="#myModal"
						onClick="updateRank();" data-toggle="modal" href="#"><span
							class="glyphicon glyphicon-edit"></span>승인</a> <a href="#"
						class="btn btn-danger btn-xs"><span
							class="glyphicon glyphicon-remove"></span>미승인</a></td>
				</tr>
				
				<%
							}
						%>
			</table>
	</form>

			<!--  <script>
				$(function(){
				<%for (Member m : rankList) {%>
					$("table").append("<tr>");
					
					var user_id = <%=m.getUserId()%>;
										$("#userId").val(user_id);
					
					
					$("table tr").last().append("<td>" + '<%=m.getUserId()%>' + "</td>");
					$("table tr").last().append("<td>" + '<%=m.getUserName()%>' + "</td>");
					$("table tr").last().append("<td>" + '<%=m.getInvestorGrade()%>' + "</td>");
					$("table tr").last().append("<td></td>");
					$("table tr").last().append("<td>" + "<button>파일 열람</button>" + "</td>");
					
					 이렇게는 될리가 없구 
					
					 	$("table tr").last().append("<td>"+"<a class='btn btn-info btn-xs' data-target="#myModal"
						onClick="updateRank();" data-toggle="modal" href="#">"+"<span
							class="glyphicon glyphicon-edit">"+"</span>"+"승인"+"</a>"+" <a href="#"
						class="btn btn-danger btn-xs">"+"<span
							class="glyphicon glyphicon-remove">"+"+"</span>"+"미승인"+"</a>"+"</td>"); 
 
							$("table").append("</tr>");	

							

				
				<%}%>
		
			});
		</script>
		-->


			<div>
				<%-- 페이지처리 --%>
				<div class="pageArea" align="center">
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm.adm?currentPage=1'"><<</button>
					<%
							if (currentPage <= 1) {
						%>
					<button disabled><</button>
					<%
							} else {
						%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm.adm?currentPage=<%=currentPage - 1%>'"><</button>
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
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm?currentPage=<%=p%>'"><%=p%></button>
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
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm?currentPage=<%=currentPage + 1%>'">></button>
					<%
							}
						%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm?currentPage=<%=maxPage%>'">>></button>

				</div>
			</div>
	</div>



	</div>
	<script>
		$('.btn-xs').click(function(){
			console.log("클릭");
			var id = $(this).parent().parent().children().eq(0).text();
			
			console.log("id : " +id); 
			$("#userId").val(id); 
			$("#updateRankForm").submit(); 

		});
		

	
		<%-- function updateRank(){
		

			

			var user_id = <%=m.getUserId()%>;
			var user_id = document.getElementById('userId').value;
			/* $("#userId").val(user_id); */
			console.log("user_id : " + user_id);
			
		
		}; --%>
	
	</script>





</body>
</html>