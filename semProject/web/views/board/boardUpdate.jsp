<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.sp.board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("b");

	Attachment attachFile1 = null;
	Attachment attachFile2 = null;
	Attachment attachFile3 = null;
	int attachCount = 0;
	
	if(request.getAttribute("fileList") != null){
	
		ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
		for(int i=0; i < fileList.size(); i++){
			
			switch(i){
				case 0 : attachFile1 = fileList.get(i); attachCount++; break;
				case 1 : attachFile2 = fileList.get(i); attachCount++; break;
				case 2 : attachFile3 = fileList.get(i); attachCount++; break;
			}
			
		}
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시글 수정 화면</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board/board.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board/boardRead.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board/boardWrite.css">
<style>
.layer{
	color: #000000a3;
    font-size: 20px;
    font-weight: 400;
}
.link_list{
	cursor:pointer;
}

	#insertFileDiv file{
		width: 300px;
   		float: left;
	}
	
.file_input label, .button-delete-file {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:30px;
    background:#777;
    color:#fff;
    text-align:center;
    line-height:30px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:middle;
    display:inline-block;
    width:400px;
    height:28px;
    line-height:28px;
    font-size:11px;
    padding:0;
    border:0;
    border:1px solid #777;
}

#testFile{
	position: relative;
    cursor: pointer;
    display: inline-block;
    vertical-align: middle;
    overflow: hidden;
    width: 168px;
    height: 30px;
    background: #777;
    color: #fff;
    text-align: center;
    line-height: 30px;
	cursor:pointer;
	font-size:15px;
}

.layer{
	color: #000000a3;
    font-size: 20px;
    font-weight: 400;

}


</style>
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
						src="<%=request.getContextPath()%>/images/common/img_media_newsletter1.jpg" style="width:100%;"
						alt="공지사항 배경 이미지 입니다." class="img_rwd">
				</div>
				<div class="layer">
					<h1 class="tit_comm">Notice</h1>
					<p class="txt_comm">게시글 등록하기</p>
				</div>
			</header>
			<form id ="insertForm"  method="post" id="frm" encType="multipart/form-data">
			<!-- <form id ="insertForm"  method="post" id="frm"> -->
				<div class="cont_comm">
					<div class="box_comm">
						<div class="detailview_wrap">
							<div class="field_tit">
								<div class="title1">제목</div>
								<div class="title2">

									<input type="text" style="width: 100%; color: #8C8C8C;"
										name="noticeTitle" id="noticeTitle" value="<%=b.getTitle() %>" />
									<input type="hidden" name="wNo" value="<%=b.getwNo()%>">

								</div>


							</div>

							<div class="field_regist">
								<div class="item_wrap">
									<div class="item">
										<dl>
											<dt>등록일</dt>
											<dd><%= b.getrDate() %></dd>
										</dl>
									</div>
									<div class="item">
										<dl>
												<dt>등록자</dt>
												<dd>
												<%if(b.getuId() == 1) { %>
													관리자
												
												<% } else {%>
													<%= b.getuId() %>
												<% } %>
												<input type="hidden" name="uId" value="<%=b.getuId()%>">
												</dd>
											</dl>
									</div>
								</div>
							</div>
							<div class="notice">
								<div class="notice1">공지사항 등록 여부</div>
								<div class="notice2">
							
								<% if(b.getNoticeYn().equals("A")) {%>
							
										<input type="radio" checked style="width: 16px; height: 16px;"
										name="viewType" id="viewTypea" value="A" />등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" style="width: 16px; height: 16px;"
										name="viewType" id="viewTypeb" value="B" /> 등록안함
								<% }else{ %>
									<input type="radio" style="width: 16px; height: 16px;"
										name="viewType" id="viewTypea" value="A" />등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" style="width: 16px; height: 16px;"
										name="viewType" checked id="viewTypeb" value="B" /> 등록안함
							
								<% } %>
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

							<div class="field_content article_intro">
									<div id="summernote"><%= b.getText() %></div>
									<input type="hidden" value="" name="mainText" id="mainText">
							</div>

							<div id="insertFileDiv" class="field_content article_intro file_input">
								<a id="testFile" >첨부파일 + (최대 3개)</a>
								<br>
								<br>
							<% if(attachFile1 == null){ %>
								<label>File Attach
									<input type="file" id='insertFile0' name='insertFile0' multiple onchange="javascript:document.getElementById('file_route0').value=this.value"/>
								</label>
								<input type="hidden" id='insertFileName0' name='inserFileName0' value=""> 
								<input type="text" readonly="readonly" title="File Route0" id="file_route0">
								<% } else{ %>
								<label>File Attach
									<input type="file" id='insertFile0' value="" name='insertFile0' multiple onchange="javascript:document.getElementById('file_route0').value=this.value"/>
								</label>
								<input type="hidden" id='FileId0' name='FileId0' value="<%=attachFile1.getFid()%>"> 
								<input type="hidden" id='FileName0' name='FileName0' value="<%=attachFile1.getOriginName()%>">
								<input type="text" readonly="readonly" title="File Route0" id="file_route0" value="<%=attachFile1.getFilePath()%><%=attachFile1.getOriginName()%> ">
								<% } %>
								
								<%if(attachFile2 == null) {%>
								
								<div id="insertFileAdd1" style="display:none;">
									<label>File Attach
									<input type="file" id='insertFile1' name='insertFile1' multiple onchange="javascript:document.getElementById('file_route1').value=this.value"/>
								</label>
								<input type="hidden" id='insertFileName1' name='inserFileName1' value=""> 
								<input type="text" readonly="readonly" title="File Route1" id="file_route1">
								<a class='button-delete-file'>삭제</a>
								</div>
								
								<% }else{ %>
								
								<div id="insertFileAdd1" style="display:block;">
									<label>File Attach
									<input type="file" id='insertFile1' value="" name='insertFile1' multiple onchange="javascript:document.getElementById('file_route1').value=this.value"/>
								</label>
								<input type="hidden" id='FileId1' name='FileId0' value="<%=attachFile2.getFid()%>"> 
								<input type="hidden" id='FileName1' name='FileName0' value="<%=attachFile2.getOriginName()%>">
								<input type="text" readonly="readonly" title="File Route1" id="file_route1" value="<%=attachFile2.getFilePath()%><%=attachFile2.getOriginName()%> ">
								<a class='button-delete-file'>삭제</a>
								
								<% } %>
								
								<% if(attachFile3 == null) { %>
								
								<div id="insertFileAdd2" style="display:none;">
									<label>File Attach
									<input type="file" id='insertFile2' name='insertFile2' multiple onchange="javascript:document.getElementById('file_route2').value=this.value"/>
								</label>
								<input type="hidden" id='insertFileName2' name='inserFileName2' value=""> 
								<input type="text" readonly="readonly" title="File Route2" id="file_route2">
								<a class='button-delete-file'>삭제</a>
								</div>
								
								<% }else{ %>
									<div id="insertFileAdd2" style="display:block;">
									<label>File Attach
									<input type="file" id='insertFile2' value="" name='insertFile2' multiple onchange="javascript:document.getElementById('file_route2').value=this.value"/>
									</label>
									<input type="hidden" id='FileId2' name='FileId0' value="<%=attachFile3.getFid()%>"> 
									<input type="hidden" id='FileName2' name='FileName0' value="<%=attachFile3.getOriginName()%>">
									<input type="text" readonly="readonly" title="File Route2" id="file_route2" value="<%=attachFile3.getFilePath()%><%=attachFile3.getOriginName()%> ">
									<a class='button-delete-file'>삭제</a>
									</div>
								<% } %>
								
							</div>



							<div class="field_foot_btn">
								<a onclick="allBoard();" class="link_list">목록</a>
								<button onclick="updateBoard();" id="update" class="link_list">수정
								</button>
								<a onclick="deleteBoard();" id="delete" class="link_list">삭제</a>
								
							</div>
						</div>
					</div>
				</div>
			</form>
			
			
			
							<script>
							
								function allBoard(){
									location.href="<%=request.getContextPath()%>/allBoard";
								}
								function updateBoard(){
									
									var code = $('#summernote').summernote('code');
									
									if(document.getElementById('noticeTitle').value == ""){
										alert("제목을 입력해주세요.");
									}else if((document.getElementById('viewTypea').checked == false) 
											&& document.getElementById('viewTypeb').checked == false){
										alert("공지사항 여부를 체크해주세요.")	
									}else if((document.getElementById('classifya').checked) == false
											&& (document.getElementById('classifyb').checked) == false
											&& (document.getElementById('classifyc').checked) == false
											&& (document.getElementById('classifyd').checked) == false
											&& (document.getElementById('classifye').checked) == false
									){
										alert("글종류를 선택해주세요.")	
									}else if(((($('#summernote').summernote('code')).length) > 11) == false){
										alert("본문을 입력해주세요.")
									}else{
										
										var count = 0;
										
										
										if(document.getElementById('insertFile0').value == ""){
											count++;
											/* $("#insertFileAdd0").remove(); */
										}
										if(document.getElementById('insertFile1').value == ""){
											count++;
											/* $("#insertFileAdd1").remove(); */
										}
										if(document.getElementById('insertFile2').value == ""){
											count++;
											/* $("#insertFileAdd2").remove(); */
										}
										
											
									 	$('#mainText').val(code);
										$("#insertForm").attr("action", "<%=request.getContextPath()%>/updateBoard?count="+count);
										$("#insertForm").submit();
										 
									 }
									
								}
								
								function deleteBoard(){
									console.log("클릭");
									var wNo = <%= b.getwNo()%>;
									location.href="<%=request.getContextPath()%>/deleteBoard?wNo="+wNo;
									
								}
								
								$(document).ready(function() {
									  $('#summernote').summernote();
									});
								
								$('#summernote').summernote({
									  height: 300,                 // set editor height
									  minHeight: 400,             // set minimum height of editor
									  maxHeight: 600,             // set maximum height of editor
									  focus: true,                  // set focus to editable area after initializing summernote
									   callbacks: { // 콜백을 사용
					                        // 이미지를 업로드할 경우 이벤트를 발생
										    onImageUpload: function(files, editor, welEditable) {
										    	 console.log(files);
									        	  console.log(editor);
									        	  console.log(welEditable);
									        	  
											     sendFile(files[0], this); 
											},
											
											onMediaDelete : function(target) {
							                     /*  alert(target[0].src); */
							                      deleteFile(target[0].src);
							                      console.log(target[0].src)
							               }
											
											
										}  
								
								
								});
								
								/* summernote에서 이미지 업로드시 실행할 함수 */
							 	 function sendFile(file, editor) {
						            // 파일 전송을 위한 폼생성
							 		data = new FormData();
							 	    data.append("uploadFile", file);
							 	    $.ajax({ // ajax를 통해 파일 업로드 처리
							 	        data : data,
							 	        type : "POST",
							 	       <%--  url : "<%= request.getContextPath()%>/views/board/boardImageUpload.jsp", --%>
							 	      	url : "<%= request.getContextPath() %>/imageBoard?wNo="+<%=b.getwNo()%>,
							 	        cache : false,
							 	        contentType : false,
							 	        processData : false,
							 	        success : function(data) { // 처리가 성공할 경우
						                    // 에디터에 이미지 출력
							 	        	$(editor).summernote('editor.insertImage', data.url);
							 	        },
							 	        error:function(request,status,error){
							 	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							 	   		
							 	        
							 	        }

							 	    });	
							 	} 
								
							 	function deleteFile(src) {
									
						    	    $.ajax({
						    	        data: {src : src},
						    	        type: "POST",
						    	        url: "<%= request.getContextPath() %>/deleteImg", // replace with your url
						    	        cache: false,
						    	        success: function(data) {
						    	            console.log(data);
						    	            alert('삭제완료');
						    	        }
						    	    });
						    	    
						    	}
								
							 	$(function(){
									$("input[name=classify]").each(function(){
										var type = "<%= b.getNoticeType() %>";
										
										console.log(type);
										
											
									 	switch(type){
											
									 		case "A" : $("#classifya").prop("checked", true); break;
											case "B" : $("#classifyb").prop("checked", true); break;
											case "C" : $("#classifyc").prop("checked", true); break;
											case "D" : $("#classifyd").prop("checked", true); break;
											case "E" : $("#classifye").prop("checked", true); break;
										}  
										
									});
								}); 
								
								
							 	 $(function(){
										$('#testFile').click(addFileForm);
										$(document).on('click', '.button-delete-file', function(event) {
										
										if(count > 1){
											if(count == 3){
												var con = document.getElementById("insertFileAdd2");
												con.style.display= 'none';
												$("#insertFile2").val("");
												$("#file_route2").val("");
												$("#FileName2").val("");
												
											}else{
												var con = document.getElementById("insertFileAdd1");
												con.style.display= 'none';
												$("#insertFile1").val("");
												$("#file_route1").val("");
												$("#FileName1").val("");
											}
											
											count--;
										}
										});
									});
									var count = 1;
									
									if(<%=attachCount%> == 2){
										count = 2;
									}else if(<%=attachCount%> == 3){
										count = 3;
									}
									console.log("count : " + count);
									
									function addFileForm() {
										
										
										if(count < 3){
											if(count == 1){
												var con = document.getElementById("insertFileAdd1");
												con.style.display = 'block';
												
											}else{
												var con = document.getElementById("insertFileAdd2");
												con.style.display = 'block';
											}
											count++;
										
										}else{
											alert("첨부파일은 최대 3개까지 등록가능합니다.")
										}
									} 
								
								
							</script>
		</article>
	</div>
	</main>


	</div>
</body>
</html>