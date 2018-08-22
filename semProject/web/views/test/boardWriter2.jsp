<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시글 수정 화면</title>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board/board.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board/boardRead.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board/boardWrite.css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
<%@ include file="../common/headBar.jsp" %>
	<!-- header -->
	<main id="omcContainer" class="cont_main"> <!-- aside --> <!-- aside -->

	<div id="cMain">
		<article id="mContent" class="layout_community">
			<header class="head_banner">
				<div class="hero">
					<img
						src="<%=request.getContextPath()%>/images/board/img_notice_banner_pc.jpg"
						alt="공지사항 배경 이미지 입니다." class="img_rwd">
				</div>
				<div class="layer">
					<h1 class="tit_comm">Notice</h1>
					<p class="txt_comm">게시글 등록하기</p>
				</div>
			</header>
			<form action="/sp/write" method="post" id="frm">
				<div class="cont_comm">
					<div class="box_comm">
						<div class="detailview_wrap">
							<div class="field_tit">
								<div class="title1">제목</div>
								<div class="title2">

									<input type="text" style="width: 100%; color: #8C8C8C;"
										name="noticeTitle" id="noticeTitle" value="" />


								</div>


							</div>

							<div class="field_regist">
								<div class="item_wrap">
									<div class="item">
										<dl>
											<dt>등록일</dt>
											<dd>2018-08-02</dd>
										</dl>
									</div>
									<div class="item">
										<dl>
											<dt>등록자</dt>
											<dd>관리자</dd>
										</dl>
									</div>
								</div>
							</div>
							<div class="notice">
								<div class="notice1">공지사항 등록 여부</div>
								<div class="notice2">
									<input type="radio" style="width: 16px; height: 16px;"
										name="viewType" id="viewTypea" value="A" />등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" style="width: 16px; height: 16px;"
										name="viewType" id="viewTypeb" value="B" /> 등록안함
								</div>
							</div>

							<div class="boardType">
								<div class="type1">글종류</div>
								<div class="type2">
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="classify"
										id="classifya" value="A" />&nbsp;안내</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="classify"
										id="classifyb" value="B" />&nbsp;모집</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="classify"
										id="classifyc" value="C" />&nbsp;이벤트</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="classify"
										id="classifyd" value="D" />&nbsp;일반</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="classify"
										id="classifye" value="E" />&nbsp;펀딩tip</label>
								</div>
							</div>





							<div id="summernote" class="field_content article_intro" style="min-width:800px;">
								<!-- <textarea id="ir1" class="content" cols="10" placeholder=""
									name="content" class="form-control"></textarea> -->
							</div>

							<div class="field_content article_intro">
								<input type="file" class="w100_t" name="files[0]" />

							</div>



							<div class="field_foot_btn">
								<a onclick="allBoard();" class="link_list">목록</a>
								<a onclick="allBoard();" id="save" class="link_list">등록</a>
								<!-- <input id="save" class="link_list" style="cursor:pointer;"> -->
							</div>
							<script>
								function allBoard(){
									location.href="<%=request.getContextPath()%>/allBoard";
								}
								
								$(document).ready(function() {
									  $('#summernote').summernote();
									});
								$('#summernote').summernote({
									  height: 500,                 // set editor height
									  minWidth:null,
									  minHeight: 500,             // set minimum height of editor
									  maxHeight: null,             // set maximum height of editor
									  focus: true                  // set focus to editable area after initializing summernote
									});
							</script>
							
						</div>
					</div>
				</div>
			</form>
		</article>
	</div>
	</main>
	

	</div>
</body>
</html>