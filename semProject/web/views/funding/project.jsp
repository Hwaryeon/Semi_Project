<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%--   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 --%>
 <html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<title>프로젝트 신청</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="<%=request.getContextPath()%>/js/common/scroll.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background: #f5f5f5;
}

#login, #popCloseBtn {
	width: 100px;
	height: 30px;
}

#login {
	border: 1px solid;
	background-color: #05a7e2;
	color: #fff;
}

#popCloseBtn {
	border: 1px solid;
	color: #05a7e2;
	background-color: #fff;
}

#popupDiv {
	top: 0px;
	position: absolute;
	background: #fff;
	width: 400px;
	height: 220px;
	display: none;
	text-align: center;
	font-size: 17pt;
}

#popup_mask {
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none;
	background-color: #000;
	opacity: 0.8;
}

.title {
	height: 200px;
	margin: 30px;
	font-size: 25pt;
	text-align: center;
}

.title #bold {
	font-weight: bold;
}

#header {
	height: 100px;
	line-height: 100px;
	font-size: 30px;
	border-bottom: 3px solid #000;
	text-align: center;
	background: white;
}

#footer {
	border-top: 1px solid #666;
	height: 70px;
	line-height: 70px;
	text-align: center;
}

#content {
	position: relative;
	width: 100%;
	height: 200px;
	display: inline-block;
	background: #f5f5f5;
}

.left {
	position: absolute;
	width: 50%;
	height: 300px;
	left: 50px;
}

.bt1 {
	width: 200px;
	height: 50px;
	background-color: #05a7e2;
	border-color: #bbb;
	/* position : relative;
		left : 500px;
		top : 100px; */
	color: #fff;
	margin-top: -10px;
}

.bt2 {
	width: 200px;
	height: 50px;
	border-color: #bbb;
	color: #05a7e2;
	/* position : relative; */
	/* left: 900px;
		top: 100px; */
	background-color: #fff;
	font-size: 400;
	margin-top: -10px;
}

#content .pro {
	width: 50%;
	margin: 0 auto;
}

#content .btn {
	width: 595px;
	border: 1px solid;
	border-top: 0px solid;
	margin: 0 auto;
}

#content .picture {
	width: 600px;
	margin: 0 auto;
}

.success {
	font-size: 30pt;
	position: relative;
	height: 500px;
	text-align: center;
}

#submit {
	/* width: 18%;
   	 	left: 210px;
    	position: absolute;
    	top: 110px; */
	float: left;
	margin-right: 40px;
}

#info {
	/* width: 22%;
   	 	left: 800px;
    	position: absolute;
    	top: 110px; */
	
}
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp"%>
	<header class="head_banner">
		<div class="hero">
			<img
				src="<%=request.getContextPath()%>/images/common/img_company_ceo1.jpg"
				style="width: 100%;" alt="공지사항 배경 이미지 입니다." class="img_rwd">
		</div>
		<div class="layer">
			<!-- <h1 class="tit_comm">Manager</h1>
							<p class="txt_comm">관리자 페이지</p> -->
		</div>
	</header>

	<!-- <br><br><br><br><br><br><br><br>
	<div class="title">
		여러분의 아이디어를 펀딩 받아보세요!
	</div> -->
<div style="min-width:1000px;">
	<hr style="width: 100%;">
	<section id="content"
		style="position: relative;  min-height: 200px; display: inline-block; background: #f5f5f5; margin-left: 147px; min-width: 1250px;">
		<div style="min-width:800px;width: 1400px;">
			<div style="margin-left: 70px; margin-top: 73px; float: left;">
				<div id="submit">프로젝트를 신청하시겠습니까?</div>
				<button id="popOpenBtn" class="bt1" type="button">프로젝트 신청하기</button>
			</div>

			<div style="float: left; margin-left: 2%; margin-top: 73px;">
				<div id="info" style="float: left; margin-left: 40px;">프로젝트 신청
					전에 규정을 읽어보세요</div>
				<button class="bt2" type="button"
					style="float: left; margin-left: 40px;">규정 알아보기</button>
			</div>
		</div>
	</section>
</div>
	<!-- <div class="success">
	<hr>
	<br><br><br><br>
		성공 사례 페이지
	</div>
 -->
	<div id="popup_mask"></div>

	<div id="popupDiv">

		<p>
			<br>로그인이 필요한 기능입니다.<br> 로그인 화면으로 이동하시겠습니까?
		</p>
		<hr>
		<button id="login">>로그인하기</button>
		<button id="popCloseBtn">취소</button>
	</div>


	<script>
    
    $(document).ready(function(){
        
        $("#popOpenBtn").click(function(event){   
 
             $("#popupDiv").css({
                "top": (($(window).height()-$("#popupDiv").outerHeight())/2+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#popupDiv").outerWidth())/2+$(window).scrollLeft())+"px"
                
             
             }); 
            
            $("#popup_mask").css("display","block"); 
            $("#popupDiv").css("display","block"); 
            
            $("body").css("overflow","hidden");
        });
        
        $("#popCloseBtn").click(function(event){
            $("#popup_mask").css("display","none"); 
            $("#popupDiv").css("display","none"); 
            $("body").css("overflow","auto");
        });
    });
    
    $(function(){
    	$("#login").click(function(){
    		location.href="<%=request.getContextPath()%>/ptype";
    	})
    })
 
 
    </script>

	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- <footer id="footer">
	Copyright (C) 2018 
</footer>  -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>