<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.funding.model.vo.*, java.util.*,com.kh.sp.board.model.vo.*" %>

<%HashMap<String,Object> hmap2 = (HashMap<String,Object>)request.getAttribute("hmap2");%>

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
								<div class="title1"> 제목</div>
								<div class="title2" style="border: 1.2px solid black;">

									<input type="text" style="width: 100%; color: #8C8C8C;"
										name="newsTitle" id="newsTitle" value="" />
								</div>
							</div>

							<br>
							
							</div>
							
							
							<div class="boardType" style="margin-bottom:0px;">
						
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
							
								
									function insertFunding(){
									
										var code = $('#summernote').summernote('code');
										var num = '<%=hmap2.get("pId")%>';
										var userId = '<%=loginUser.getUserId()%>';
										$('#mainText').val(code);
										
										$("#insertForm").attr("action","<%=request.getContextPath()%>/InsertNews.pm?num=" + num + "&userId=" + userId);
										
										
									}
								
								
								
								$(document).ready(function() {
									  $('#summernote').summernote();
									});
								
								$('#summernote').summernote({
									  height: 300,                 // set editor height
									  minHeight: 400,             // set minimum height of editor
									  maxHeight: 600,             // set maximum height of editor
									  focus: true,                  // set focus to editable area after initializing summernote
								});
					           
							</script>
		</article>
	</div>
	</main>


	</div>
</body>
</html>