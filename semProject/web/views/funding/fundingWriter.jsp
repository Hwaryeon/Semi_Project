<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.sp.funding.model.vo.*, java.util.*"%>
<%
	ProductType productType1 = null;
	ProductType productType2 = null;
	ProductType productType3 = null;

	ArrayList<ProductType> productType = (ArrayList<ProductType>)request.getAttribute("productType");
	for(int i=0; i < productType.size(); i++){
		
		switch(i){
			case 0 : productType1 = productType.get(i); break;
			case 1 : productType2 = productType.get(i); break;
			case 2 : productType3 = productType.get(i); break;
		}
		
	}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>펀딩 등록 화면</title>

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

#closeTypea, #closeTypeb, #closeTypec, #feeTypea, #feeTypeb, #feeTypec, #feeTyped, #feeTypee {
    -webkit-appearance: radio;
}

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
						src="<%=request.getContextPath()%>/images/common/img_qna1.jpg" style="width:100%"
						alt="공지사항 배경 이미지 입니다." class="img_rwd">
				</div>
				<div class="layer">
					<h1 class="tit_comm">Funding</h1>
					<p class="txt_comm"></p>
				</div>
			</header>
			<form id ="insertForm" method="post" id="frm">
				<div class="cont_comm">
					<div class="box_comm">
						<div class="detailview_wrap">
							<div class="field_tit">
								<div class="title1">펀딩 제목</div>
								<div class="title2" style="border: 1.2px solid black;">

									<input type="text" style="width: 100%; color: #8C8C8C;"
										name="fundingTitle" id="fundingTitle" value="" />


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
											<dd></dd>
										</dl>
									</div>
								</div>
							</div>
							<div class="notice">
								<div class="notice1">마감방식 선택</div>
								<div class="notice2">
									<%-- <input type="radio" style="width: 16px; height: 16px;"
										name="closeType" id="closeTypea" value="<%=productType1.getpCode() %>" /> <%=productType1.getpName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" style="width: 16px; height: 16px;"
										name="closeType" id="closeTypeb" value="<%=productType2.getpCode() %>" /> <%=productType2.getpName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" style="width: 16px; height: 16px;"
										name="closeType" id="closeTypec" value="<%=productType3.getpCode() %>" /> <%=productType3.getpName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 --%>
									 
									<ul class="radio-list">
							    <li class="active" style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span>
							            <input type="radio" name="closeType" id="closeTypea" 
							            	value="<%=productType1.getpCode() %>" checked="checked" />
							            	<%=productType1.getpName() %>
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span>
							            <input type="radio" name="closeType" id="closeTypeb" value="<%=productType2.getpCode() %>" />
							            	<%=productType2.getpName() %>
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span>
							            <input type="radio" name="closeType" id="closeTypec" value="<%=productType3.getpCode() %>" />
							            	<%=productType3.getpName() %>
							        </label>
							    </li>
							</ul>
									
									
									
								</div>
							</div>

							<br>

							<div class="boardType">
								<div class="type1">수수료</div>
								<div class="type2">
									<!-- <label><input type="radio"
										style="width: 16px; height: 16px;" name="feeType"
										id="feeTypea" value="1" />&nbsp;1%</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="feeType"
										id="feeTypeb" value="2" />&nbsp;2%</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="feeType"
										id="feeTypec" value="3" />&nbsp;3%</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="feeType"
										id="feeTyped" value="4" />&nbsp;4%</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio"
										style="width: 16px; height: 16px;" name="feeType"
										id="feeTypee" value="5" />&nbsp;5%</label> -->
									<ul class="radio-list1">
							    <li class="active" style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span>
							            <input type="radio" name="feeType" id="feeTypea" 
							            	value="1" checked="checked" />1%
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span>
							            <input type="radio" name="feeType" id="feeTypeb" value="2" />2%
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span>
							            <input type="radio" name="feeType" id="feeTypec" value="3"/>3%
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span>
							            <input type="radio" name="feeType" id="feeTyped" value="4" />4%
							        </label>
							    </li>
							    <li style="float:left;">
							        <label style="cursor:pointer;">
							            <span></span>
							            <input type="radio" name="feeType" id="feeTypee" value="5"/>5%
							        </label>
							    </li>
							</ul>	
										
										
								</div>
							</div>
							
							
							<div class="boardType" style="margin-bottom:0px;">
							
							
							<div class="type1">마감 금액</div>
								<label>
									<input type="number" id="cAmount" name="cAmount" min="10000" value="100000" step="100000" style="text-align: right;width: 188px;border: 1px solid black;">
								</label>
							</div>
							
							<div class="boardType" style="margin-bottom:0px;">
							<div class="type1">오픈기간</div>
								<label>
									<input type="number" id="openDate" name="openDate" 
									min="1" value="30" max="90" step="1" style="text-align: right;width: 188px;border: 1px solid black;">
								</label>
							</div>

							


							<div class="field_content article_intro">
									<div id="summernote"></div>
									<input type="hidden" value="" name="mainText" id="mainText">
							</div>


							<div class="field_foot_btn">
								<a onclick="allBoard();" class="link_list">목록</a>
								<button onclick="insertFunding();" id="save" class="link_list">등록</button>
							</div>
						</div>
					</div>
				</div>
			</form>
							<script>
							
								function allBoard(){
									location.href="<%=request.getContextPath()%>/allBoard";
								}
								function insertFunding(){
									
									var code = $('#summernote').summernote('code');
									
									if(document.getElementById('fundingTitle').value == ""){
										alert("펀딩 제목을 입력해주세요.");
									}else if((document.getElementById('closeTypea').checked == false) 
											&& (document.getElementById('closeTypeb').checked == false)
											&& (document.getElementById('closeTypec').checked == false)){
										alert("마감방식을 선택해주세요")	
									}else if((document.getElementById('feeTypea').checked) == false
											&& (document.getElementById('feeTypeb').checked) == false
											&& (document.getElementById('feeTypec').checked) == false
											&& (document.getElementById('feeTyped').checked) == false
											&& (document.getElementById('feeTypee').checked) == false
									){
										alert("수수료를 선택해주세요.")	
									}else if(((($('#summernote').summernote('code')).length) > 11) == false){
										alert("본문을 입력해주세요.")
									}else{
										
										
										$('#mainText').val(code);
										$("#insertForm").attr("action", "<%=request.getContextPath()%>/write.fn");
									}
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
							 	    	url : "<%= request.getContextPath() %>/image.fn",
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
							    	        url: "<%= request.getContextPath() %>/deleteImg.fn", // replace with your url
							    	        cache: false,
							    	        success: function(data) {
							    	            console.log(data);
							    	            alert('삭제완료');
							    	        }
							    	    });
							    	    
							    	}
								
							</script>
		</article>
	</div>
	</main>


	</div>
</body>
</html>