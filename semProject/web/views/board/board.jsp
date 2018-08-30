<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.board.model.vo.*"%>
<%
ArrayList<Board> list 
= (ArrayList<Board>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 상단바 온오프 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<title>커뮤니티</title>
	

<!-- 
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"> -->
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/board/board.css">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/board/boardRead.css">
<style>
.paging_comm a {
    cursor:pointer;
}


.layer{
	color: #000000a3;
    font-size: 20px;
    font-weight: 400;

}

.btn_search{
	cursor:pointer;
}

.body_group:hover{
	background:#c3bebe;
	cursor:pointer;
	color:blue;
}

</style>

<script>
/* $(function(){
	$('.body_group').mouseenter(function(){

	 	$(this).children.('titleField').css("color", "red");
	
	});
}); */

</script>

</head>
<body>
   
  <%@ include file="../common/headBar.jsp" %>
    <div id="omcWrap" style="min-width:1400px;">
		<main id="omcContainer" class="cont_main">
			<div id="cMain">
				<article id="mContent" class="layout_community">
					<header class="head_banner">
						<div class="hero"><img src="<%=request.getContextPath()%>/images/common/img_media_newsletter1.jpg" style="width:100%;"alt="공지사항 배경 이미지 입니다." class="img_rwd"></div>
						<div class="layer">
							<h1 class="tit_comm">Notice</h1>
							<p class="txt_comm"></p>
						</div>
					</header>
					<div class="cont_comm">
						<div class="box_comm">
							
							<form action="<%=request.getContextPath()%>/searchBoard" method="post" id="searchForm" name="searchForm">
								<div class="search_field">
									<h2 class="screen_out">공지사항 검색</h2>
									<div class="search_group">
										<input type="text" class="input_txt" name="searchKeyword" id="searchKeyword" title="검색 입력">
										<div class="cell_btn">
											<input type="submit" class="btn_search" id="noticeSearch" value="검색"/>
										</div>
									</div>
								</div>
							</form>
		
							<form id="listForm" name="listForm">
								<input id="pageIndex" name="pageIndex" type="hidden" value="1" />
								<input name="searchKeyword" type="hidden" value="" />
							</form>
							 <div class="tbl_list tbl_type_notice" style="height:300px;">
								<div class="tbl">
									<div class="tbl_row head_group">
										<div class="tbl_cell cell_num">번호</div>
										<div class="tbl_cell cell_tit">제목</div>
										<div class="tbl_cell cell_date">등록일</div>
										<div class="tbl_cell cell_hit">조회수</div>
									</div>
									
									
									
									
									
									<% for(Board b : list) { 
										
									%>
									<div class="tbl_row body_group important" > <!-- 공지 글일때 important 클래스 추가 -->
										<div class="tbl_cell cell_num" id="bNo" >
										<% if(b.getNoticeYn().equals("Y")) { %>[공지]
										<% }else{ %>
										<%= b.getwNo() %>
										<% } %> 
										</div>
								<div class="tbl_cell cell_tit">
								<%-- <a href="<%=request.getContextPath()%>/boardRead.jsp?num=<%= b.getwNo() %>"> --%>
									<a class="titleField" href="<%=request.getContextPath()%>/boardRead.jsp?num=<%= b.getwNo() %>">
										<% if(b.getNoticeType().equals("A")){ %>
										[안내]
										<% } else if(b.getNoticeType().equals("B")) {%>
										[모집]
										<% } else if(b.getNoticeType().equals("C")) {%>
										[이벤트]
										<% } else if(b.getNoticeType().equals("D")) {%>
										[일반]
										<% } else { %>
										[펀딩tip]
										<% } %>
										<%= b.getTitle() %>
										</a>
										</div>
										<div class="tbl_cell cell_date"><%= b.getrDate() %></div>
										<div class="tbl_cell cell_hit">
											<%= b.getpView() %>
										</div>
									</div>
										
									
									<% } %>
									
								
									
									
									
								</div>
							</div>
								<% if(loginUser != null) { %>
									<% if(loginUser.getUserId() == 0 ){ %>
										<div id= "registText" class="field_foot_btn">
											<a href="<%=request.getContextPath()%>/views/board/boardWriter.jsp" class="link_list">글등록</a>
										</div>
									<% } %>
								<% } %>
								
									<%-- 페이지 처리 --%>
		<div id="paging" class="paging_comm" >
			<a onclick="location.href='<%=request.getContextPath()%>/allBoard?currentPage=1'" class="link_fst" >
							    	<span class="fa fa-angle-double-left" aria-hidden="true"><<</span></a>&#160;
			<% if(currentPage <= 1) {%>
				<a disabled class="link_prev" style="background:darkgray;"><</a>&#160;
				
			<% }else{ %>
				<a onclick="location.href='<%=request.getContextPath()%>/allBoard?currentPage=<%=currentPage - 1%>'" class="link_prev" ><</a>&#160;
			<% } %>
			<% for(int p=startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
					<a disabled class="link_page" style="background:darkgray;"><%= p %></a>
			
			<% }else{ %>
					<a onclick="location.href='<%=request.getContextPath()%>/allBoard?currentPage=<%=p %>'" class="link_page"><%= p %></a>
				<% } %>
			<% } %>
			
			<% if(currentPage >= maxPage){ %>
				&#160;<a disabled class="link_next" style="background:darkgray;">></a></a>&#160;
			
			<% }else { %>
				&#160;<a onclick="location.href='<%=request.getContextPath()%>/allBoard?currentPage=<%=currentPage + 1%>'" class="link_next">></a>&#160;
			
			<% } %>
				<a onclick="location.href='<%=request.getContextPath()%>/allBoard?currentPage=<%=maxPage%>'" class="link_lst">>></a>
		</div>
							
						</div>
					</div>
				</article>
			</div>
			
		</main>		
		
				</script>
		<!-- footer -->


<!--Start of Tawk.to Script-->

<!-- 웹소캣부분인것같음 -->
<!-- 
<script type="text/javascript">
    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/58f81e30f7bbaa72709c735c/default';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>  -->



    	
    </div>	
</body>
</html>