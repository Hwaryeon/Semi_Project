<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.sp.message.model.vo.*, com.kh.sp.board.model.vo.*"%>
<%
ArrayList<Message> list 
= (ArrayList<Message>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();

ArrayList<Message> list2 
= (ArrayList<Message>)request.getAttribute("list2");
PageInfo pi2 = (PageInfo)request.getAttribute("pi2");
int listCount2 = pi2.getListCount();
int currentPage2 = pi2.getCurrentPage();
int maxPage2 = pi2.getMaxPage();
int startPage2 = pi2.getStartPage();
int endPage2 = pi2.getEndPage();

String pageType = (String)request.getAttribute("pageType");

%>
<!doctype html>
<html >
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Tabs - Vertical Tabs functionality</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/message/message.css">

<script>
  $( function() {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  } );
  </script>
<style>
.ui-tabs-vertical {
	width: 55em;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 12em;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: right;
	width: 40em;
}

#tabs ul li, #tabs ul li a {
	cursor: pointer;
}
</style>
</head>
<body>

	<div id="tabs">
		<ul style="margin-top: 108px;">
			<li ><a href="#tabs-1">받은 쪽지함</a></li>
			<li ><a href="#tabs-2">보낸 쪽지함</a></li>
			<!-- <li><a href="#tabs-3">Aenean lacinia</a></li> -->
		</ul>
		<% if(Integer.parseInt(pageType) == 1) { %>
			<div id="tabs-1" style="display: block;">
		<% }else{ %>
			<div id="tabs-1" style="display: none;">
		<% } %>
			<h2>받은 쪽지함</h2>
			<p>
			<div id="omcWrap">
				<main id="omcContainer" class="cont_main">
				<div id="cMain">
					<article id="mContent" class="layout_community">
						<div class="cont_comm">
							<div class="box_comm">
								<div class="tbl_list tbl_type_notice" style="height: 300px;">
									<div class="tbl">
										<div class="tbl_row head_group">
											<div class="tbl_cell cell_num">보낸사람</div>

											<div class="tbl_cell cell_tit">제목</div>

											<div class="tbl_cell cell_date">받은날짜</div>

											<div class="tbl_cell cell_date">읽은날짜</div>

											<!-- <div class="tbl_cell cell_hit">선택</div> -->

										</div>

										<form>
											<% for(Message m : list) { %>
											<div class="tbl_row body_group important">
												<div class="tbl_cell cell_num" id="bNo">
													
													<% if(m.getReceive_Nickname() != null){ %>
														<%= m.getReceive_Nickname() %>
													<% }else if(m.getReceive_UserName() != null){ %>
														<%= m.getReceive_UserName() %>
													<% }else{ %>
														익명
													<% } %>
												</div>
												<div class="tbl_cell cell_tit">
													<% int type=1; %>
													<% if( m.getRead_date() != null) {%>
													<a class="titleField" style="color: #cdcccc;"
														href="<%=request.getContextPath()%>/readMessage?num=<%= m.getMsg_id() %>&type=<%=type%>">


														<%=m.getTitle() %></a>
												</div>
												<% } else{%>
												<a class="titleField"
													href="<%=request.getContextPath()%>/readMessage?num=<%= m.getMsg_id() %>&type=<%=type%>">

													<img src="<%=request.getContextPath()%>/images/message/new.png" style="width:20px; height:20px; " id="newMsgArea" >
													<%=m.getTitle() %></a>
											</div>

											<% } %>
											<div class="tbl_cell cell_date"><%= m.getSend_date() %></div>
											<div class="tbl_cell cell_date">

												<% if(m.getRead_date() == null) { %>
												읽지않음
												<% }else { %>
												<%= m.getRead_date() %>
												<% } %>
											</div>
											<%-- <div class="tbl_cell cell_hit deleChk">

												<%int i =1; %>

												<input type="checkbox" id="chk<%=i%>" class="delGroup"
													name="delGroup" value="<%=m.getMsg_id()%>"> <label
													for="chk<%=i%>">선택</label>

											</div> --%>
									</div>


									<% } %>
									</form>
								</div>
							</div>


							<%-- 페이지 처리 --%>
							<div id="paging" class="paging_comm">
								<a
									onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=1'"
									class="link_fst"> <span class="fa fa-angle-double-left"
									aria-hidden="true"><<</span></a>&#160;
								<% if(currentPage <= 1) {%>
								<a disabled class="link_prev" style="background: darkgray;"><</a>&#160;

								<% }else{ %>
								<a
									onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=<%=currentPage - 1%>'"
									class="link_prev"><</a>&#160;
								<% } %>
								<% for(int p=startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
								<a disabled class="link_page" style="background: darkgray;"><%= p %></a>

								<% }else{ %>
								<a
									onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=<%=p %>'"
									class="link_page"><%= p %></a>
								<% } %>
								<% } %>

								<% if(currentPage >= maxPage){ %>
								&#160;<a disabled class="link_next"
									style="background: darkgray;">></a></a>&#160;

								<% }else { %>
								&#160;<a
									onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=<%=currentPage + 1%>'"
									class="link_next">></a>&#160;

								<% } %>
								<a
									onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=<%=maxPage%>'"
									class="link_lst">>></a>
							</div>


						</div>
				</div>
				</article>
			</div>
			</main>
		</div>


		</p>
	</div>
		<% if(Integer.parseInt(pageType) == 2) { %>
			<div id="tabs-2" style="display: block;">
		<% }else{ %>
			<div id="tabs-2" style="display: none;">
		<% } %>
		<h2>보낸 쪽지함</h2>
		<p>
		<div id="omcWrap">
			<main id="omcContainer" class="cont_main">
			<div id="cMain">
				<article id="mContent" class="layout_community">
					<div class="cont_comm">
						<div class="box_comm">
							<div class="tbl_list tbl_type_notice" style="height: 300px;">
								<div class="tbl">
									<div class="tbl_row head_group">
										<div class="tbl_cell cell_num">보낸사람</div>

										<div class="tbl_cell cell_tit">제목</div>

										<div class="tbl_cell cell_date">받은날짜</div>

										<div class="tbl_cell cell_date">읽은날짜</div>

										<!-- <div class="tbl_cell cell_hit">선택</div> -->

									</div>

									<form>
										<%int i =1; %>
										<% for(Message m : list2) { 
										
									%>
										<div class="tbl_row body_group important">
											<div class="tbl_cell cell_num" id="bNo">
												<% if(m.getReceive_Nickname() != null){ %>
														<%= m.getReceive_Nickname() %>
													<% }else if(m.getReceive_UserName() != null){ %>
														<%= m.getReceive_UserName() %>
													<% }else{ %>
														?
													<% } %>
											</div>
											<div class="tbl_cell cell_tit">
												<% int type=2; %>
												<% if( m.getRead_date() != null) {%>
												<a class="titleField" style="color: #cdcccc;"
													href="<%=request.getContextPath()%>/readMessage?num=<%= m.getMsg_id() %>&type=<%=type%>">


													<%=m.getTitle() %></a>
											</div>
											<% } else{%>
											<a class="titleField"
												href="<%=request.getContextPath()%>/readMessage?num=<%= m.getMsg_id() %>&type=<%=type%>">


												<%=m.getTitle() %></a>
										</div>

										<% } %>
										<div class="tbl_cell cell_date"><%= m.getSend_date() %></div>
										<div class="tbl_cell cell_date">

											<% if(m.getRead_date() == null) { %>
											읽지않음
											<% }else { %>
											<%= m.getRead_date() %>
											<% } %>
										</div>
											<% i = i +1; %>
										<%-- <div class="tbl_cell cell_hit deleChk">


											<input type="checkbox" id="chk<%=i%>" class="delGroup"
												name="delGroup" value="<%=m.getMsg_id()%>"> <label
												for="chk<%=i%>">선택</label>

										</div> --%>
								</div>


								<% } %>
								</form>






							</div>
						</div>


						<%-- 페이지 처리 --%>
						<div id="paging" class="paging_comm">
							<a
								onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=1'"
								class="link_fst"> <span class="fa fa-angle-double-left"
								aria-hidden="true"><<</span></a>&#160;
							<% if(currentPage2 <= 1) {%>
							<a disabled class="link_prev" style="background: darkgray;"><</a>&#160;

							<% }else{ %>
							<a
								onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=<%=currentPage2 - 1%>'"
								class="link_prev"><</a>&#160;
							<% } %>
							<% for(int p=startPage2; p <= endPage2; p++){ 
				if(p == currentPage2){
			%>
							<a disabled class="link_page" style="background: darkgray;"><%= p %></a>

							<% }else{ %>
							<a
								onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=<%=p %>'"
								class="link_page"><%= p %></a>
							<% } %>
							<% } %>

							<% if(currentPage2 >= maxPage2){ %>
							&#160;<a disabled class="link_next" style="background: darkgray;">></a></a>&#160;

							<% }else { %>
							&#160;<a
								onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=<%=currentPage2 + 1%>'"
								class="link_next">></a>&#160;

							<% } %>
							<a
								onclick="location.href='<%=request.getContextPath()%>/listMessage?currentPage=<%=maxPage2%>'"
								class="link_lst">>></a>
						</div>


					</div>
			</div>
			</article>
		</div>
		</main>
	</div>
	<!-- <div id="tabs-3">
    <h2>Content heading 3</h2>
    <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
    <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
  </div>  -->
	</div>

	<script>
	
		$('.deleChk').click(function(){
			
			var num = $(this).children('input').value;
			console.log(num);
			
			console.log(document.getElementById('chk1').value);
			
			

			
		});
	
			$('#chk1:checked').each(function() { 
		        alert($(this).val());
		   });
	</script>


</body>
</html>