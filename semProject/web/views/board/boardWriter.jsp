<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시글 등록 화면</title>

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
.field_regist{
    margin-top: 20px;
    margin-bottom: 26px;
}

.field_foot_btn:hover{
	cursor:pointer;

}


.radio-list{/* width:300px; */ /* margin:20px auto 0; */}
.radio-list li{position:relative; font-size:13px; color:#000; border:1px solid #e2e2e2; background:#fbfbfb; padding:6px 10px; margin-bottom:-1px;}
.radio-list li.active{font-weight:bold;}
.radio-list li label span{display:inline-block; width:12px; height:12px; background:url(<%=request.getContextPath()%>/images/common/radio_btn_off.gif) 0 0 no-repeat; vertical-align:middle; margin-right:10px;}
.radio-list li.active span{background:url(<%=request.getContextPath()%>/images/common/radio_btn_on.gif) 0 0 no-repeat;}
.radio-list li label input{position:absolute; top:11px; left:10px; width:12px; height:12px; opacity:0; -webkit-filter:alpha(opacity=0); filter:alpha(opacity=0);}

.radio-list1 li{position:relative; font-size:13px; color:#000; border:1px solid #e2e2e2; background:#fbfbfb; padding:6px 10px; margin-bottom:-1px;}
.radio-list1 li.active{font-weight:bold;}
.radio-list1 li label span{display:inline-block; width:12px; height:12px; background:url(<%=request.getContextPath()%>/images/common/radio_btn_off.gif) 0 0 no-repeat; vertical-align:middle; margin-right:10px;}
.radio-list1 li.active span{background:url(<%=request.getContextPath()%>/images/common/radio_btn_on.gif) 0 0 no-repeat;}
.radio-list1 li label input{position:absolute; top:11px; left:10px; width:12px; height:12px; opacity:0; -webkit-filter:alpha(opacity=0); filter:alpha(opacity=0);}
 



</style>

<script>
$(document).ready(function(){
	 
    $(".radio-list li label").click(function(){
 
        var list = $(".radio-list li");
        var thisList = $(this).parent("li");
        var checkRadio = $(this).children("input").is(":checked"); //체크유무 (체크면 true, 아니면 false)
        
        if ( checkRadio == true ) {
            list.removeClass("active");
            thisList.addClass("active");
        }else{
            list.removeClass("active");
            thisList.removeClass("active");
        }
        
    });
    
    $(".radio-list1 li label").click(function(){
    	 
        var list = $(".radio-list1 li");
        var thisList = $(this).parent("li");
        var checkRadio = $(this).children("input").is(":checked"); //체크유무 (체크면 true, 아니면 false)
        
        if ( checkRadio == true ) {
            list.removeClass("active");
            thisList.addClass("active");
        }else{
            list.removeClass("active");
            thisList.removeClass("active");
        }
        
    });
 
})



</script>

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
						src="<%=request.getContextPath()%>/images/common/img_media_newsletter1.jpg" style="width:100%"
						alt="공지사항 배경 이미지 입니다." class="img_rwd">
				</div>
				<div class="layer">
					<h1 class="tit_comm">Notice</h1>
					<p class="txt_comm">게시글 등록하기</p>
				</div>
			</header>
			<!-- <form id ="insertForm" action="/sp/write" method="post" id="frm"> -->
			<form id ="insertForm"  method="post" id="frm" encType="multipart/form-data">
				<div class="cont_comm">
					<div class="box_comm">
						<div class="detailview_wrap">
							<div class="field_tit">
								<div class="title1">제목</div>
								<div class="title2" style="border:1.2px solid black;">

									<input type="text" style="width: 100%; color: #8C8C8C;"
										name="noticeTitle" id="noticeTitle" value="" />


								</div>


							</div>

							<div class="field_regist">
								<div class="item_wrap">
									<div class="item">
										<dl>
											<dt>등록일</dt>
											<dd></dd>
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
								<div class="notice2" style="cursor:pointer;">
									<!-- <input type="radio" style="width: 16px; height: 16px;"
										name="viewType" id="viewTypea" value="A" />등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" style="width: 16px; height: 16px;"
										name="viewType" id="viewTypeb" value="B" /> 등록안함 -->
								
								<ul class="radio-list">
							    <li class="active" style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span><input type="radio" name="viewType" id="viewTypea" 
							            	value="A" title="등록" checked="checked" />등록
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span><input type="radio" name="viewType" id="viewTypeb" value="B" title="등록안함" />등록안함
							        </label>
							    </li>
							</ul>
								</div>
							</div>

							<br>
							
							<div class="boardType">
								<div class="type1">글종류</div>
								<div class="type2">
									<!-- <label><input type="radio"
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
										id="classifye" value="E" />&nbsp;펀딩tip</label> -->
							<ul class="radio-list1">
							    <li class="active" style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span><input type="radio" name="classify" id="classifya" 
							            	value="A" title="안내" checked="checked" />안내
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span><input type="radio" name="classify" id="classifyb" value="B" title="모집" />모집
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span><input type="radio" name="classify" id="classifyc" value="C" title="이벤트" />이벤트
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span><input type="radio" name="classify" id="classifyd" value="D" title="일반" />일반
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span><input type="radio" name="classify" id="classifye" value="E" title="펀딩tip" />펀딩tip
							        </label>
							    </li>
							</ul>
								</div>
							</div>





							<div class="field_content article_intro">
								<!-- <textarea id="ir1" class="content" cols="10" placeholder=""
									name="content" class="form-control"></textarea> -->
									<div id="summernote"></div>
									<input type="hidden" value="" name="mainText" id="mainText">
							</div>
	<!-- </form> -->

							<div id="insertFileDiv" class="field_content article_intro file_input">
								<a id="testFile" >첨부파일 + (최대 3개)</a>
								<br>
								<br>
								<label>File Attach
									<input type="file" id='insertFile0' name='insertFile0' multiple onchange="javascript:document.getElementById('file_route0').value=this.value"/>
								</label>
								<input type="text" readonly="readonly" title="File Route0" id="file_route0">
								
								<div id="insertFileAdd1" style="display:none;">
									<label>File Attach
									<input type="file" id='insertFile1' name='insertFile1' multiple onchange="javascript:document.getElementById('file_route1').value=this.value"/>
								</label>
								<input type="text" readonly="readonly" title="File Route1" id="file_route1">
								<a class='button-delete-file'>삭제</a>
								</div>
								
								<div id="insertFileAdd2" style="display:none;">
									<label>File Attach
									<input type="file" id='insertFile2' name='insertFile2' multiple onchange="javascript:document.getElementById('file_route2').value=this.value"/>
								</label>
								<input type="text" readonly="readonly" title="File Route2" id="file_route2">
								<a class='button-delete-file'>삭제</a>
								</div>
								
							</div>

							<div class="field_foot_btn">
								<a onclick="allBoard();" class="link_list">목록</a>
								<button style="margin-left: 40px;" onclick="insertBoard();" id="save" class="link_list">등록</button>
								<!-- <a onclick="insertBoard2();"> test</a> -->
							</div>
						</div>
					</div>
				</div>
			</form>
							<script>
							
							function insertBoard2(){
								console.log("11");
								$("#insertFileAdd2").remove();
								
							}
							
								function allBoard(){
									location.href="<%=request.getContextPath()%>/allBoard";
								}
								function insertBoard(){
									
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
										
										/* console.log(document.getElementById('insertFile0').value);
										console.log(document.getElementById('insertFile1').value);
										console.log(document.getElementById('insertFile2').value); */
										
										if(document.getElementById('insertFile0').value == ""){
											count++;
											$("#insertFileAdd0").remove();
										}
										if(document.getElementById('insertFile1').value == ""){
											count++;
											$("#insertFileAdd1").remove();
										}
										if(document.getElementById('insertFile2').value == ""){
											count++;
											$("#insertFileAdd2").remove();
										}
										
										$('#mainText').val(code);
										$("#insertForm").attr("action", "<%=request.getContextPath()%>/write?count="+count);
									}
								}
								
								$(document).ready(function() {
									  $('#summernote').summernote();
									});
								
								
								$('#summernote').summernote({
									  height: 300,                 // set editor height
									  minHeight: 400,             // set minimum height of editor
									  maxHeight: null,             // set maximum height of editor
									  focus: true,                  // set focus to editable area after initializing summernote
									
										  
										 /*     toolbar: [
											    ['style', ['bold', 'italic', 'underline', 'clear']],
											    ['font', ['strikethrough', 'superscript', 'subscript']],
											    ['fontsize', ['fontsize']],
											    ['height', ['height']]
											    ['color', ['color']],
											    ['para', ['ul', 'ol', 'paragraph']],
											    ['table', ['table']],
											    ['link', ['link']],
											    ['picture', ['picture']],
											    ['video', ['video']],
											    ['fullscreen', ['fullscreen']],
											    ['help', ['help']]
											  ],     */
									  
									  callbacks: { // 콜백을 사용
					                        // 이미지를 업로드할 경우 이벤트를 발생
										    onImageUpload: function(files, editor, welEditable) {
										    	 console.log(files);
									        	  console.log(editor);
									        	  console.log(welEditable);
									        	  
									        	 /*  var opt = {};
										          for (var i = files.length - 1; i >= 0; i--) {
										        	files[i]; //해당파일들을 ajax로 한번씩 FormData로담아서 보내거나 다양하게 처리하시믄됩니다.		        	
										          } */
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
							 	        /* url : "./summernote_imageUpload.jsp", */
							 	       <%--  url : "<%= request.getContextPath()%>/views/board/boardImageUpload.jsp", --%>
							 	    	url : "<%= request.getContextPath() %>/imageBoard",
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
										$('#testFile').click(addFileForm);
										$(document).on('click', '.button-delete-file', function(event) {
										
										if(count > 1){
											if(count == 3){
												var con = document.getElementById("insertFileAdd2");
												con.style.display= 'none';
												$("#insertFile2").val("");
												$("#file_route2").val("");
												
											}else{
												var con = document.getElementById("insertFileAdd1");
												con.style.display= 'none';
												$("#insertFile1").val("");
												$("#file_route1").val("");
											}
											
											count--;
										}
										});
									});
									var count = 1;
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