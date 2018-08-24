<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.board.model.vo.*, java.util.*"%>
<%
	Board board = (Board) request.getAttribute("board");
	String content = board.getText();
	PageNP np = (PageNP) request.getAttribute("np");
	
	Attachment attachFile1 = null;
	Attachment attachFile2 = null;
	Attachment attachFile3 = null;
	
	if(request.getAttribute("fileList") != null){
	
		ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
		for(int i=0; i < fileList.size(); i++){
			
			switch(i){
				case 0 : attachFile1 = fileList.get(i); break;
				case 1 : attachFile2 = fileList.get(i); break;
				case 2 : attachFile3 = fileList.get(i); break;
			}
			
		}
	}
	
	
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>홈페이지 : 커뮤니티</title>

<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/board/board.css">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/board/boardRead.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "input" ).checkboxradio({
      icon: false
    });
  } );
  </script>
  
   <style>
  
  	.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    background: #8ddc8f;
}

/*클릭시 포커스 대상 테두리 밝기  */
.ui-visual-focus {
	box-shadow: 0 0 3px 1px rgb(94, 158, 214);
}
  .layer{
	color: #000000a3;
    font-size: 20px;
    font-weight: 400;

}
.field_attachments {
    border-top: 2px solid #999;
    padding: 30px 0;
}
.field_attachments dl {
    float: right;
}
.field_attachments dt {
    margin-right: 20px;
}
.field_attachments dt {
    float: left;
    font-size: .875em;
}

.field_attachments dl dd a{
	   cursor:pointer;
}

/* .fa-paperclip{
	float:right;
} */

.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.field_attachments dd {
    float: left;
    font-size: .875em;
}

.link_list{
	cursor:pointer;
}

  </style>

</head>
<body>
<%@ include file="../common/headBar.jsp" %>
   	    <!-- header -->
		<main id="omcContainer" class="cont_main">
			
			<!-- aside --> 
			
			<!-- aside -->
	    	
			<div id="cMain">
				<article id="mContent" class="layout_community">
					<header class="head_banner">
						<div class="hero"><img src="<%=request.getContextPath()%>/images/common/img_media_newsletter1.jpg" style="width:100%;" alt="공지사항 배경 이미지 입니다." class="img_rwd"></div>
						<div class="layer">
							<h1 class="tit_comm">Notice</h1>
							<p class="txt_comm"></p>
						</div>
					</header>
				
					<div class="cont_comm">
						<div class="box_comm">
							<div class="detailview_wrap">
								<div class="field_tit"><%= board.getTitle() %></div>
		
								<div class="field_regist">
									<div class="item_wrap">
										<div class="item">
											<dl>
												<dt>등록일</dt>
												<dd><%= board.getrDate() %></dd>
											</dl>
										</div>
										<div class="item">
											<dl>
												<dt>등록자</dt>
												<dd>
												<%if(board.getuId() == 1) { %>
													관리자
												
												<% } else {%>
													<%= board.getuId() %>
												<% } %>
												</dd>
											</dl>
										</div>
									</div>
								</div>
		
								<div class="field_content article_intro" style="min-height:350px;">
							<%=content%>	
								
								</div>
								
								
								
								<% if( attachFile1 != null) {%>
									<%-- <%= attachFile1.getOriginName() %> --%>
										<div class="field_attachments">
											<dl>
												<dt><span class="fa fa-paperclip"></span> 첨부파일</dt>
												<dd><a onclick="location.href='<%=request.getContextPath()%>/downloadBoard?num=<%=attachFile1.getFid()%>'"><%=attachFile1.getOriginName() %></a></dd>
											
											
											</dl>
												<% if( attachFile2 != null) {%>
												<br>
													<dl>
														<dt><span class="fa fa-paperclip"></span> 첨부파일</dt>
														<dd><a onclick="location.href='<%=request.getContextPath()%>/downloadBoard?num=<%=attachFile2.getFid()%>'"><%=attachFile2.getOriginName() %></a></dd>
													</dl>
												
												<% } %>
												<% if( attachFile3 != null) {%>
												<br>
													<dl>
														<dt><span class="fa fa-paperclip"></span> 첨부파일</dt>
														<dd><a onclick="location.href='<%=request.getContextPath()%>/downloadBoard?num=<%=attachFile3.getFid()%>'"><%=attachFile3.getOriginName() %></a></dd>
													</dl>
												
												<% } %>
										</div>
									
								<%-- 	<button onclick="location.href='<%=request.getContextPath()%>/downloadBoard?num=<%=attachFile1.getFid()%>'">다운로드</button>
								 --%>
								 <br>
								 <br>
								 <% } %>
								
								
								
								
							<%-- 	<div id="insertFileDiv" class="field_content article_intro file_input">
									<span>첨부파일 다운로드</span>
									<br>
									<span>
									<% if( attachFile1 != null) {%>
									<%= attachFile1.getOriginName() %>
									
									<button onclick="location.href='<%=request.getContextPath()%>/downloadBoard?num=<%=attachFile1.getFid()%>'">다운로드</button>
									<% } %>
									</span>
					
									<br>
									<span>
									<% if( attachFile2 != null) {%>
									<%= attachFile2.getOriginName() %>
									<button onclick="location.href='<%=request.getContextPath()%>/downloadBoard?num=<%=attachFile2.getFid()%>'">다운로드</button>
									<% } %>
									</span>
									<br>
									<span>
									<% if( attachFile3 != null) {%>
									<%= attachFile3.getOriginName() %>
									<button onclick="location.href='<%=request.getContextPath()%>/downloadBoard?num=<%=attachFile3.getFid()%>'">다운로드</button>
									<% } %>
									</span>
								
								</div> --%>
								
								
		
								<div class="siblings_post">
									<div class="previous">
										<dl>
											<dt>이전글</dt>
											
												
													<dd>
														<p>
														<% if(np.getPrev_title() == null){ %>
															이전글이 없습니다.
													<% } else { %>
														<a href="<%=request.getContextPath()%>/boardRead.jsp?num=<%= np.getPrev_bNum() %>">
														<%= np.getPrev_title() %></a></p>
														<% } %>
													</dd>
												
												
											
										</dl>
									</div>
									
									<div class="next">
										<dl>
											<dt>다음글</dt>
											
												
												
													<dd><p>
														<% if(np.getNext_title() == null){ %>
															다음글이 없습니다.
													<% } else { %>
														<a href="<%=request.getContextPath()%>/boardRead.jsp?num=<%= np.getNext_bNum() %>">
														<%= np.getNext_title() %></a></p>
														<% } %>
													</dd>
												
											
										</dl>
									</div>
								</div>
		
								<div class="field_foot_btn">
									<a onclick="allBoard();" class="link_list">목록</a>
									<button style="margin-left: 30px;"onclick="updateBoard();" id="save" class="link_list">수정</button>
								</div>
								<script>
								function allBoard(){
									location.href="<%=request.getContextPath()%>/allBoard";
								}
								function updateBoard(){
									
									var wNo = <%= board.getwNo() %>;
									
									var type=1;
									
									location.href="<%=request.getContextPath()%>/selectBoard?wNo="+wNo+"&type=" +type ;
									
									
								}
							</script>
							</div>
						</div>
					</div>
				</article>
			</div>
		</main>



    </div>
</body>
</html>